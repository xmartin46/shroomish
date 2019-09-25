import os
from tqdm import tqdm
from random import shuffle


list_images = os.list('./dataset')

if not os.path.exists('./data'):
    os.mkdir('./data')
for x in list_images:
    label = x.split('_')[0]
    print(label)
    if not os.path.exists(os.path.join('./data',label)):
        os.mkdir(os.path.join('./data',label))
    os.rename(os.path.join('./dataset',x), os.path.join('./data',label,x))


