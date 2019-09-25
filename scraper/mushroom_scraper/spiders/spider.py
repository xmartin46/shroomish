# -*- coding: utf-8 -*-
import scrapy

from mushroom_scraper.items import ImageItem, MushroomItem

class MWScraper(scrapy.Spider):
    name = 'mushroom_scraper'
    start_urls = ['http://www.mushroom.world/mushrooms/namelist']

    def parse(self, response):
        for div_item in response.css('div.item'):
            link = div_item.css('a')
            small = div_item.css('small')
            link_url = response.urljoin(link.css('::attr(href)').extract_first().strip())

            name_eng = small.css('::text').extract_first()
            # English name might be null
            name_eng_formatted = name_eng.strip()[1:-1] if name_eng is not None else ''
            shroom_dict = {
                'name_latin' : link.css('::text').extract_first(),
                'name_eng' : name_eng_formatted,
                'url' : link_url,
            }
            yield response.follow(link_url, self.parse_show_page, meta={'shroom': shroom_dict})

    def parse_show_page(self, response):
        shroom = response.meta['shroom']

        img_urls = []
        for i, div_img in enumerate(response.css('div.image')):
            link = div_img.css('a')
            link_url = response.urljoin(link.css('::attr(href)').extract_first().strip())
            img_urls.append(link_url)
            latin_formatted = shroom['name_latin'].lower().replace(' ', '_')
            img_name = "{}{}.jpg".format(latin_formatted, i)
            yield ImageItem(name_latin=shroom['name_latin'], name_img=img_name, img_url=link_url)

        div_edibility = response.css('div.textus')[3]
        div_description = response.css('div.textus')[2]
        shroom['img_urls'] = img_urls
        shroom['desc']= div_description.css('::text').extract_first()
        shroom['edibility'] = div_edibility.css('::text').extract_first().lower()
        yield MushroomItem(shroom)
