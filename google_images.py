 
import os
import json
from google_images_download import google_images_download   #importing the library

response = google_images_download.googleimagesdownload()
names_list = os.listdir('scraper/mushroom_img')
names_set = set()
for x in names_list:
    names_set.add(x.split('.')[0][:-1])

print('Number of classes inside our dataset: {}'.format(len(names_set)))

arguments= {"keywords":"{}".format(','.join(names_set)), "limit":10,"print_urls":True}
absolute_image_paths = response.download(arguments)
print(absolute_image_paths)
