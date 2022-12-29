from decouple import config

from .base import *

DEBUG = config('DEBUG', default=False, cast=bool)

SECRET_KEY = config('SECRET_KEY')

ALLOWED_HOSTS = ["anti-krt.spb.ru", "www.anti-krt.spb.ru"]

try:
    from .local import *
except ImportError:
    pass
