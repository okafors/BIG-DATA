%% This script allows you to open and explore the data in a *.nc file
clear all
close all

FileName = '/Users/somtookafor/Downloads/Model/o3_surface_20180701000000.nc';

Contents = ncinfo(FileName);

Lat = ncread(FileName, 'lat'); % load the latitude locations
Lon = ncread(FileName, 'lon'); % loadthe longitude locations

%% Processing parameters provided by customer
RadLat = 30.2016; % cluster radius value for latitude
RadLon = 24.8032; % cluster radius value for longitude
RadO3 = 4.2653986e-08; % cluster radius value for the ozone data

%% Cycle through the hours and load all the models for each hour and record memory use
% We use an index named 'NumHour' in our loop
% The section 'sequential processing' will process the data location one
% after the other, reporting on the time involved.

StartLat = 1; % latitude location to start laoding
NumLat = 400; % number of latitude locations to load
StartLon = 1; % longitude location to start loading
NumLon = 700; % number of longitude locations to load
tic
firstHour = 1
lastHour = 5


[NumHour] = SequentialProcessingFunction(FileName, StartHour, EndHour, StartSet, EndSet);


tSeq = toc;

fprintf('Total time for sequential processing = %.2f s\n\n', tSeq)