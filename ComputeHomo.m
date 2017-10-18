%COMPUTEHOMO Computes the Homography of the given data points.
%   Detailed explanation goes here

%Calibration Marks
segmentBlue;
sortBlue;

%homo debug
for i = 1:length(sortedBlueObjs)
    info = sprintf('%d\n%d %d', i, sortedBlueObjs(i).uc, sortedBlueObjs(i).vc)
    plot_point([sortedBlueObjs(i).uc sortedBlueObjs(i).vc]', 'label', info, 'ro');
end

%generate Homography Matrix

P = sortedBlueCentroids;
Q = [20  560;
    20  290;
    20  20;
    182.5 560;
    182.5 290;
    182.5 20;
    345 560;
    345 290;
    345 20];

H = homography2(P, Q');
H


