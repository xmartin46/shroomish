# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy

class MushroomItem(scrapy.Item):
    name_latin = scrapy.Field()
    name_eng = scrapy.Field()
    desc = scrapy.Field()
    url = scrapy.Field()
    edibility = scrapy.Field()
    img_urls = scrapy.Field()

class ImageItem(scrapy.Item):
    name_latin = scrapy.Field()
    name_img = scrapy.Field()
    img_url = scrapy.Field()
    file_path = scrapy.Field()

