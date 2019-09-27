import os
from tqdm import tqdm

DESIRED_MUSHROOMS = [


        ]
llista_mushrooms = os.listdir('mushroom_img')
count = 0
for x in tqdm(llista_mushrooms):
    for y in DESIRED_MUSHROOMS:
        if y in x:
            pass
        else:
            os.remove(x)
            count = count + 1

print('{} images deleted'.format(count))
