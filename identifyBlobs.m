% Arrays for storing shape data
sizes = [];
colour = [];
shapes = [];
us = [];
vs = [];

% identify minimum and maximum shape areas
Amin = 3000;
Amax = 300000;

%create array of images to iterate over
colourChannels = cell(1,3);
colourChannels{1,1} = imrThings;
colourChannels{1,2} = imgThings;
colourChannels{1,3} = imbThings;

% Identify shapes and insert into info into arrays
for i = 1:length(colourChannels) %for each color
    blobs = iblobs(colourChannels{1,i},  'area', [Amin, Amax], 'boundary');
    switch (findBoxColour(i))
            case red
                redBlobs = blobs(blobs.circularity>0.55);
            case green
                greenBlobs = blobs(blobs.circularity>0.55);
    end
    
    largestBlob = max(blobs.area);
    smallestBlob = min(blobs.area);
    for j = 1:length(blobs)
        %record size
        if abs(blobs(j).area - largestBlob) < abs(blobs(j).area - smallestBlob)
            sizes = [sizes, large];
        else
            sizes = [sizes, small];
        end
        
        %record colour
        switch (findBoxColour(i))
            case red
                colour = [colour, 0];
            case green
                colour = [colour, 1];
            case blue
                colour = [colour, 2];
        end
        
        %record shape
        switch (getShape(blobs(j)))
            case 'circle'
               shapes = [shapes, circle];
            case 'triangle'
               shapes = [shapes, triangle];
            case 'square'
               shapes = [shapes, square];
            case 'unknown shape'
                shapes = [shapes, unknown];
        end
        us = [us, blobs(j).uc];
        vs = [vs, blobs(j).vc];
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%% OLD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%identify all shapes of all colours
% for i = 1:length(colours)
%     blobs = iblobs(colours{1,i},  'area', [Amin, Amax], 'boundary');
%     blobs.plot_box(findBoxColour(i));
% 
%     for j = 1:length(blobs)
%         plot_point([blobs(j).uc blobs(j).vc]', 'g*', 'label', getShape(blobs(j)));
%     end
% end