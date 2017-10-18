%Sort Blue Blobs into following format / array order:

%7 8 9
%4 5 6
%1 2 3

%where Blob 2 is the largest blob.


%Find Largest Blob
largestBlueBlob = 1;
for i = 2:length(blueCalibMarks)
    if blueCalibMarks(i).area > blueCalibMarks(largestBlueBlob).area
        largestBlueBlob = i;
    end
end

%Get Centroids of all Blue Blobs.
for i = 1:length(blueCalibMarks)
    centroidsBlueUnsorted(1, i) = blueCalibMarks(i).uc;
    centroidsBlueUnsorted(2, i) = blueCalibMarks(i).vc;
end

%Find Center Blob
for i = 1:length(centroidsBlueUnsorted)
    centroidsBlueUnsortedCDist(i) = 0;
    for j = 1:length(centroidsBlueUnsorted)
        if j ~= i
            centroidsBlueUnsortedCDist(i) = centroidsBlueUnsortedCDist(i) + getPointDistance(centroidsBlueUnsorted(:,i), centroidsBlueUnsorted(:,j));
        end
    end
end
clear j;

centerPointUnsortedId = 1;
for i = 2:length(centroidsBlueUnsortedCDist)
    if (centroidsBlueUnsortedCDist(i) < centroidsBlueUnsortedCDist(centerPointUnsortedId))
        centerPointUnsortedId = i;
    end
end

clear centroidsBlueUnsortedCDist;


%Find Blob ID 1
blob1roughcoords = [centroidsBlueUnsorted(1, largestBlueBlob) + (centroidsBlueUnsorted(2,centerPointUnsortedId) - centroidsBlueUnsorted(2, largestBlueBlob)); centroidsBlueUnsorted(2,largestBlueBlob) + (-(centroidsBlueUnsorted(1,centerPointUnsortedId) - centroidsBlueUnsorted(1,largestBlueBlob)))];
blob1id = closestPointIndex(blob1roughcoords, centroidsBlueUnsorted);

clear blob1roughcoords;



%Sort the rest of the blue blobs based on finding closest unsorted blob.
import java.util.LinkedList
remainingIndexes = LinkedList();
for i = 1:length(blueCalibMarks)
    remainingIndexes.add(i);
end

remainingIndexes.remove(remainingIndexes.indexOf(centerPointUnsortedId));
remainingIndexes.remove(remainingIndexes.indexOf(largestBlueBlob));
remainingIndexes.remove(remainingIndexes.indexOf(blob1id));

UnsortedBlueOrderedIdList = zeros(1,length(blueCalibMarks));
UnsortedBlueOrderedIdList(1) = blob1id;
UnsortedBlueOrderedIdList(2) = largestBlueBlob;
UnsortedBlueOrderedIdList(5) = centerPointUnsortedId;
clear blob1id;
clear largestBlueBlob;
clear centerPointUnsortedId;

fillOrder = [1, 4, 7, 8, 9, 6, 3];

i = 1;
while (remainingIndexes.size() > 0)
    foundIndex = closestPointIndex(centroidsBlueUnsorted(:, UnsortedBlueOrderedIdList(fillOrder(i))), centroidsBlueUnsorted, remainingIndexes);
    UnsortedBlueOrderedIdList(fillOrder(i+1)) = foundIndex;
    remainingIndexes.remove(remainingIndexes.indexOf(foundIndex));
    i = i+1;
end

clear foundIndex;
clear remainingIndexes;
clear fillOrder;


%Make list of sorted Blue Blobs
for i = 1:length(blueCalibMarks)
    sortedBlueObjs(i) = blueCalibMarks(UnsortedBlueOrderedIdList(i));
end

%Generate sorted list of Blue Centroids
for i = 1:length(sortedBlueObjs)
    sortedBlueCentroids(1, i) = sortedBlueObjs(i).uc;
    sortedBlueCentroids(2, i) = sortedBlueObjs(i).vc;
end

%Get the distance between point1 and point2.
function result = getPointDistance(point1, point2)
    dx = abs(point1(1,1) - point2(1,1));
    dy = abs(point1(2,1) - point2(2,1));
    result = sqrt(dx * dx + dy * dy);
end

%Find closest coordinate in array to point1.
function result = closestPointIndex(point1, array, allowedIndexes)
    point2id = 0;
    if (length(array(1,:)) >= 1)
        for i = 1:length(array(1,:))
            if (nargin < 3 || allowedIndexes.contains(i))
                if (point2id <= 0 || getPointDistance(point1, array(:,point2id)) > getPointDistance(point1, array(:,i)))
                    point2id = i;
                end
            end
        end
    end
    result = point2id;
    return;
end