function boxColour = findBoxColour( index )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if index == 1
    boxColour = 0;
elseif index == 2
    boxColour = 1;
elseif index == 3
    boxColour = 2;
else
    disp('DISP colour index out of range')
    error('colour index out of range')
end

end

