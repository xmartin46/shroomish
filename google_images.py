import os
import json
from google_images_download import google_images_download   #importing the library

response = google_images_download.googleimagesdownload()
names_list = os.listdir('scraper/mushroom_img')
names_set = set()
for x in names_list:
    names_set.add(x.split('.')[0][:-1])

print('Number of classes inside our dataset: {}'.format(len(names_set)))

arguments= {"keywords":"{}".format(','.join(names_set)), "limit":20,"print_urls":True}
absolute_image_paths = response.download(arguments)
print(absolute_image_paths)

prefix = './downloads'
os.mkdir('./dataset')
for x in names_set:
    images_list = [os.path.join(prefix,x,j) for j in os.listdir(prefix + x)]
    images_list_scrapy = [os.path,join('scraper/mushroom_img/',j) for j in names_list if j.startswith(x)]
    images_list = images_list + images_list_scrapy
    for num,i in enumerate(images_list):
        os.rename(i,os.path.join('./dataset',x+str(num)+'.jpg')


