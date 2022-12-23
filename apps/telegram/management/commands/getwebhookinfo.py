"""
commands for working with telegram webhook bot servise
"""

from decouple import config

import requests

from django.core.management.base import BaseCommand, CommandError

from telegram.loggers import logger

TELEGRAM_URL = "https://api.telegram.org:8443/bot"
BOT_TOKEN = config('BOT_TOKEN')
URL = "https://3264-178-252-80-5.eu.ngrok.io"

class Command(BaseCommand):
    help = 'Get webhook info about connection to telegram'

    def handle(self, *args, **options):
        # https://api.telegram.org/bot<token>/setWebhook?url=<url>/webhooks/tutorial/

        response = requests.post(
            #f"{TELEGRAM_URL}{BOT_TOKEN}/setWebhook?url={URL}:8443/antikrtnews/"
            f"{TELEGRAM_URL}{BOT_TOKEN}/getWebhookInfo"
            #https://api.telegram.org/bot5930617634:AAFYuuJlosjlcIT16uNkW-6dYUQwHLZ8Sh4/getWebhookInfo
        )

        logger.info(response.text)