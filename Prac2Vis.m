%EGB339 Practical Two Vision
% Declare Constants
gammaC = 2.5;
circThresh = 0.9; triThresh = 0.55; squareThresh = 0.7;
small = 0; large = 1;
red = 0; green = 1; blue = 2;
circle = 0; triangle = 1; square = 2; unknown = 3;

% Load Image and Preprocess
im = iread('prac2pic1.jpg');
setUpImage;
figure(1);
%idisp(im);
idisp(imbThings | imrThings | imgThings);
idisp(im);
% Identify All shapes and Store Data In Arrays
identifyBlobs;
boundsAndCents;

% Compute Homography
ComputeHomo;

% Print All Shapes on test Sheet
FPrintDeets(shapes, colour, sizes, xs, ys);