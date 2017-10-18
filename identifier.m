%declare constants
gammaC = 2.5;
circThresh = 0.9;
triThresh = 0.55;
squareThresh = 0.7;

%load in image and seperate in color channels
im = iread('blobpic3.jpg');
setUpImage;

%display original image
figure(1)
idisp(im);

identifyBlobs;