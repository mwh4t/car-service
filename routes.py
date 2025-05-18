"""
Routes and views for the bottle application.
"""

from bottle import route, view, post, request, template, redirect, static_file, response
import os, json
from datetime import datetime
from bottle import HTTPResponse

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
    return dict(
        title='About',
        message='Your application description page.',
        year=datetime.now().year,
        feedbacks=feedbacks
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
    name      = request.forms.get('name', '').strip()
    text      = request.forms.get('text', '').strip()
    date_raw  = request.forms.get('date', '').strip()

    if not (name and text and date_raw):
        return template('error.tpl',
                        message='All fields are required!',
                        year=datetime.now().year)

    try:
        datetime.strptime(date_raw, '%d.%m.%Y')
    except ValueError:
        return template('error.tpl',
                        message='Incorrect date format (DD.MM.YYYY).',
                        year=datetime.now().year)

    feedbacks = load_data()
    feedbacks.append({'name': name, 'text': text, 'date': date_raw})
    save_data(feedbacks)

    return HTTPResponse(status=303, headers={'Location': '/about'})

@route('/static/<filepath:path>')
def server_static(filepath):
    """Serves static files"""
    return static_file(filepath, root='static')