# Generated by Django 4.1.3 on 2022-12-20 18:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('telegram', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='krtnews',
            name='file_id',
            field=models.CharField(max_length=100, null=True, verbose_name='attached image id in telegram api'),
        ),
        migrations.AlterField(
            model_name='krtnews',
            name='message',
            field=models.CharField(max_length=100, verbose_name='Message from channel'),
        ),
        migrations.AlterField(
            model_name='krtnews',
            name='message_date',
            field=models.DateTimeField(verbose_name='Message date from the channel'),
        ),
    ]
