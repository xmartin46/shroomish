import os
import sys
import pickle
import jsonify
import numpy as np
from keras.models import load_model
from flask import Flask, request, jsonify
from flask_cors import CORS
from keras.applications.resnet import preprocess_input

app = Flask(__name__)
cors = CORS(app, resources={r"*": {"origins": "*"}})


model = None

#TODO check which class is each number
output = {
        0:"",
        1:"",
        2:"",
        3:"",
        4:"",
        5:"",
        6:"",
        7:"",
        8:"",
        9:"",
        10:"",
        11:""
}
def start_model():
    global model
    model = load_model('classifier.h5')

    
@app.route('/api/predict', methods=['POST'])
def predict():
    if 'Content-Type' not in request.headers or 'multipart/form-data' not in request.headers['Content-Type']:
        return "Content-Type wasn't 'multipart/form-data'", 400
    try:
        formFile = request.files['file']
    except:
        return "FormData didn't include a file", 400
    try:
        img = np.array(formFile)
    except:
        return 'Unable to read the image file', 400
    img = preprocess_input(img)
    value = model.predict(img)
    return jsonify({"prediction":output[value]})


if __name__=="__main__":
    start_model()
    app.run(host='localhost',port=80)
