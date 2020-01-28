% /Applications/MATLAB_R2019a.app/bin/matlab -nojvm -nodesktop -nosplash
% preprocessData.m
% 2020 01 27
% JLM

% free up memory
clear
close all

% specify data directory
run(".." + filesep + "paths.m")

% specify temporary directory
tmpDir = ".." + filesep + "tmp" + filesep

% load data for CS and MS subjects, which are organized as tables
load(dataDirectory + "AllConsolidatedData_CS.mat")
c = T;
load(dataDirectory + "AllConsolidatedData_MS.mat")
m = T;
clear T

% interpolate data to common timebase
[m2, ~] = interpolateRawData(m);
[c2, Time] = interpolateRawData(c);

% concatenate data into common table
d = [m2; c2];

% during development, there were a small number of trials (4) with loading
% errors. exclude these.
d(d.DataError,:) = [];
d.DataError = [];

% explode variables
Participant = d.Participant;
Date = d.Date;
Trial = d.Trial;
Emg1 = d.e1;
Emg2 = d.e2;
Emg3 = d.e3;
Emg4 = d.e4;
Treadmill = d.p;

% filter EMG

% normalize EMG

% save into temporary directory
writematrix(Treadmill, tmpDir + "Treadmill.csv")

% wavelet transform

% do statistics

% inverse transform
