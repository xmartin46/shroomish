import os
from tqdm import tqdm

DESIRED_MUSHROOMS = [
"amanita_muscaria",
"galerina_marginata",
"cortinarius_caperatus",
"gyromitra_esculenta",
"armillaria_mellea",
"albatrellus_ovinus", 
"boletus_edulis", 
"cantharellus_cibarius", 
"craterellus_tubaeformis",
"suillus_luteus",
"hygrophorus_camarophyllus",
"hydnum_repandum",
"coprinus_comatus",
"lycoperdon_pyriforme",
"tylopilus_felleu",
"suillus_grevillei",
"leccinum_scabrum",
]

llista_mushrooms = os.listdir('mushroom_img')
print('Starting with {} images of mushrooms'.format(len(llista_mushrooms)))
count = 0
to_be_removed = set()
for x in tqdm(llista_mushrooms):
    remove= True
    for y in DESIRED_MUSHROOMS:
        if y in x:
            remove=False
            pass
    if remove:
        to_be_removed.add(x)
        count = count + 1
        print('{} removed'.format(x))
    else:
        print('{} not removed'.format(x))


for x in to_be_removed:
    os.remove(os.path.join('./mushroom_img',x))


print('{} images deleted'.format(count))
