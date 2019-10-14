import os
import sys
import pickle
import jsonify
import numpy as np
import keras.models

from flask import Flask, request, jsonify
from flask_cors import CORS
from app import views
from keras.applications.resnet import preprocess_input

app = Flask(__name__)
cors = CORS(app, resources={r"*": {"origins": "*"}})


model = None

def load_model():
    global model
    with open('model.pkl', 'rb') as f:
        model = pickle.load(f)


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
        return jsonify({"prediction":value})


if __name__="__main__":
    load_model()
    app.run(host='localhost',port=80)
