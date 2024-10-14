clear all
close all 

FileName = '../Model/o3_surface_20180701000000.nc';
LogFileName = 'AnalysisLog.txt';

Contents = ncinfo(FileName);
StartHour = 1;
EndHour = 5;
StartSet= 1;
EndSet = 250;
NumWorkers = 6;



SequentialProcessingFunction(FileName, StartHour, EndHour, StartSet, EndSet);
returntime = ParallelProcessingFunction(FileName, StartHour, EndHour, StartSet, EndSet, NumWorkers);
GraphsFunction(returntime, EndSet) 
TestTextFunction(FileName)
TestSolutionsWithLogFileFunction(FileName, LogFileName)