"""
Routes and views for the bottle application.
"""

from bottle import route, view
from datetime import datetime
from bottle import route, post, request, template

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
    """Renders the about page."""
    return dict(
        title='About',
        message='Your application description page.',
        year=datetime.now().year
    )

@post('/submit')
def save_booking():
    name = request.forms.get('name')
    phone = request.forms.get('phone')
    
    # Сохраняем в файл
    with open('data.txt', 'a', encoding='utf-8') as f:
        f.write(f'Name: {name}, Phone: {phone}\n')
    
    return template('''<h2>Thanks for the request!</h2>
                    <p>We will contact you as soon as possible.</p>''')