# name_latin    name_eng    url(redirect, dont take it)     img_urls    desc    edibility

import json

with open('../scraper/mushroom_classes.json', 'r') as json_file:
    data = json.load(json_file)
    for i, obj in enumerate(data):
        name_eng = obj['name_eng']
        name_latin = obj['name_latin']
        description = obj['description']
        edibility = obj['edibility']
        urls = obj['img_urls']

        # TODO: treat name_eng = ""
        if name_eng == "":
            name_eng = "IDKWTFISTHISSHITNIGGA                                      " + str(i)

        name_eng = name_eng.replace("'", "''")
        name_latin = name_latin.replace("'", "''")
        description = description.replace("'", "''")
        edibility = edibility.replace("'", "''")
        #description = description.split(".", 1)

        #print("INSERT INTO mushroom(name_eng, name_latin, description, edibility) VALUES (" + "'" + name_eng + "'" + "," + "'" + name_latin + "'" + "," + "'" + description + "'" + "," + "'" + edibility + "'" + ");")

        #for url in urls:
        #    url = url.replace("'", "''")
        #    print("INSERT INTO mushroom_image(id_mushroom, URL) VALUES(" + str(i + 1) + "," + "'" + url + "'" + ");")
