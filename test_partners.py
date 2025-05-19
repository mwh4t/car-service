import unittest
import re

VALID_AUTHOR = "Ananas"
VALID_DESCRIPTION = "Официальный поставщик автозапчастей"
VALID_PHONE = "+79318051566"


class PartnersValidationTests(unittest.TestCase):
    def validate_partner(self, author, description, phone):
        errors = {}

        if not author:
            errors['author'] = 'Поле "Наименование компании" обязательно для заполнения!'

        if not description:
            errors['description'] = 'Поле "Описание" обязательно для заполнения!'

        phone_pattern = re.compile(r'^\+7\d{10}$')
        if not phone:
            errors['phone'] = 'Поле "Телефон" обязательно для заполнения!'
        elif not phone_pattern.match(phone):
            errors['phone'] = 'Неверный формат телефона. Используйте формат +7XXXXXXXXXX'

        return errors

    def test_valid_partners(self):
        cases = [
            (VALID_AUTHOR, VALID_DESCRIPTION, VALID_PHONE),
            ("МастерСервис", "Ремонт двигателей и КПП", "+79031234567"),
            ("Car Wash Pro", "Автомойка премиум класса", "+78005553535"),
            ("ДетальПром", "Запчасти для грузовых авто", "+74957654321"),
            ("Шины и диски", "Огромный выбор на любой вкус", "+79261112233")
        ]

        for author, description, phone in cases:
            with self.subTest(author=author, phone=phone):
                errors = self.validate_partner(author, description, phone)
                self.assertEqual({}, errors, f"Valid data should have no errors: {author}")

    def test_missing_fields(self):
        cases = [
            ("", VALID_DESCRIPTION, VALID_PHONE),
            (VALID_AUTHOR, "", VALID_PHONE),
            (VALID_AUTHOR, VALID_DESCRIPTION, ""),
            ("", "", VALID_PHONE),
            ("", VALID_DESCRIPTION, ""),
            (VALID_AUTHOR, "", ""),
            ("", "", "")
        ]

        for author, description, phone in cases:
            with self.subTest(author=author, desc=description, phone=phone):
                errors = self.validate_partner(author, description, phone)
                self.assertNotEqual({}, errors, "Empty fields should cause errors")

                if not author:
                    self.assertIn('author', errors)
                if not description:
                    self.assertIn('description', errors)
                if not phone:
                    self.assertIn('phone', errors)

    def test_invalid_phone_formats(self):
        invalid_phones = [
            "89991234567",
            "+7999123456",
            "+799912345678",
            "+7abc1234567",
            "+7(999)1234567",
            "+7 999 123 45 67",
            "123-456-7890",
            "+380991234567"
        ]

        for phone in invalid_phones:
            with self.subTest(phone=phone):
                errors = self.validate_partner(VALID_AUTHOR, VALID_DESCRIPTION, phone)
                self.assertIn('phone', errors, f"Invalid phone should cause error: {phone}")
                self.assertIn('формат', errors['phone'], "Error message should mention format")

    def test_valid_phone_formats(self):
        valid_phones = [
            "+79991234567",
            "+78005553535",
            "+74957654321",
            "+79261112233",
            "+79871234567"
        ]

        for phone in valid_phones:
            with self.subTest(phone=phone):
                errors = self.validate_partner(VALID_AUTHOR, VALID_DESCRIPTION, phone)
                self.assertNotIn('phone', errors, f"Valid phone should not cause error: {phone}")

    def test_author_validation(self):
        test_cases = [
            ("", False),
            ("A", True),
            ("Auto Parts", True),
            ("12345", True),
            ("АвтоМир", True),
            ("Auto-Parts", True),
            ("Car&Service", True)
        ]

        for author, is_valid in test_cases:
            with self.subTest(author=author):
                errors = self.validate_partner(author, VALID_DESCRIPTION, VALID_PHONE)

                if is_valid:
                    self.assertNotIn('author', errors)
                else:
                    self.assertIn('author', errors)

    def test_description_validation(self):
        test_cases = [
            ("", False),
            ("Good", True),
            ("Х" * 500, True),
            ("Ремонт и обслуживание", True),
            ("Service & Maintenance", True),
            ("  Description with spaces  ", True)
        ]

        for description, is_valid in test_cases:
            with self.subTest(description=description[:10] + "..."):
                errors = self.validate_partner(VALID_AUTHOR, description, VALID_PHONE)

                if is_valid:
                    self.assertNotIn('description', errors)
                else:
                    self.assertIn('description', errors)


if __name__ == "__main__":
    unittest.main()
