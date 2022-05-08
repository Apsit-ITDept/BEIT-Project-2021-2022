# Text-Handwriting-Conversion-using-Neural-Networks

# Title of the Project: Text Handwriting Conversion using Neural Networks

# Group Members:
1) Aditya Saini
2) Kunal Sant
3) Sumeet Swain

# Description:
We have observed that it is sometimes difficult to understand handwritings and also the speed of writing can be improved, some government forms not available online. So we came up with a solution which will convert text into handwriting and vice versa. In our we will convert into handwriting aqnd print it on an image of a page. This will reduce the effort of writing everything on paper. Our system can also convert handwriting into text, which can be useful to save text digitally which is easier to store and easily accessible and sahreable . We will be using Neural Networks in our system to generate/create handwriting and OCR to convert Handwritten text to digitized text. Our system can be useful to teachers & students to save their handwritten work into editable text format. It can also be used to create handwritten documents faster like letters. And it reduces the overall effort of writing everything on paper

# Proposed System:
In our project we will be having a data set of images which will be used for training of the model. We will be processing those images learning from the finding of the processing and evaluating them to better the model. There will be two parts ; firstly taking digitised text as an input and outputting and image of handwriting version of the text we have inputted which the model has generated. Secondly, taking an image as an input processing it through the neural networks and returning digitised text as an output.

# Project Implementation:

# Text To Handwriting .
This model will be fed with computer-generated text as its input. We used online handwritten data to assess the model's ability to construct plausible real-valued sequences, as opposed to offline handwriting, which only has page pictures. We got all of our information from IAM-OnDB, which is an online handwriting database.

# Handwriting To Text 
The input data is a 128x32 pixel picture. Because the images in the collection aren't exactly this size, we resize them to a width of 128 pixels or a height of 32 pixels. The input is then transformed into a 128x32 target image (white). Data augmentation can be implemented by arbitrarily moving or enlarging the image rather than aligning it to the left

# Home Page
In the homepage we will provide 3 options to the user:
1. Text to Handwriting 
2. Handwriting to Text
3. Handwriting to Handwriting

In the 1st button we will take text input and convert it into image of handwriting. In the 2nd button we will take input in the form of image of handwriting and output will be text recognized from the image. In the 3rd button we will take input in the form of image of handwriting and convert into image of a new handwriting.

