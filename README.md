<h1 align="center">Welcome to Shroomish👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.1.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://github.com/xmartin46/mushroomClassifier/blob/master/README.md" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
</p>

## Frontend 
This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

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
```bash
cd scraper
scrapy crawl mushroom_scraper
```
Also, in order to increase our dataset (139 classes of mushrooms) we will use google images to scrape more images (this must be done afterwards the Mushroom World scraping).

To get images from Google Images:
```bash
python google_images.py
```
You will find a folder called downloads with subfolders(one for each class) with the images inside. Also there will be a dataset folder with all the images merged with the class in their name.

## Classifier

We do not have GPU power enough to train a model locally so we will use **Google Colab**. Our main idea is to use Keras as a framework and fine-tune a ResNet50 that was trained with Imagenet weights.

## Authors

👤 **Xavier Martin, Adrià Cabeza and Ricardo Longares**

-  [@xmartin46](https://github.com/xmartin46)

- [@adriacabeza](https://github.com/adriacabeza)

- [@Rlongares](https://github.com/Rlongares)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/xmartin46/mushroomClassifier/issues).

## Show your support

Give a ⭐️ if this project helped you!

# Yo esto lo borraría
### Members

<table align="center">
    <tr>
        <td align="center"><img src="./docs/images/ricardo.jpeg"   height="200"></td>
        <td align="center"><b>Ricardo María Longares Díez</b>
        <br>
        	784957
        <br>
        	ricardomaria.longaresdiez@aalto.fi
        </td>
    </tr>
    <tr>
        <td align="center"><img src="./docs/images/xavier.jpeg"  height="150"></td>
        <td align="center"><b>Xavier Martín Ballesteros</b> 
        <br>
        	785066 
        <br>
        	xavier.martinballesteros@aalto.fi
        </td>
    </tr>
     <tr>
        <td align="center"><img src="./docs/images/adria.jpeg"   height="150"></td>
      	<td align="center"><b>Adrià Cabeza Sant'Anna</b> 
        <br>
        	784546 
        <br>
        	adria.cabezasantanna@aalto.fi
        </td>
    </tr>
</table>


***
