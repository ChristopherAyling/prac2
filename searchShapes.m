% declare goal shapes
%size,colour,Shape
goal1 = [small, red, triangle];
goal2 = [large, green, circle];
goal3 = [small, red, square];

goals = [goal1; goal2; goal3];
goalLocs = zeros(3, 2);


% find goal shapes
for i = 1:length(goals)
    for j = 1:length(sizes)
        if sizes(j) == goals(i,1) && colour(j) == goals(i, 2) && shapes(j) == goals(i, 3)
            %save co-ords of goal shape
            goalLocs(i,1) = us(j);
            goalLocs(i,2) = vs(j);
            %display bounding box and centroid
            plot_point([us(j), vs(j)]', 'c*'); %centroid
            %bounding box
            break;
        end
    end
end

% compute homography


% print locations of goal shapes
% disp('Shape number 1:', )
% disp('Shape number 2:', )
% disp('Shape number 3:',)
