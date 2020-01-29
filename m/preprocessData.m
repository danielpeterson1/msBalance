% /Applications/MATLAB_R2019a.app/bin/matlab -nojvm -nodesktop -nosplash
% preprocessData.m
% 2020 01 27
% JLM

% free up memory
clear
close all

% set flag to run interactive and make plots
runInteractive = true;

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

% set default sample frequency
fs = 1000;

% interpolate data to common timebase
[m2, ~] = interpolateRawData(m, fs);
[c2, Time] = interpolateRawData(c, fs);

% concatenate data into common table
d = [m2; c2];

% during development, there were a small number of trials (4) with loading
% errors. exclude these.
d(d.DataError,:) = [];
d.DataError = [];

% explode variables and pre-Process
Participant = d.Participant;
Date = datestr(d.Date,'yyyy-mm-dd');
Trial = d.Trial;
Emg1 = preprocessEmg(d.e1, fs);
Emg2 = preprocessEmg(d.e2, fs);
Emg3 = preprocessEmg(d.e3, fs);
Emg4 = preprocessEmg(d.e4, fs);
Treadmill = preprocessTreadmill(d.p);

if runInteractive
    f = figure;
    nr = 5;
    nc = 1;
    subplot(nr,nc,1)
    plot(Time,Treadmill)
    subplot(nr,nc,2)
    plot(Time,Emg1)    
    subplot(nr,nc,3)
    plot(Time,Emg2)    
    subplot(nr,nc,4)
    plot(Time,Emg3)    
    subplot(nr,nc,5)
    plot(Time,Emg4)    
end

% save into temporary directory
writematrix(Participant, tmpDir + "Participant.csv");
writematrix(Date, tmpDir + "Date.csv");
writematrix(Trial, tmpDir + "Trial.csv");
writematrix(Time, tmpDir + "Time.csv");
writematrix(Treadmill, tmpDir + "Treadmill.csv");
writematrix(Emg1, tmpDir + "Emg1.csv");
writematrix(Emg2, tmpDir + "Emg2.csv");
writematrix(Emg3, tmpDir + "Emg3.csv");
writematrix(Emg4, tmpDir + "Emg4.csv");

% wavelet transform

% do statistics

% inverse transform
