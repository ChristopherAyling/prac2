% Script to segment blue calibration marks

% identify minimum and maximum shape areas
Amin = 3000;
Amax = 300000;

% find blobs
blueCalibMarks = iblobs(imbThings, 'area', [Amin, Amax], 'boundary');
for i = 1:length(blueCalibMarks)
    plot_point([blueCalibMarks(i).uc blueCalibMarks(i).vc]', 'b*');
end