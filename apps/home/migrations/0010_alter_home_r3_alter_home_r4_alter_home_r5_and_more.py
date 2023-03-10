# Generated by Django 4.1.3 on 2022-12-24 15:23

from django.db import migrations
import wagtail.fields


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0009_remove_homepage_rt1'),
    ]

    operations = [
        migrations.AlterField(
            model_name='home',
            name='r3',
            field=wagtail.fields.RichTextField(blank=True, null=True, verbose_name='Первый столбец, третья строка'),
        ),
        migrations.AlterField(
            model_name='home',
            name='r4',
            field=wagtail.fields.RichTextField(blank=True, null=True, verbose_name='Второй столбец, первая строка'),
        ),
        migrations.AlterField(
            model_name='home',
            name='r5',
            field=wagtail.fields.RichTextField(blank=True, null=True, verbose_name='Второй столбец, вторая строка'),
        ),
        migrations.AlterField(
            model_name='home',
            name='r6',
            field=wagtail.fields.RichTextField(blank=True, null=True, verbose_name='Второй столбец, третья строка'),
        ),
    ]
