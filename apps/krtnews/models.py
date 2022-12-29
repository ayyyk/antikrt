from decouple import config

import json
from datetime import datetime

from django.utils.timezone import make_aware
from django.db import models

from .loggers import logger

MESSAGE_LENGTH = 150
DIVIDERS = [' ', '!', '?', '.', ',']
TERMINATORS = ['.', '?', '!']

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

    @staticmethod
    def corrected_message(self, message, message_length):
        def corrected_message2(message, message_length):
            mes = message.replace('\n', ' ') 
            while True:
                if len(mes)==len(mes:=mes.replace('  ', ' ')): 
                    break
            if len(mes)<=message_length:
                return mes
            mes2 = mes[:message_length]
            if not mes[message_length] in DIVIDERS:
                newLen = max(mes2.rfind(ch) for ch in DIVIDERS)
                mes2 = mes2[:newLen] if newLen!=-1 else ''
            return mes2.strip()

        if not message:
            return message
        try:
            limIndex = min(ind for ch in TERMINATORS 
                if (ind:=message.find(ch))!=-1 and ind<=message_length)
        except ValueError:
            mes = corrected_message2(message, message_length)
        except Exception as err:
            mes = corrected_message2(message, message_length)
            logger.info('corrected_message: Exception')
            logger.info(err)
        else:
            mes = message[:limIndex]
            mes = mes.replace('\n', ' ') 
            while True:
                if len(mes)==len(mes:=mes.replace('  ', ' ')): 
                    break
        return mes

    @classmethod
    def add_news(cls, full_message):
        try:
            message_text = full_message['channel_post']['text']
        except KeyError:
            try:
                message_text = full_message['channel_post']['caption']
            except KeyError:
                message_text = ''

        message_date = make_aware(datetime.fromtimestamp(
            int(full_message['channel_post']['date']))).isoformat()

        try:
            file_id = full_message['channel_post']['document']['file_id']
        except KeyError:
            file_id = None

        new_news = cls(
            messageId=int(full_message['channel_post']['message_id']),
            message_date=message_date,
            message=cls.corrected_message(message_text, MESSAGE_LENGTH),
            file_id=file_id,
            full_message=full_message,
        )

        new_news.save()

        if cls.objects.all().count()>100:
            cls.objects.all().order_by('messageId').first().delete()

    @classmethod
    def edit_post(cls, full_message):
        message_id = int(full_message['edited_channel_post']['message_id'])
        
    @classmethod
    def get_all_news(cls):
        all_news = cls.objects.all().order_by('-messageId').values()[:5]
        return [(elem['messageId'], elem['message_date'], elem['message'])
            for elem in all_news]

    @classmethod
    def get_latest_news(cls, last_id):
        latest_news = cls.objects.filter(
            messageId__gt=last_id).order_by('-messageId').values()
        return [(elem['messageId'], elem['message_date'], elem['message']) 
            for elem in latest_news]

    def __str__(self):
        return self.name