% Declare constants
gammaC = 2.5;

circThresh = 0.9; triThresh = 0.55; squareThresh = 0.7;

small = 0; large = 1;
red = 0; green = 1; blue = 2;
circle = 0; triangle = 1; square = 2; unknown = 3;

% Load image and preprocess
im = iread('prac2pic1.jpg');
setUpImage;

% Identify all shapes and store data in arrays
identifyBlobs;

% Segment the blue calibration marks. Display a binary image corresponding
% to the blue object pixels with overlaid bounding box and centroid on each
% of the 9 calibration marks. The program will then pause.
figure(1);
idisp(imbThings);
segmentBlue;
cPause;

% Segment the other shapes. Display a binary image corresponding to all of 
% the other shapes in the scene. Mark the centroids of all these shapes.
% Display a bounding box on all of the triangles and a different coloured
% bounding box on all of the green shapes. The program will then pause.
%mark centroids of all other shapes
%triangle bounding box
%green shape bounding box
figure(2);
idisp(imrThings | imgThings);
boundsAndCents;
cPause;

% Determine which shapes are described in the list provided. Display a 
% single binary image corresponding to those 3 shapes with overlaid
% bounding box and centroid on each of the shapes.
figure(3);
%binary image of three shapes
%idisp();
searchShapes;


% Compute the homography and then use it to compute the workspace
% coordinates of the three shapes given earlier. Display the values in
% units of mm. The program will then pause.

%cPause
