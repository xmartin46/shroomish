import os
import sys
import pickle
import jsonify
import numpy as np
from keras import backend as K
from PIL import Image
from keras.models import load_model
from flask import Flask, request, jsonify
from flask_cors import CORS
from keras.applications.resnet import preprocess_input

app = Flask(__name__)
cors = CORS(app, resources={r"*": {"origins": "*"}})

model = None

TH = 0.65 # CONFIDENCE
output = {
        0:"Albatrellus ovinus",
        1:"Amanita muscaria",
        2:"Armillaria mellea",
        3:"Boletus edulis",
        4:"Cantharellus cibarius",
        5:"Coprinus comatus",
        6:"Cortinarius caperatus",
        7:"Craterellus tubaeformis",
        8:"Galerina marginata",
        9:"Gyromitra esculenta",
        10:"Hydnum repandum",
        11:"Hygrophorus camarophyllus",
        12:"Leccinum scabrum",
        13:"Lycoperdon pyriforme",
        14:"Suillus grevillei",
        15:"Suillus luteus"
}


def start_model():
    global model
    model = load_model('classifier.h5')

def resize(input_image):
  input_image = Image.open(input_image).resize((224,224),Image.LANCZOS)
  input_image = input_image.convert('RGB')
  return input_image
    
@app.route('/api/predict', methods=['POST','GET'])
def predict():
    if 'Content-Type' not in request.headers or 'multipart/form-data' not in request.headers['Content-Type']:
        return "Content-Type wasn't 'multipart/form-data'", 400
    try:
        formFile = request.files['file']
        if not formFile:
            formFile = request.files['image']
    except:
        return "FormData didn't include a file", 400
    try:
        print(formFile)
        img = np.array(resize(formFile))
        print(img.shape)
    except:
        return 'Unable to read the image file', 400
    img = np.expand_dims(img, axis=0)
    img = preprocess_input(img)
    print("Let's start predicting")
    value = model.predict(img)
    K.clear_session()
    prediction = output[np.argmax(value)] if np.max(value) > TH else None
    print("Value predicted: {}".format(prediction))
    return jsonify({"prediction":prediction})


if __name__=="__main__":
    start_model()
    app.run(host='0.0.0.0',port=5000, threaded=False)
