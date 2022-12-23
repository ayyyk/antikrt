"""
commands for working with telegram webhook bot servise
"""

from decouple import config

import requests

from django.core.management.base import BaseCommand, CommandError

from telegram.loggers import logger

TELEGRAM_URL = "https://api.telegram.org/bot"
BOT_TOKEN = config('BOT_TOKEN')
URL = "https://1fbd-178-252-80-5.eu.ngrok.io"

# https://api.telegram.org/bot<token>/setWebhook?url=<url>/webhooks/tutorial/

class Command(BaseCommand):
    help = 'Set webhook for telegram bot'
    def handle(self, *args, **options):
        response = requests.post(
            f"{TELEGRAM_URL}{BOT_TOKEN}/setWebhook?url={URL}/telegram/"
        )
        logger.info(response.text)


# @staticmethod
#     def send_message(message, chat_id):
#         data = {
#             "chat_id": chat_id,
#             "text": message,
#             "parse_mode": "Markdown",
#         }
#         response = requests.post(
#             f"{TELEGRAM_URL}{BOT_TOKEN}/sendMessage", data=data
#         )
#         logger.info(response.text)