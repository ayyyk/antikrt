from decouple import config

import datetime
import json
import time

from django.http import JsonResponse, StreamingHttpResponse
from django.views import View

from .loggers import logger
from .models import KrtNews

class AllNews(View):
    def get(self, request, *args, **kwargs):
        all_news = KrtNews.get_all_news()
        request.session['last_news_id'] = all_news[0][0] 
        return JsonResponse({
            'result': 'ok',
            'news': all_news
        })

def LastNews2(request):
    try:
        latest_news = KrtNews.get_latest_news(request.session['last_news_id'])
    except KeyError:
        response = {
            'result': 'ok',
            'news': []
        }
    else:
        if len(latest_news):
            request.session['last_news_id'] = latest_news[0][0]
        response = {
            'result': 'ok',
            'news': latest_news
        }

    return JsonResponse(response)
