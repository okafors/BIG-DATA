FileName = '/Users/somtookafor/Downloads/Model/o3_surface_20180701000000.nc';

function [EnsembleVectorPar, LatLon] = ParallelProcessing2(FileName, StartHour, EndHour, StartSet, EndSet, NumWorkers)
% ParallelProcessing2 - Performs parallel processing on a netCDF file
%
% Syntax:  [EnsembleVectorPar, LatLon] = ParallelProcessing2(FileName, StartHour, EndHour, StartSet, EndSet, NumWorkers)
%
% Inputs:
%    FileName - The file name of the netCDF file
%    StartHour - The start hour to process
%    EndHour - The end hour to process
%    StartSet - The start set to process
%    EndSet - The end set to process
%    NumWorkers - The number of workers to use for parallel processing
%
% Outputs:
%    EnsembleVectorPar - The ensemble vector calculated for each location
%    LatLon - The latitude and longitude for each location

% 1: Load Data
clear all
close all

% Load the netCDF file
Contents = ncinfo(FileName);

% Load latitude and longitude data
Lat = ncread(FileName, 'lat');
Lon = ncread(FileName, 'lon');

% Set the number of hours to process
NumHours = 5;

% 2: Processing parameters
% Processing parameters provided by the customer
RadLat = 30.2016;
RadLon = 24.8032;
RadO3 = 4.2653986e-08;

% Set the start and end indices for latitude and longitude
StartLat = 1;
NumLat = 400;
StartLon = 1;
NumLon = 700;

% Call the test function (if it is defined)
%test(FileName, Contents, StartLat, StartLon);

% 3: Pre-allocate output array memory
% The '-4' value is due to the