"""
Routes and views for the bottle application.
"""

from bottle import route, view, post, request, template, redirect, static_file, response
import os, json
from datetime import datetime
from bottle import HTTPResponse
import re

NAME_RE = re.compile(r'^(?=.*[A-Z])[A-Za-z]{3,15}$')

FEEDBACK_FILE = os.path.join('data', 'feedbacks.json')

def load_data():
    try:
        with open(FEEDBACK_FILE, encoding='utf-8') as f:
            return json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        return []

def save_data(data):
    os.makedirs(os.path.dirname(FEEDBACK_FILE), exist_ok=True)
    with open(FEEDBACK_FILE, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year
    )

@route('/contact')
@view('contact')
def contact():
    """Renders the contact page."""
    return dict(
        title='Contact',
        message='Your contact page.',
        year=datetime.now().year
    )

@route('/about')
@view('about')
def about():
    feedbacks = load_data()
    feedbacks_to_show = feedbacks[-5:]
    return dict(
        title='About',
        message='Your application description page.',
        year=datetime.now().year,
        feedbacks=feedbacks_to_show
    )


@post('/submit')
def save_booking():
    """Handles booking form submission"""
    name = request.forms.get('name')
    phone = request.forms.get('phone')
    
    with open('data.txt', 'a', encoding='utf-8') as f:
        f.write(f'Name: {name}, Phone: {phone}\n')
    
    return template('''<h2>Thanks for the request!</h2>
                    <p>We will contact you as soon as possible.</p>''')

@post('/about/submit-feedback')
def submit_feedback():
    name     = request.forms.get('name', '').strip()
    text     = request.forms.get('text', '').strip()
    date_raw = request.forms.get('date', '').strip()

    error = validate_feedback(name, text, date_raw)
    if error:
        return template('error.tpl', message=error, year=datetime.now().year)



    if not NAME_RE.fullmatch(name):
        return template('error.tpl',
                        message='Name must be 3-15 English letters (A-Z, a-z).',
                        year=datetime.now().year)

    if len(text) > 200:
        return template('error.tpl',
                        message='Feedback must be ≤ 200 characters.',
                        year=datetime.now().year)

    try:
        datetime.strptime(date_raw, '%d.%m.%Y')
    except ValueError:
        return template('error.tpl',
                        message='Incorrect date format (DD.MM.YYYY).',
                        year=datetime.now().year)

    if is_duplicate(feedbacks, name, text, date_raw):
        return template('error.tpl',
                    message='A feedback with the same name, text and date already exists.',
                    year=datetime.now().year)
    

    feedbacks = load_data()
    feedbacks.append({'name': name, 'text': text, 'date': date_raw})
    save_data(feedbacks)

    return HTTPResponse(status=303, headers={'Location': '/about'})

@route('/static/<filepath:path>')
def server_static(filepath):
    """Serves static files"""
    return static_file(filepath, root='static')

def validate_feedback(name: str, text: str, date_raw: str):
    name = (name or '').strip()
    text = (text  or '').strip()
    date_raw = (date_raw or '').strip()

    if not (name and text and date_raw):
        return 'All fields are required!'

    if not NAME_RE.fullmatch(name):
        return 'Name must be 3–15 English letters (A-Z, a-z).'

    if len(text) > 200:
        return 'Feedback must be ≤ 200 characters.'

    try:
        datetime.strptime(date_raw, '%d.%m.%Y')
    except ValueError:
        return 'Incorrect date format (DD.MM.YYYY).'

    feedbacks = load_data()
    if is_duplicate(feedbacks, name, text, date_raw):
        return template('error.tpl',
                        message='Such feedback already exists.',
                        year=datetime.now().year)

    feedbacks.append({'name': name, 'text': text, 'date': date_raw})
    save_data(feedbacks)

    return None

def is_duplicate(feedbacks: list[dict], name: str, text: str, date: str) -> bool:
    for fb in feedbacks:
        if (fb.get("name") == name and
            fb.get("text") == text and
            fb.get("date") == date):
            return True
    return False