import os
from tqdm import tqdm
from random import shuffle

TRAIN_PERCENTAGE=0.85
list_images = os.listdir('./dataset')

if not os.path.exists("./dataset/train"):
    os.mkdir('./dataset/train')
if not os.path.exists("./dataset/test"):
    os.mkdir('./dataset/test')
train = list_images[:int(TRAIN_PERCENTAGE*(len(list_images)))]
test = list_images[int(TRAIN_PERCENTAGE*(len(list_images))):]

print('Train dataset: {} images'.format(len(train)))
print('Test dataset: {} images'.format(len(test)))

for x in tqdm(train):
    label = x.split('_')[0]
    print(label)
    if not os.path.exists(os.path.join('./dataset/train',label)):
        os.mkdir(os.path.join('./dataset/train',label))
    os.rename(os.path.join('./dataset',x), os.path.join('./dataset/train',label,x))

for x in tqdm(test):
    label = x.split('_')[0]
    print(label)
    if not os.path.exists(os.path.join('./dataset/test',label)):
        os.mkdir(os.path.join('./dataset/test',label))

    os.rename(os.path.join('./dataset',x), os.path.join('dataset/test',label,x))


