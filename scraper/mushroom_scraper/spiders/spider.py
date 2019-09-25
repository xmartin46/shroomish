# -*- coding: utf-8 -*-
import scrapy


class SpiderSpider(scrapy.Spider):
    name = 'spider'
    allowed_domains = ['http://www.mushroom.world/mushrooms/namelist']
    start_urls = ['http://http://www.mushroom.world/mushrooms/namelist/']

    def parse(self, response):
        pass
