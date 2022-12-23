"""
telegram model functions testing
"""

from decouple import config

import requests

from django.core.management.base import BaseCommand, CommandError

from telegram.loggers import logger
from telegram.models import KrtNews

TELEGRAM_URL = "https://api.telegram.org/"
TELEGRAM_PORT = '8443'
BOT_TOKEN = config('BOT_TOKEN')
URL = "https://3264-178-252-80-5.eu.ngrok.io"
FILE_ID = 'BQACAgIAAx0CTMOMqQADQWOZgeSppeGIv6RStbbtJPBWbCkKAAKSJQACi1zISGIDGocaUvOYLAQ',

class Command(BaseCommand):
    help = 'Telegram model functions testing'
    def handle(self, *args, **options):
        # response = requests.post(
        #     f"{TELEGRAM_URL}bot{BOT_TOKEN}/getFile",
        #     data={
        #         'file_id': FILE_ID,
        #     }
        # )
        #logger.info(f'{response.text}')
        #https://api.telegram.org/file/bot<token>/<file_path>
        response = requests.post(
            f"https://api.telegram.org/file/bot{BOT_TOKEN}/thumbnails/file_0.jpg",
            data={
                'file_id': FILE_ID,
            }
        )
        logger.info(f'{response.text}')
        #logger.info(KrtNews.get_last_news())