# Mushroom classification 

### Topic
Our aim is to be able to make a website that will help people to collect mushrooms securely and easily. It will have information about the most common mushrooms, where they can be found, and a way to classify them properly.

### Technologies
- React. Check https://github.com/facebook/create-react-app
- Node js (however we are considering using Django)
- Keras (for the classifier) 
- Docker (maybe)
- Git

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

### Focus area

Since our aim is to make something useful and easy to use, we will focus our project mainly in **UX** and **functionality**.

## Frontend 
This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

### Available Scripts

In the project directory, you can run:

#### `npm start`

Runs the app in the development mode.<br>
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br>
You will also see any lint errors in the console.

#### `npm test`

Launches the test runner in the interactive watch mode.<br>
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

#### `npm run build`

Builds the app for production to the `build` folder.<br>
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br>
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

#### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can’t go back!**

If you aren’t satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (Webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you’re on your own.

You don’t have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn’t feel obligated to use this feature. However we understand that this tool wouldn’t be useful if you couldn’t customize it when you are ready for it.

### Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

#### Code Splitting

This section has moved here: https://facebook.github.io/create-react-app/docs/code-splitting

#### Analyzing the Bundle Size

This section has moved here: https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size

#### Making a Progressive Web App

This section has moved here: https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app

#### Advanced Configuration

This section has moved here: https://facebook.github.io/create-react-app/docs/advanced-configuration

#### Deployment

This section has moved here: https://facebook.github.io/create-react-app/docs/deployment

#### `npm run build` fails to minify

This section has moved here: https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify


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

We do not have GPU power enough to train a model locally so we will use **Google Colab**. Our main idea is to use Keras as a framework and fine-tune a ResNet50 that was trained with Imagenet weights. Here you can see our model architecture:


```
__________________________________________________________________________________________________
Layer (type)                    Output Shape         Param #     Connected to                     
==================================================================================================
input_6 (InputLayer)            (None, 224, 224, 3)  0                                            
__________________________________________________________________________________________________
conv1_pad (ZeroPadding2D)       (None, 230, 230, 3)  0           input_6[0][0]                    
__________________________________________________________________________________________________
conv1 (Conv2D)                  (None, 112, 112, 64) 9472        conv1_pad[0][0]                  
__________________________________________________________________________________________________
bn_conv1 (BatchNormalization)   (None, 112, 112, 64) 256         conv1[0][0]                      
__________________________________________________________________________________________________
activation_246 (Activation)     (None, 112, 112, 64) 0           bn_conv1[0][0]                   
__________________________________________________________________________________________________
pool1_pad (ZeroPadding2D)       (None, 114, 114, 64) 0           activation_246[0][0]             
__________________________________________________________________________________________________
max_pooling2d_6 (MaxPooling2D)  (None, 56, 56, 64)   0           pool1_pad[0][0]                  
__________________________________________________________________________________________________
res2a_branch2a (Conv2D)         (None, 56, 56, 64)   4160        max_pooling2d_6[0][0]            
__________________________________________________________________________________________________
bn2a_branch2a (BatchNormalizati (None, 56, 56, 64)   256         res2a_branch2a[0][0]             
__________________________________________________________________________________________________
activation_247 (Activation)     (None, 56, 56, 64)   0           bn2a_branch2a[0][0]              
__________________________________________________________________________________________________
res2a_branch2b (Conv2D)         (None, 56, 56, 64)   36928       activation_247[0][0]             
__________________________________________________________________________________________________
bn2a_branch2b (BatchNormalizati (None, 56, 56, 64)   256         res2a_branch2b[0][0]             
__________________________________________________________________________________________________
activation_248 (Activation)     (None, 56, 56, 64)   0           bn2a_branch2b[0][0]              
__________________________________________________________________________________________________
res2a_branch2c (Conv2D)         (None, 56, 56, 256)  16640       activation_248[0][0]             
__________________________________________________________________________________________________
res2a_branch1 (Conv2D)          (None, 56, 56, 256)  16640       max_pooling2d_6[0][0]            
__________________________________________________________________________________________________
bn2a_branch2c (BatchNormalizati (None, 56, 56, 256)  1024        res2a_branch2c[0][0]             
__________________________________________________________________________________________________
bn2a_branch1 (BatchNormalizatio (None, 56, 56, 256)  1024        res2a_branch1[0][0]              
__________________________________________________________________________________________________
add_81 (Add)                    (None, 56, 56, 256)  0           bn2a_branch2c[0][0]              
                                                                 bn2a_branch1[0][0]               
__________________________________________________________________________________________________
activation_249 (Activation)     (None, 56, 56, 256)  0           add_81[0][0]                     
__________________________________________________________________________________________________
res2b_branch2a (Conv2D)         (None, 56, 56, 64)   16448       activation_249[0][0]             
__________________________________________________________________________________________________
bn2b_branch2a (BatchNormalizati (None, 56, 56, 64)   256         res2b_branch2a[0][0]             
__________________________________________________________________________________________________
activation_250 (Activation)     (None, 56, 56, 64)   0           bn2b_branch2a[0][0]              
__________________________________________________________________________________________________
res2b_branch2b (Conv2D)         (None, 56, 56, 64)   36928       activation_250[0][0]             
__________________________________________________________________________________________________
bn2b_branch2b (BatchNormalizati (None, 56, 56, 64)   256         res2b_branch2b[0][0]             
__________________________________________________________________________________________________
activation_251 (Activation)     (None, 56, 56, 64)   0           bn2b_branch2b[0][0]              
__________________________________________________________________________________________________
res2b_branch2c (Conv2D)         (None, 56, 56, 256)  16640       activation_251[0][0]             
__________________________________________________________________________________________________
bn2b_branch2c (BatchNormalizati (None, 56, 56, 256)  1024        res2b_branch2c[0][0]             
__________________________________________________________________________________________________
add_82 (Add)                    (None, 56, 56, 256)  0           bn2b_branch2c[0][0]              
                                                                 activation_249[0][0]             
__________________________________________________________________________________________________
activation_252 (Activation)     (None, 56, 56, 256)  0           add_82[0][0]                     
__________________________________________________________________________________________________
res2c_branch2a (Conv2D)         (None, 56, 56, 64)   16448       activation_252[0][0]             
__________________________________________________________________________________________________
bn2c_branch2a (BatchNormalizati (None, 56, 56, 64)   256         res2c_branch2a[0][0]             
__________________________________________________________________________________________________
activation_253 (Activation)     (None, 56, 56, 64)   0           bn2c_branch2a[0][0]              
__________________________________________________________________________________________________
res2c_branch2b (Conv2D)         (None, 56, 56, 64)   36928       activation_253[0][0]             
__________________________________________________________________________________________________
bn2c_branch2b (BatchNormalizati (None, 56, 56, 64)   256         res2c_branch2b[0][0]             
__________________________________________________________________________________________________
activation_254 (Activation)     (None, 56, 56, 64)   0           bn2c_branch2b[0][0]              
__________________________________________________________________________________________________
res2c_branch2c (Conv2D)         (None, 56, 56, 256)  16640       activation_254[0][0]             
__________________________________________________________________________________________________
bn2c_branch2c (BatchNormalizati (None, 56, 56, 256)  1024        res2c_branch2c[0][0]             
__________________________________________________________________________________________________
add_83 (Add)                    (None, 56, 56, 256)  0           bn2c_branch2c[0][0]              
                                                                 activation_252[0][0]             
__________________________________________________________________________________________________
activation_255 (Activation)     (None, 56, 56, 256)  0           add_83[0][0]                     
__________________________________________________________________________________________________
res3a_branch2a (Conv2D)         (None, 28, 28, 128)  32896       activation_255[0][0]             
__________________________________________________________________________________________________
bn3a_branch2a (BatchNormalizati (None, 28, 28, 128)  512         res3a_branch2a[0][0]             
__________________________________________________________________________________________________
activation_256 (Activation)     (None, 28, 28, 128)  0           bn3a_branch2a[0][0]              
__________________________________________________________________________________________________
res3a_branch2b (Conv2D)         (None, 28, 28, 128)  147584      activation_256[0][0]             
__________________________________________________________________________________________________
bn3a_branch2b (BatchNormalizati (None, 28, 28, 128)  512         res3a_branch2b[0][0]             
__________________________________________________________________________________________________
activation_257 (Activation)     (None, 28, 28, 128)  0           bn3a_branch2b[0][0]              
__________________________________________________________________________________________________
res3a_branch2c (Conv2D)         (None, 28, 28, 512)  66048       activation_257[0][0]             
__________________________________________________________________________________________________
res3a_branch1 (Conv2D)          (None, 28, 28, 512)  131584      activation_255[0][0]             
__________________________________________________________________________________________________
bn3a_branch2c (BatchNormalizati (None, 28, 28, 512)  2048        res3a_branch2c[0][0]             
__________________________________________________________________________________________________
bn3a_branch1 (BatchNormalizatio (None, 28, 28, 512)  2048        res3a_branch1[0][0]              
__________________________________________________________________________________________________
add_84 (Add)                    (None, 28, 28, 512)  0           bn3a_branch2c[0][0]              
                                                                 bn3a_branch1[0][0]               
__________________________________________________________________________________________________
activation_258 (Activation)     (None, 28, 28, 512)  0           add_84[0][0]                     
__________________________________________________________________________________________________
res3b_branch2a (Conv2D)         (None, 28, 28, 128)  65664       activation_258[0][0]             
__________________________________________________________________________________________________
bn3b_branch2a (BatchNormalizati (None, 28, 28, 128)  512         res3b_branch2a[0][0]             
__________________________________________________________________________________________________
activation_259 (Activation)     (None, 28, 28, 128)  0           bn3b_branch2a[0][0]              
__________________________________________________________________________________________________
res3b_branch2b (Conv2D)         (None, 28, 28, 128)  147584      activation_259[0][0]             
__________________________________________________________________________________________________
bn3b_branch2b (BatchNormalizati (None, 28, 28, 128)  512         res3b_branch2b[0][0]             
__________________________________________________________________________________________________
activation_260 (Activation)     (None, 28, 28, 128)  0           bn3b_branch2b[0][0]              
__________________________________________________________________________________________________
res3b_branch2c (Conv2D)         (None, 28, 28, 512)  66048       activation_260[0][0]             
__________________________________________________________________________________________________
bn3b_branch2c (BatchNormalizati (None, 28, 28, 512)  2048        res3b_branch2c[0][0]             
__________________________________________________________________________________________________
add_85 (Add)                    (None, 28, 28, 512)  0           bn3b_branch2c[0][0]              
                                                                 activation_258[0][0]             
__________________________________________________________________________________________________
activation_261 (Activation)     (None, 28, 28, 512)  0           add_85[0][0]                     
__________________________________________________________________________________________________
res3c_branch2a (Conv2D)         (None, 28, 28, 128)  65664       activation_261[0][0]             
__________________________________________________________________________________________________
bn3c_branch2a (BatchNormalizati (None, 28, 28, 128)  512         res3c_branch2a[0][0]             
__________________________________________________________________________________________________
activation_262 (Activation)     (None, 28, 28, 128)  0           bn3c_branch2a[0][0]              
__________________________________________________________________________________________________
res3c_branch2b (Conv2D)         (None, 28, 28, 128)  147584      activation_262[0][0]             
__________________________________________________________________________________________________
bn3c_branch2b (BatchNormalizati (None, 28, 28, 128)  512         res3c_branch2b[0][0]             
__________________________________________________________________________________________________
activation_263 (Activation)     (None, 28, 28, 128)  0           bn3c_branch2b[0][0]              
__________________________________________________________________________________________________
res3c_branch2c (Conv2D)         (None, 28, 28, 512)  66048       activation_263[0][0]             
__________________________________________________________________________________________________
bn3c_branch2c (BatchNormalizati (None, 28, 28, 512)  2048        res3c_branch2c[0][0]             
__________________________________________________________________________________________________
add_86 (Add)                    (None, 28, 28, 512)  0           bn3c_branch2c[0][0]              
                                                                 activation_261[0][0]             
__________________________________________________________________________________________________
activation_264 (Activation)     (None, 28, 28, 512)  0           add_86[0][0]                     
__________________________________________________________________________________________________
res3d_branch2a (Conv2D)         (None, 28, 28, 128)  65664       activation_264[0][0]             
__________________________________________________________________________________________________
bn3d_branch2a (BatchNormalizati (None, 28, 28, 128)  512         res3d_branch2a[0][0]             
__________________________________________________________________________________________________
activation_265 (Activation)     (None, 28, 28, 128)  0           bn3d_branch2a[0][0]              
__________________________________________________________________________________________________
res3d_branch2b (Conv2D)         (None, 28, 28, 128)  147584      activation_265[0][0]             
__________________________________________________________________________________________________
bn3d_branch2b (BatchNormalizati (None, 28, 28, 128)  512         res3d_branch2b[0][0]             
__________________________________________________________________________________________________
activation_266 (Activation)     (None, 28, 28, 128)  0           bn3d_branch2b[0][0]              
__________________________________________________________________________________________________
res3d_branch2c (Conv2D)         (None, 28, 28, 512)  66048       activation_266[0][0]             
__________________________________________________________________________________________________
bn3d_branch2c (BatchNormalizati (None, 28, 28, 512)  2048        res3d_branch2c[0][0]             
__________________________________________________________________________________________________
add_87 (Add)                    (None, 28, 28, 512)  0           bn3d_branch2c[0][0]              
                                                                 activation_264[0][0]             
__________________________________________________________________________________________________
activation_267 (Activation)     (None, 28, 28, 512)  0           add_87[0][0]                     
__________________________________________________________________________________________________
res4a_branch2a (Conv2D)         (None, 14, 14, 256)  131328      activation_267[0][0]             
__________________________________________________________________________________________________
bn4a_branch2a (BatchNormalizati (None, 14, 14, 256)  1024        res4a_branch2a[0][0]             
__________________________________________________________________________________________________
activation_268 (Activation)     (None, 14, 14, 256)  0           bn4a_branch2a[0][0]              
__________________________________________________________________________________________________
res4a_branch2b (Conv2D)         (None, 14, 14, 256)  590080      activation_268[0][0]             
__________________________________________________________________________________________________
bn4a_branch2b (BatchNormalizati (None, 14, 14, 256)  1024        res4a_branch2b[0][0]             
__________________________________________________________________________________________________
activation_269 (Activation)     (None, 14, 14, 256)  0           bn4a_branch2b[0][0]              
__________________________________________________________________________________________________
res4a_branch2c (Conv2D)         (None, 14, 14, 1024) 263168      activation_269[0][0]             
__________________________________________________________________________________________________
res4a_branch1 (Conv2D)          (None, 14, 14, 1024) 525312      activation_267[0][0]             
__________________________________________________________________________________________________
bn4a_branch2c (BatchNormalizati (None, 14, 14, 1024) 4096        res4a_branch2c[0][0]             
__________________________________________________________________________________________________
bn4a_branch1 (BatchNormalizatio (None, 14, 14, 1024) 4096        res4a_branch1[0][0]              
__________________________________________________________________________________________________
add_88 (Add)                    (None, 14, 14, 1024) 0           bn4a_branch2c[0][0]              
                                                                 bn4a_branch1[0][0]               
__________________________________________________________________________________________________
activation_270 (Activation)     (None, 14, 14, 1024) 0           add_88[0][0]                     
__________________________________________________________________________________________________
res4b_branch2a (Conv2D)         (None, 14, 14, 256)  262400      activation_270[0][0]             
__________________________________________________________________________________________________
bn4b_branch2a (BatchNormalizati (None, 14, 14, 256)  1024        res4b_branch2a[0][0]             
__________________________________________________________________________________________________
activation_271 (Activation)     (None, 14, 14, 256)  0           bn4b_branch2a[0][0]              
__________________________________________________________________________________________________
res4b_branch2b (Conv2D)         (None, 14, 14, 256)  590080      activation_271[0][0]             
__________________________________________________________________________________________________
bn4b_branch2b (BatchNormalizati (None, 14, 14, 256)  1024        res4b_branch2b[0][0]             
__________________________________________________________________________________________________
activation_272 (Activation)     (None, 14, 14, 256)  0           bn4b_branch2b[0][0]              
__________________________________________________________________________________________________
res4b_branch2c (Conv2D)         (None, 14, 14, 1024) 263168      activation_272[0][0]             
__________________________________________________________________________________________________
bn4b_branch2c (BatchNormalizati (None, 14, 14, 1024) 4096        res4b_branch2c[0][0]             
__________________________________________________________________________________________________
add_89 (Add)                    (None, 14, 14, 1024) 0           bn4b_branch2c[0][0]              
                                                                 activation_270[0][0]             
__________________________________________________________________________________________________
activation_273 (Activation)     (None, 14, 14, 1024) 0           add_89[0][0]                     
__________________________________________________________________________________________________
res4c_branch2a (Conv2D)         (None, 14, 14, 256)  262400      activation_273[0][0]             
__________________________________________________________________________________________________
bn4c_branch2a (BatchNormalizati (None, 14, 14, 256)  1024        res4c_branch2a[0][0]             
__________________________________________________________________________________________________
activation_274 (Activation)     (None, 14, 14, 256)  0           bn4c_branch2a[0][0]              
__________________________________________________________________________________________________
res4c_branch2b (Conv2D)         (None, 14, 14, 256)  590080      activation_274[0][0]             
__________________________________________________________________________________________________
bn4c_branch2b (BatchNormalizati (None, 14, 14, 256)  1024        res4c_branch2b[0][0]             
__________________________________________________________________________________________________
activation_275 (Activation)     (None, 14, 14, 256)  0           bn4c_branch2b[0][0]              
__________________________________________________________________________________________________
res4c_branch2c (Conv2D)         (None, 14, 14, 1024) 263168      activation_275[0][0]             
__________________________________________________________________________________________________
bn4c_branch2c (BatchNormalizati (None, 14, 14, 1024) 4096        res4c_branch2c[0][0]             
__________________________________________________________________________________________________
add_90 (Add)                    (None, 14, 14, 1024) 0           bn4c_branch2c[0][0]              
                                                                 activation_273[0][0]             
__________________________________________________________________________________________________
activation_276 (Activation)     (None, 14, 14, 1024) 0           add_90[0][0]                     
__________________________________________________________________________________________________
res4d_branch2a (Conv2D)         (None, 14, 14, 256)  262400      activation_276[0][0]             
__________________________________________________________________________________________________
bn4d_branch2a (BatchNormalizati (None, 14, 14, 256)  1024        res4d_branch2a[0][0]             
__________________________________________________________________________________________________
activation_277 (Activation)     (None, 14, 14, 256)  0           bn4d_branch2a[0][0]              
__________________________________________________________________________________________________
res4d_branch2b (Conv2D)         (None, 14, 14, 256)  590080      activation_277[0][0]             
__________________________________________________________________________________________________
bn4d_branch2b (BatchNormalizati (None, 14, 14, 256)  1024        res4d_branch2b[0][0]             
__________________________________________________________________________________________________
activation_278 (Activation)     (None, 14, 14, 256)  0           bn4d_branch2b[0][0]              
__________________________________________________________________________________________________
res4d_branch2c (Conv2D)         (None, 14, 14, 1024) 263168      activation_278[0][0]             
__________________________________________________________________________________________________
bn4d_branch2c (BatchNormalizati (None, 14, 14, 1024) 4096        res4d_branch2c[0][0]             
__________________________________________________________________________________________________
add_91 (Add)                    (None, 14, 14, 1024) 0           bn4d_branch2c[0][0]              
                                                                 activation_276[0][0]             
__________________________________________________________________________________________________
activation_279 (Activation)     (None, 14, 14, 1024) 0           add_91[0][0]                     
__________________________________________________________________________________________________
res4e_branch2a (Conv2D)         (None, 14, 14, 256)  262400      activation_279[0][0]             
__________________________________________________________________________________________________
bn4e_branch2a (BatchNormalizati (None, 14, 14, 256)  1024        res4e_branch2a[0][0]             
__________________________________________________________________________________________________
activation_280 (Activation)     (None, 14, 14, 256)  0           bn4e_branch2a[0][0]              
__________________________________________________________________________________________________
res4e_branch2b (Conv2D)         (None, 14, 14, 256)  590080      activation_280[0][0]             
__________________________________________________________________________________________________
bn4e_branch2b (BatchNormalizati (None, 14, 14, 256)  1024        res4e_branch2b[0][0]             
__________________________________________________________________________________________________
activation_281 (Activation)     (None, 14, 14, 256)  0           bn4e_branch2b[0][0]              
__________________________________________________________________________________________________
res4e_branch2c (Conv2D)         (None, 14, 14, 1024) 263168      activation_281[0][0]             
__________________________________________________________________________________________________
bn4e_branch2c (BatchNormalizati (None, 14, 14, 1024) 4096        res4e_branch2c[0][0]             
__________________________________________________________________________________________________
add_92 (Add)                    (None, 14, 14, 1024) 0           bn4e_branch2c[0][0]              
                                                                 activation_279[0][0]             
__________________________________________________________________________________________________
activation_282 (Activation)     (None, 14, 14, 1024) 0           add_92[0][0]                     
__________________________________________________________________________________________________
res4f_branch2a (Conv2D)         (None, 14, 14, 256)  262400      activation_282[0][0]             
__________________________________________________________________________________________________
bn4f_branch2a (BatchNormalizati (None, 14, 14, 256)  1024        res4f_branch2a[0][0]             
__________________________________________________________________________________________________
activation_283 (Activation)     (None, 14, 14, 256)  0           bn4f_branch2a[0][0]              
__________________________________________________________________________________________________
res4f_branch2b (Conv2D)         (None, 14, 14, 256)  590080      activation_283[0][0]             
__________________________________________________________________________________________________
bn4f_branch2b (BatchNormalizati (None, 14, 14, 256)  1024        res4f_branch2b[0][0]             
__________________________________________________________________________________________________
activation_284 (Activation)     (None, 14, 14, 256)  0           bn4f_branch2b[0][0]              
__________________________________________________________________________________________________
res4f_branch2c (Conv2D)         (None, 14, 14, 1024) 263168      activation_284[0][0]             
__________________________________________________________________________________________________
bn4f_branch2c (BatchNormalizati (None, 14, 14, 1024) 4096        res4f_branch2c[0][0]             
__________________________________________________________________________________________________
add_93 (Add)                    (None, 14, 14, 1024) 0           bn4f_branch2c[0][0]              
                                                                 activation_282[0][0]             
__________________________________________________________________________________________________
activation_285 (Activation)     (None, 14, 14, 1024) 0           add_93[0][0]                     
__________________________________________________________________________________________________
res5a_branch2a (Conv2D)         (None, 7, 7, 512)    524800      activation_285[0][0]             
__________________________________________________________________________________________________
bn5a_branch2a (BatchNormalizati (None, 7, 7, 512)    2048        res5a_branch2a[0][0]             
__________________________________________________________________________________________________
activation_286 (Activation)     (None, 7, 7, 512)    0           bn5a_branch2a[0][0]              
__________________________________________________________________________________________________
res5a_branch2b (Conv2D)         (None, 7, 7, 512)    2359808     activation_286[0][0]             
__________________________________________________________________________________________________
bn5a_branch2b (BatchNormalizati (None, 7, 7, 512)    2048        res5a_branch2b[0][0]             
__________________________________________________________________________________________________
activation_287 (Activation)     (None, 7, 7, 512)    0           bn5a_branch2b[0][0]              
__________________________________________________________________________________________________
res5a_branch2c (Conv2D)         (None, 7, 7, 2048)   1050624     activation_287[0][0]             
__________________________________________________________________________________________________
res5a_branch1 (Conv2D)          (None, 7, 7, 2048)   2099200     activation_285[0][0]             
__________________________________________________________________________________________________
bn5a_branch2c (BatchNormalizati (None, 7, 7, 2048)   8192        res5a_branch2c[0][0]             
__________________________________________________________________________________________________
bn5a_branch1 (BatchNormalizatio (None, 7, 7, 2048)   8192        res5a_branch1[0][0]              
__________________________________________________________________________________________________
add_94 (Add)                    (None, 7, 7, 2048)   0           bn5a_branch2c[0][0]              
                                                                 bn5a_branch1[0][0]               
__________________________________________________________________________________________________
activation_288 (Activation)     (None, 7, 7, 2048)   0           add_94[0][0]                     
__________________________________________________________________________________________________
res5b_branch2a (Conv2D)         (None, 7, 7, 512)    1049088     activation_288[0][0]             
__________________________________________________________________________________________________
bn5b_branch2a (BatchNormalizati (None, 7, 7, 512)    2048        res5b_branch2a[0][0]             
__________________________________________________________________________________________________
activation_289 (Activation)     (None, 7, 7, 512)    0           bn5b_branch2a[0][0]              
__________________________________________________________________________________________________
res5b_branch2b (Conv2D)         (None, 7, 7, 512)    2359808     activation_289[0][0]             
__________________________________________________________________________________________________
bn5b_branch2b (BatchNormalizati (None, 7, 7, 512)    2048        res5b_branch2b[0][0]             
__________________________________________________________________________________________________
activation_290 (Activation)     (None, 7, 7, 512)    0           bn5b_branch2b[0][0]              
__________________________________________________________________________________________________
res5b_branch2c (Conv2D)         (None, 7, 7, 2048)   1050624     activation_290[0][0]             
__________________________________________________________________________________________________
bn5b_branch2c (BatchNormalizati (None, 7, 7, 2048)   8192        res5b_branch2c[0][0]             
__________________________________________________________________________________________________
add_95 (Add)                    (None, 7, 7, 2048)   0           bn5b_branch2c[0][0]              
                                                                 activation_288[0][0]             
__________________________________________________________________________________________________
activation_291 (Activation)     (None, 7, 7, 2048)   0           add_95[0][0]                     
__________________________________________________________________________________________________
res5c_branch2a (Conv2D)         (None, 7, 7, 512)    1049088     activation_291[0][0]             
__________________________________________________________________________________________________
bn5c_branch2a (BatchNormalizati (None, 7, 7, 512)    2048        res5c_branch2a[0][0]             
__________________________________________________________________________________________________
activation_292 (Activation)     (None, 7, 7, 512)    0           bn5c_branch2a[0][0]              
__________________________________________________________________________________________________
res5c_branch2b (Conv2D)         (None, 7, 7, 512)    2359808     activation_292[0][0]             
__________________________________________________________________________________________________
bn5c_branch2b (BatchNormalizati (None, 7, 7, 512)    2048        res5c_branch2b[0][0]             
__________________________________________________________________________________________________
activation_293 (Activation)     (None, 7, 7, 512)    0           bn5c_branch2b[0][0]              
__________________________________________________________________________________________________
res5c_branch2c (Conv2D)         (None, 7, 7, 2048)   1050624     activation_293[0][0]             
__________________________________________________________________________________________________
bn5c_branch2c (BatchNormalizati (None, 7, 7, 2048)   8192        res5c_branch2c[0][0]             
__________________________________________________________________________________________________
add_96 (Add)                    (None, 7, 7, 2048)   0           bn5c_branch2c[0][0]              
                                                                 activation_291[0][0]             
__________________________________________________________________________________________________
activation_294 (Activation)     (None, 7, 7, 2048)   0           add_96[0][0]                     
__________________________________________________________________________________________________
flatten_5 (Flatten)             (None, 100352)       0           activation_294[0][0]             
__________________________________________________________________________________________________
fc1000 (Dense)                  (None, 139)          13949067    flatten_5[0][0]                  
==================================================================================================
Total params: 37,536,779
Trainable params: 13,949,067
Non-trainable params: 23,587,712

```
