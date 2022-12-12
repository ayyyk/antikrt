import os, sys
sys.path.insert(0, '/var/www/u0863135/data/www/anti-krt.spb.ru/project_name')
sys.path.insert(1, '/var/www/u0863135/data/antienv/lib/python3.9/site-packages')
os.environ['DJANGO_SETTINGS_MODULE'] = 'antikrt.settings.base'
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()