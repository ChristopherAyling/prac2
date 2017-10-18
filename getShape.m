function [ shape ] = getShape( blob )
%GETSHAPE returns the shape of the specified region feature
%   blob is a region feature object
%   shape is a string

c = blob.circularity;
if c > 0.9
    shape = 'circle';
elseif c > 0.7
    shape = 'square';
elseif c > 0.55
    shape = 'triangle';
else
    shape = 'unknown shape';
end


