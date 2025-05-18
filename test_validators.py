# test_validators.py
import unittest
from routes import validate_feedback

VALID_NAME   = "Elizabeth"
VALID_TEXT   = "Great job! I'll come again."
VALID_DATE   = "18.05.2025"

class FeedbackValidationTests(unittest.TestCase):

    def test_valid_min_sizes(self):
        cases = [
            ("Bob", "ok", "01.01.2024"),               
            ("Alice", "x" * 200, "29.02.2024"),        
            ("Christopher", VALID_TEXT, VALID_DATE),   
            ("Jonathan", "👍"*50, VALID_DATE),         
            ("Markus", "  Trim check  ", VALID_DATE),  
            ("SAM", "Caps name", VALID_DATE),         
            ("abcdefghiJKLMN", VALID_TEXT, VALID_DATE) 
        ]
        for name, text, date in cases:
            with self.subTest(name=name, text=len(text)):
                self.assertIsNone(validate_feedback(name, text, date))

    def test_valid_names1(self):
        for name in ("Bob", "McDonald", "Elisabeth", "JoHn"):
            with self.subTest(name=name):
                self.assertIsNone(validate_feedback(name, VALID_TEXT, VALID_DATE))

    def test_invalid_name2(self):
        cases = [
            ("Al",           "short name", VALID_DATE), # <3
            ("A"*16,         VALID_TEXT,  VALID_DATE), # >15
            ("Jürgen",       VALID_TEXT,  VALID_DATE), # non-ASCII
            ("Ivan_123",     VALID_TEXT,  VALID_DATE), # 
        ]
        for name, text, date in cases:
            with self.subTest(name=name):
                err = validate_feedback(name, text, date)
                self.assertIsNotNone(err)
                self.assertIn("Name", err)

    def test_invalid_text_length(self):
        long_text = "x" * 201
        err = validate_feedback(VALID_NAME, long_text, VALID_DATE)
        self.assertIsNotNone(err)
        self.assertIn("≤ 200", err)

    def test_invalid_date_formats(self):
        cases = ["18-05-2025", "2025/05/18", "32.01.2025", "29.02.2023"]
        for bad_date in cases:
            with self.subTest(date=bad_date):
                err = validate_feedback(VALID_NAME, VALID_TEXT, bad_date)
                self.assertIsNotNone(err)
                self.assertIn("date", err.lower())

    def test_name_without_uppercase(self):
        err = validate_feedback("john", VALID_TEXT, VALID_DATE)
        self.assertIsNotNone(err)          # Достаточно

    def test_name_with_space(self):
        err = validate_feedback("John Doe", VALID_TEXT, VALID_DATE)
        self.assertIsNotNone(err)


    def test_other_name_violations(self):
        cases = ("Al", "A"*16, "Éclair")
        for bad in cases:
            with self.subTest(name=bad):
                self.assertIsNotNone(validate_feedback(bad, VALID_TEXT, VALID_DATE))

    def test_missing_fields(self):
        cases = [
            ("",        VALID_TEXT, VALID_DATE),
            (VALID_NAME, "",        VALID_DATE),
            (VALID_NAME, VALID_TEXT, ""),
        ]
        for name, text, date in cases:
            with self.subTest(missing=(name, text, date)):
                err = validate_feedback(name, text, date)
                self.assertIsNotNone(err)
                self.assertIn("required", err.lower())

if __name__ == "__main__":
    unittest.main()
