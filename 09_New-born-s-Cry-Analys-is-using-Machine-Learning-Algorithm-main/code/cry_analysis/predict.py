# -*- coding: utf-8 -*-
"""Copy of predict.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1yCdd6sqd4hsxExRFncrEX0Wo9xnWUg30
"""

# Drivepath
import sys


# Imports
import os
from tqdm import tqdm
import pandas as pd
import numpy as np
import pickle

from scipy.io import wavfile
from python_speech_features import mfcc

from keras.models import load_model
from sklearn.metrics import accuracy_score
from cfg import Config


def main(file):
# Define config
  PARENT_DIR = "C:\\Users\\manis\\Desktop\\zn\\cry_analysis\\"
  class Config:
      def __init__(self, parent_dir = PARENT_DIR, mode='conv', nfilt=26, nfeat=13, nfft=512, rate=16000):
          self.mode = mode
          self.nfilt = nfilt
          self.nfeat = nfeat
          self.nfft = nfft
          self.rate = rate
          self.step = int(rate/10)
          self.model_path = os.path.join(parent_dir, 'model', mode + '.model')
          self.p_path = os.path.join(parent_dir, 'pickles', mode + '.p')

  def predict_cry(config, filepath):
    y_predict = None
    fileN_pE = {}
    
    assert isinstance(filepath, str), "Please provide single filepath"

    print('Extracting features from audio :')
    rate, wav = wavfile.read(filepath)
    y_prob = None

    for i in range(0,wav.shape[0] - config.step, config.step):
      sample = wav[i:i+config.step]
      x = mfcc(sample, rate, numcep= config.nfeat, nfilt= config.nfilt, nfft= config.nfft)
      x = (x - config.min)/ (config.max - config.min)

      x = x.reshape(1, x.shape[0], x.shape[1], 1)
      y_hat = model.predict(x)
      y_prob = y_hat
      y_predict = np.argmax(y_hat)
      
      fileN_pE[filepath] = np.mean(y_prob, axis = 0).flatten()
    
    return y_predict, fileN_pE

  # Send filepath here

  # FILEPATH = '../media/documents/' + file
  FILEPATH = os.path.join(PARENT_DIR, 'clean', file)

  classes = ['angry', 'belly_pain', 'discomfort', 'hungry', 'tired']
  p_path = os.path.join(PARENT_DIR, 'pickles', 'conv.p')
  print(p_path)
  config = None
  with open(p_path, 'rb') as handle:
      config = pickle.load(handle)

  model = load_model(os.path.join(PARENT_DIR, 'model', 'conv.model'))

  y_pred, fN_pE = predict_cry(config, FILEPATH)
  print("Predicted result for filepath %s is %s"%(FILEPATH, classes[y_pred]))
  print()
  print("Individual probability scores:")
  for classN, proba in zip(classes, fN_pE[FILEPATH]):
    print("%s:\t\t%.2f"%(classN, proba))

  return classes[y_pred]
  # fN2class['68h.wav']

# main('85h.wav')
