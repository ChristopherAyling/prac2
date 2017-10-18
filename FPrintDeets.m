function [ output_args ] = FPrintDeets(shapes, colours, sizes, xs, ys)
%FPrintDeets Prints shape details 
%   Detailed explanation goes here
disp('Shape | Colour | Size | X | Y')
for i = 1:length(shapes)
    disp(shapes(i),'|', colours(i),'|', sizes(i),'|', xs(i),'|', ys(i))
end

