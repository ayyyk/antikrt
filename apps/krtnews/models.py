from decouple import config

import json
from datetime import datetime

from django.utils.timezone import make_aware
from django.db import models

from .loggers import logger

MESSAGE_LENGTH = 150

class KrtNews(models.Model):
    class Meta():
        verbose_name_plural = 'KrtNews'

    messageId = models.PositiveSmallIntegerField(
        'Message id from the channel', 
        primary_key=True,
        unique=True, 
    )

    message_date = models.DateTimeField(
        'Message date from the channel',
    )

    message = models.CharField(
        'Message from channel', 
        max_length=MESSAGE_LENGTH
    )

    file_id = models.CharField(
        'attached image id in telegram api', 
        null=True,
        max_length=100
    )

    full_message = models.JSONField(
        'Full message from the channel',
    )

# ['http://vk.com/club123456768', 'http://vk.com/club42']
# url_pattern = r'\[url\](.*?)\[\/url\]'
# urls = re.findall(url_pattern, corrected_message)
# for link in urls:
#     link_index = corrected_message.find(link)
#     if (link_index<message_length
#             and (link_index+len(link))>message_length):
#         corrected_message = corrected_message[:link_index]
#         break
#else:

    @staticmethod
    def corrected_message(message, message_length):
        message3 = message.replace('\n', ' ') 
        while True:
            message2 = message3
            message3 = message3.replace('  ', ' ')
            if len(message2)==len(message3): break

        if len(message3)>message_length:
            message2 = message3[:message_length]
            if not message3[message_length] in [' ', '!', '?', '.', ',']:
                divIndex = max(message2.rfind(' '),
                                message2.rfind('!'),
                                message2.rfind('?'),
                                message2.rfind('.'),
                                message2.rfind(','))
                message2 = message2[:divIndex] if divIndex>=0 else ''

        return message2.strip()

    @classmethod
    def add_news(cls, full_message):
        try:
            tmp_message_text = full_message['channel_post']['text']
        except KeyError:
            try:
                tmp_message_text = full_message['channel_post']['caption']
            except KeyError:
                tmp_message_text = None

        if not tmp_message_text is None:
            message_text = cls.corrected_message(tmp_message_text, 
                                                MESSAGE_LENGTH)

            message_id = int(full_message['channel_post']['message_id'])
            message_date = make_aware(datetime.fromtimestamp(
                int(full_message['channel_post']['date']))).isoformat()

            try:
                file_id = full_message['channel_post']['document']['file_id']
            except KeyError:
                file_id = None

            print(message_id, 'add_news')

            new_news = cls(
                messageId=message_id, 
                message_date=message_date,
                message=message_text,
                file_id=file_id,
                full_message=full_message,
            )

            new_news.save()

            if cls.objects.all().count()>100:
                cls.objects.all().order_by('messageId').first().delete()

    @classmethod
    def edit_post(cls, full_message):
        message_id = int(full_message['edited_channel_post']['message_id'])
        try:
            elem = cls.objects.get(messageId=message_id)
        except KeyError:
            logger.info('редактируемый элемент не найден')
            #logger.info(f'{full_message=}')
        else:
            try:
                tmp_message_text =  full_message['edited_channel_post']['text']
            except KeyError:
                try:
                    tmp_message_text = full_message[
                        'edited_channel_post']['caption']
                except KeyError:
                    tmp_message_text = 'Новое сообщение на нашем канале доступно!'

        elem.message = cls.corrected_message(tmp_message_text, MESSAGE_LENGTH)
        elem.save()

    @classmethod
    def get_all_news(cls):
        all_news = cls.objects.all().order_by('-messageId').values()[:10]
        all_news_json = list()
        for elem in all_news:
            all_news_json.append({
                'messageId': elem['messageId'],
                'message_date': elem['message_date'],
                'message': elem['message']
            })
        return all_news_json

    @classmethod
    def get_latest_news(cls, last_id):
        print(f'{last_id=}')
        latest_news = cls.objects.filter(
        	messageId__gt=last_id).order_by('-messageId').values()
        
        latest_news_json = list()
        for elem in latest_news:
            latest_news_json.append({
                'messageId': elem['messageId'],
                'message_date': elem['message_date'],
                'message': elem['message']
            })
        print(latest_news_json)
        return latest_news_json

    def __str__(self):
        return self.name