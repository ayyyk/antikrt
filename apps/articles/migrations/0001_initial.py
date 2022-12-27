# Generated by Django 4.1.3 on 2022-12-24 16:17

from django.db import migrations, models
import django.db.models.deletion
import wagtail.blocks
import wagtail.fields
import wagtail.images.blocks


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('wagtailcore', '0078_referenceindex'),
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('page_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='wagtailcore.page')),
                ('description', models.CharField(max_length=250)),
                ('body', wagtail.fields.StreamField([('title', wagtail.blocks.CharBlock(label='Заголовок', template='blocks/title.html')), ('subTitle', wagtail.blocks.CharBlock(label='Подзаголовок', template='blocks/subtitle.html')), ('youtube', wagtail.blocks.CharBlock(label='Подзаголовок', template='blocks/youtube.html')), ('shortImage', wagtail.images.blocks.ImageChooserBlock(label='Основной размер картинки', template='blocks/shortImg.html')), ('longImage', wagtail.images.blocks.ImageChooserBlock(label='Картинка во всю страницу', template='blocks/longimg.html')), ('text', wagtail.blocks.RichTextBlock(feachers=['italic', 'bold', 'ol', 'ul', 'hr', 'link', 'document-link'], label='Основной текст'))], blank=True, use_json_field=True)),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailcore.page',),
        ),
    ]