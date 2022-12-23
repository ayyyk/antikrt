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
        request.session['last_news_id'] = all_news[0]['messageId']
        return JsonResponse({
            'result': 'ok',
            'news': all_news
        })

def LastNews2(request):
    try:
        last_news_session_id = request.session['last_news_id']
        print(f'{last_news_session_id=}')
    except KeyError:
        response = {
            'result': 'ok',
            'news': []
        }
    else:
        latest_news = KrtNews.get_latest_news(last_news_session_id)
        if len(latest_news):
            request.session['last_news_id'] = latest_news[0]['messageId']
        response = {
            'result': 'ok',
            'news': latest_news
        }

    return JsonResponse(response)

def LastNews(request):
    def event_stream():
        while True:
            time.sleep(3)
            #print('тест сообщение')
            #yield 'data: The server time is: %s\n\n' % datetime.datetime.now()
            try:
                last_news_session_id = request.session['last_news_id']
                print(f'{last_news_session_id=}')
            except KeyError:
                yield
            else:
                latest_news = KrtNews.get_latest_news(last_news_session_id)
                if len(latest_news):
                    request.session[
                        'last_news_id'] = latest_news[0]['messageId']
                    latest_news_json = {
                        'dt': latest_news
                    }
                    latest_news_str = json.dumps(latest_news)
                    print('latest_news_str')
                    print(latest_news_str)
                    yield 'data: %s\n\n' % latest_news
                else: 
                    yield 'data: The server time is: %s\n\n' % datetime.datetime.now()
                    
    return StreamingHttpResponse(event_stream(), content_type='text/event-stream')