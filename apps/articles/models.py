from django.db import models

from wagtail.admin.panels import (FieldPanel, 
                                MultiFieldPanel, 
                                InlinePanel, 
                                PageChooserPanel)
from wagtail.blocks import (RichTextBlock, 
                            CharBlock, 
                            URLBlock)
from wagtail.fields import RichTextField, StreamField
from  wagtail.images.blocks import ImageChooserBlock
from wagtail.models import Page, Orderable

class Article(Page):
    page_description = "Статья с заголовком и кратким описанием"
    description = models.CharField(max_length=250)
    body = StreamField([
            ('title', CharBlock(
                label='Заголовок', 
                template="blocks/title.html"
            )),
            ('subTitle', CharBlock(
                label='Подзаголовок',
                template="blocks/subtitle.html"
            )),
            ('youtube', CharBlock(
                label='Подзаголовок',
                template="blocks/youtube.html"
            )),
            ('shortImage', ImageChooserBlock(
                label='Основной размер картинки',
                template="blocks/shortImg.html"
            )),
            ('longImage', ImageChooserBlock(
                label='Картинка во всю страницу',
                template="blocks/longimg.html"
            )),
            ('text', RichTextBlock(
                feachers= ['italic', 'bold', 'ol', 'ul', 'hr', 
                            'link', 'document-link',],
                label='Основной текст'
            ))
        ], 
        blank=True,
        use_json_field=True
    )

    subpage_types = []

    content_panels = Page.content_panels + [
        FieldPanel('description'), 
        FieldPanel('body'), 
    ]