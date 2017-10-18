function [size] = getSize(shape)
%GETSIZE determines the size of the inputted shape

largest = ;
smallest = ;
if (shape.area-largest>shape.area-smallest)
    size = 'large';
else
    size = 'small';
end

end

