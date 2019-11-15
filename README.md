<h1 align="center">Welcome to Shroomish👋</h1>

[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/xmartin46/shroomish) [![GitHub stars](https://img.shields.io/github/stars/xmartin46/shroomish.svg)](https://GitHub.com/xmartin46/shroomish/stargazers/) [![HitCount](http://hits.dwyl.io/xmartin46/shroomish.svg)](http://hits.dwyl.io/xmartin46/shroomish)

This is the repository of **shroomish.ml**, website where people can obtain more knowledge about mushrooms, their location or classify the mushrooms obtained using deep learning.



### ✨ [Demo](shroomish.ml)

## Frontend 
The frontend uses React (was bootstrapped with [Create React App](https://github.com/facebook/create-react-app)  and axios to deal with the requests to the our different APIs.

To run it you can use Docker Compose: 

```bash
docker-compose up -d --build shroomish-client
```
## Backend
Our backend is mainly separated in two main parts: the main one which uses Nodejs and Express for the API along with a PostgreSQL database and the second one, which deals with the classifier, which is made with Flask.

To run it you can use Docker Compose: 
```bash
docker-compose up -d --build shroomish-backend
docker-compose up -d --build shroomish-classifier
```

## Dataset

### Scraper
We will use the website [Mushroom World](http://www.mushroom.world/home/index) to get the information and the photos of our mushroom dataset. 

First set an environment and install all the requirements. 

```bash
python3 -m virtualenv env
source env/bin/activate
pip install -r requirements.txt
```

To get information from Mushroom World:
​```bash
cd scraper
scrapy crawl mushroom_scraper
```
Also, in order to increase our dataset (139 classes of mushrooms) we will use google images to scrape more images (this must be done afterwards the Mushroom World scraping).

To get images from Google Images:
​```bash
python google_images.py
```
You will find a folder called downloads with subfolders(one for each class) with the images inside. Also there will be a dataset folder with all the images merged with the class in their name.

## Classifier

We do not have GPU power enough to train a model locally so we will use **Google Colab**. We have used Keras as our main framework to fine-tune a ResNet50 that was trained with Imagenet weights. To run it you can use [this notebook](./classifier/MushroomClassifier.ipynb).

## Authors

👤 **Xavier Martin, Adrià Cabeza and Ricardo Longares**

- [@xmartin46](https://github.com/xmartin46)

- [@adriacabeza](https://github.com/adriacabeza)

- [@Rlongares](https://github.com/Rlongares)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/xmartin46/mushroomClassifier/issues).

## Show your support

Give a ⭐️ if this project helped you!
