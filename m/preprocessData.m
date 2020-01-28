% /Applications/MATLAB_R2019a.app/bin/matlab -nojvm -nodesktop -nosplash
% preprocessData.m
% 2020 01 27
% JLM

% free up memory
clear
close all

% specify data directory
run(".."+filesep+"paths.m")

% load data for CS and MS subjects, which are organized as tables
load(dataDirectory + "AllConsolidatedData_CS.mat")
c = T;
load(dataDirectory + "AllConsolidatedData_MS.mat")
m = T;
clear T

% set a flag for interactive use, making plots, etc.
interactive = 1;

% interpolate data to common timebase
m2 = interpolateRawData(m);
c2 = interpolateRawData(c);

% concatenate data into common table in RAM
d = [m2; c2];

% wavelet transform

% do statistics

% inverse transform


% load data dictionary
vars = readtable(dataDirectory + "dataDictionary.csv")
idVars = vars.name(vars.class == "id" | vars.class == "dem")
timeVars = vars.name(vars.class == "time")

% pipe the patient-level-data to two csv files that can be combined in R
writetable(m(:,ismember(m.Properties.VariableNames,idVars)), csvDirectory + "m.csv")
writetable(c(:,ismember(c.Properties.VariableNames,idVars)), csvDirectory + "c.csv")

% free up memory
clear
