"""
commands for working with telegram webhook bot servise
"""

from decouple import config

import requests

from django.core.management.base import BaseCommand, CommandError

from telegram.loggers import logger

TELEGRAM_URL = "https://api.telegram.org:8443/bot"
BOT_TOKEN = config('BOT_TOKEN')

# https://api.telegram.org/bot<token>/setWebhook?url=<url>/webhooks/tutorial/

class Command(BaseCommand):
    help = 'Send message into the channel'
    def handle(self, *args, **options):
        data = {
            "chat_id": chat_id,
            "text": message,
            "parse_mode": "Markdown",
        }
        response = requests.post(
            f"{TELEGRAM_URL}{BOT_TOKEN}/sendMessage", data=data
        )
        logger.info(response.text)