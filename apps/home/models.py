import logging

from django.db import models

from wagtail.admin.panels import (FieldPanel, 
                                MultiFieldPanel, 
                                InlinePanel, 
                                PageChooserPanel)
from wagtail.blocks import (RichTextBlock, 
                            CharBlock, 
                            URLBlock)
from wagtail.fields import RichTextField, StreamField
from wagtail.images.blocks import ImageChooserBlock
from wagtail.models import Page, Orderable


class HomePage(Page):
    template = 'home/home.html'
    related_page = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )

    max_count = 1

    content_panels = Page.content_panels + [
        PageChooserPanel('related_page', 'home.Home'),
    ]

class Home(Page):
    bottomLogo = models.ForeignKey(
        'wagtailimages.Image',
        blank=True,
        null=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    r1 = RichTextField(
        verbose_name="Первый столбец, первая строка",
        features=['bold', 'link', 'document-link', 'subscript'],
        blank=True,
        null=True,
    )

    r2 = RichTextField(
        verbose_name="Первый столбец, вторая строка",
        features=['bold', 'link', 'document-link', 'subscript'],
        blank=True,
        null=True,
    )

    r3 = RichTextField(
        verbose_name="Второй столбец, третья строка",
        features=['bold', 'link', 'document-link', 'subscript'],
        blank=True,
        null=True,
    )

    r4 = RichTextField(
        verbose_name="Второй столбец, третья строка",
        features=['bold', 'link', 'document-link', 'subscript'],
        blank=True,
        null=True,
    )

    r5 = RichTextField(
        verbose_name="Третий столбец, первая строка",
        features=['bold', 'link', 'document-link', 'subscript'],
        blank=True,
        null=True,
    )

    r6 = RichTextField(
        verbose_name="Третий столбец, вторая строка",
        features=['bold', 'link', 'document-link', 'subscript'],
        blank=True,
        null=True,
    )

    subpage_types = []
    max_count = 1

    content_panels = Page.content_panels + [
        FieldPanel('r1'),
        FieldPanel('r2'), 
        FieldPanel('r3'), 
        FieldPanel('r4'),
        FieldPanel('r5'), 
        FieldPanel('r6'), 
        FieldPanel('bottomLogo'), 
    ]