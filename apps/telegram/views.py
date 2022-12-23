from decouple import config

import json

from django.http import JsonResponse
from django.views import View

from krtnews.models import KrtNews

from .loggers import logger

#CHANNEL_ID = config('CHANNEL_ID')
TEST_CHANNEL_ID = -1001287883945

class Telegram(View):
    def post(self, request, *args, **kwargs):
        full_message = json.loads(request.body)
        logger.info(f"{full_message=}")
        try:
            isPost = full_message[
                'channel_post']['chat']['id']==TEST_CHANNEL_ID
        except KeyError:
            try:
                isEdit = full_message[
                    'edited_channel_post']['chat']['id']==TEST_CHANNEL_ID
            except KeyError:
                logger.info('bad source')
            else:
                result = KrtNews.edit_post(full_message)
        else:
            KrtNews.add_news(full_message)
        
        return JsonResponse({"ok": "POST request processed"})