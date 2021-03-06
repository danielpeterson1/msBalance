% /Applications/MATLAB_R2019a.app/bin/matlab -nojvm -nodesktop -nosplash
% loadData.m
% 2019 10 24
% JLM

% free up memory
clear

% specify data directory
run(".." + filesep + "paths.m")

% specify temporary directory
csvDirectory = ".." + filesep + "tmp" + filesep

% load data for CS and MS subjects, which are organized as tables
load(dataDirectory + "AllConsolidatedData_CS.mat")
c = T;
load(dataDirectory + "AllConsolidatedData_MS.mat")
m = T;

% load data dictionary
vars = readtable(dataDirectory + "dataDictionary.csv")
idVars = vars.name(vars.class == "id" | vars.class == "dem")
timeVars = vars.name(vars.class == "time")

% pipe the patient-level-data to two csv files that can be combined in R
writetable(m(:,ismember(m.Properties.VariableNames,idVars)), csvDirectory + "m.csv")
writetable(c(:,ismember(c.Properties.VariableNames,idVars)), csvDirectory + "c.csv")