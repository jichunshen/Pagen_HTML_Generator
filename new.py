import socket
from src.classes.inference.Sampler import *

sampler = Sampler(model_json_path='model.json', model_weights_path ='weights.h5')
sampler.convert_single_image('/Users/hxt/Desktop/Duke Documents/Software Engineering/project', png_path='examples/drawn_example1.png', print_generated_output=0, style='default')

#initialize server
s = socket.socket()
host = socket.gethostname()
#set port number
port = 12345
s.bind((host, port))
s.listen(5)
while True:
    #establish client connection
    c, addr = s.accept()
    #receive message from client
    imgpath = c.recv()
    htmlpath = '/Users/hxt/Desktop/Duke Documents/Software Engineering/project'
    #find image and preprocess
    sampler.convert_single_image(htmlpath,
                                 png_path=imgpath, print_generated_output=0, style='default')
    #send html path back to client
    c.send(htmlpath+imgpath.split('/')[-1])
    c.close()