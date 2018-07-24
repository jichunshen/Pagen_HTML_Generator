#load files
from PIL import Image
from keras.models import model_from_json
from keras.preprocessing.text import Tokenizer
from keras.preprocessing.sequence import pad_sequences
from keras.preprocessing.image import array_to_img, img_to_array, load_img
from keras.applications.inception_resnet_v2 import preprocess_input
import numpy as np
from compiler.classes.Compiler import *
import socket

# map an integer to a word
def word_for_id(integer, tokenizer):
    for word, index in tokenizer.word_index.items():
        if index == integer:
            return word
    return None

# generate a description for an image
def generate_desc(model, tokenizer, photo, max_length):
    photo = np.array([photo])
    # seed the generation process
    in_text = '<START> '
    # iterate over the whole length of the sequence
    for i in range(150):
        # integer encode input sequence
        sequence = tokenizer.texts_to_sequences([in_text])[0]
        # pad input
        sequence = pad_sequences([sequence], maxlen=max_length)
        # predict next word
        yhat = model.predict([photo, sequence], verbose=0)
        # convert probability to integer
        yhat = np.argmax(yhat)
        # map integer to word
        word = word_for_id(yhat, tokenizer)
        # stop if we cannot map the word
        if word is None:
            break
        # append as input for generating the next word
        in_text += word + ' '
        # stop if we predict the end of the sequence
        if word == '<END>':
            break
    return in_text

# Read a file and return a string
def load_doc(filename):
    file = open(filename, 'r')
    text = file.read()
    file.close()
    return text

# Initialize the function to create the vocabulary
tokenizer = Tokenizer(filters='', split=" ", lower=False)
# Create the vocabulary
tokenizer.fit_on_texts([load_doc('bootstrap.vocab')])

#load model and weights
json_file = open('model.json', 'r')
loaded_model_json = json_file.read()
json_file.close()
loaded_model = model_from_json(loaded_model_json)
# load weights into new model
loaded_model.load_weights("weights.h5")
print("Loaded model from disk")

#load parameters
max_length = 48
dsl_path = "compiler/assets/web-dsl-mapping.json"
compiler = Compiler(dsl_path)

#initialize server
s = socket.socket()
host = socket.gethostname()
#set port number
port = 12345
s.bind((host, port))

#waiting for client
s.listen(5)
while True:
    #establish client connection
    c, addr = s.accept()
    #receive message from client
    imgpath = c.recv()
    #find image and preprocess
    train_features = img_to_array(load_img(imgpath, target_size=(256, 256)))
    train_features = np.array(train_features, dtype=float)
    train_features = preprocess_input(train_features)
    #transform image into html
    htmlpath = '/Users/hxt/Desktop/Duke Documents/Software Engineering/project/newindex.html'
    predicted = [generate_desc(loaded_model, tokenizer, train_features, max_length).split()]
    compiler.compile(predicted[0], htmlpath)
    #send html path back to client
    c.send(htmlpath)
    c.close()

# # Load the images and preprocess them for inception-resnet
# train_features = img_to_array(load_img('/Users/hxt/Desktop/test.png', target_size=(256, 256)))
# train_features = np.array(train_features, dtype=float)
# train_features = preprocess_input(train_features)

# file_name = '/Users/hxt/PycharmProjects/Screenshot-to-code-in-Keras/xQS3avFhdpqNct4qnfrHEo/eval/0BA2A4B4-4193-4506-8818-31564225EF8B.npz'
# train_features = np.load(file_name)['features']
# images = array_to_img(train_features)
# images.show()
# #train_features = images

# max_length = 48
# predicted = [generate_desc(loaded_model,tokenizer,train_features,max_length).split()]
# #Compile the tokens into HTML and css
# dsl_path = "compiler/assets/web-dsl-mapping.json"
# compiler = Compiler(dsl_path)
# htmlpath = '/Users/hxt/Desktop/Duke Documents/Software Engineering/project/newindex.html'
# compiled_website = compiler.compile(predicted[0], htmlpath)