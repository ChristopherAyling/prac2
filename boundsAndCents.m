% mark centroids of all non blue shapes
% display different coloured bounding boxes on red and green shapes

for i = 1:length(colour)
    if colour(i) ~= blue && shapes(i) ~= unknown
        plot_point([us(i) vs(i)]', 'c*');
    end
end

redBlobs.plot_box('r');
greenBlobs.plot_box('g');