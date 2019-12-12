% loadData.m
% 2019 10 24
% JLM

% free up memory
clear

% load data, which is organized as a table T
dataDir = 
load("./data/AllConsolidatedData_CS.mat")
c = T
load("./data/AllConsolidatedData_MS.mat")
m = T

% load data dictionary
vars = readtable("./data/dataDictionary.csv")
idVars = vars.name(vars.class == "id" | vars.class == "dem")
timeVars = vars.name(vars.class == "time")

% pipe the patient-level-data to two csv files that can be combined in R
writetable(m(:,ismember(m.Properties.VariableNames,idVars)), './data/m.csv')
writetable(c(:,ismember(c.Properties.VariableNames,idVars)), './data/c.csv')

% free up memory
clear