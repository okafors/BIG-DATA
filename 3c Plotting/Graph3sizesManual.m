%% Plotting graphs in Matlab
clear all
close all

%% Show two plots on different y-axes
%% 250 data processed
x1Vals = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
y1Vals = [4.72, 4.56, 4.88, 5.33, 5.09, 5.39, 5.11, 4.79, 5.37, 4.63];

%% 5,000 data processed
x2Vals = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
y2Vals = [895.63, 925.98, 1056.21, 1304.09, 1106.43, 1378.76, 1092.35, 1094.12, 1257.82, 1123.01];
%% 9,000 data processed
x3Vals = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
y3Vals = [2567.89, 2486.27, 2238.56, 2764.75, 2298.31, 2541.98, 2352.84, 2176.33, 2392.43, 2216.78];
%% Plotting all data on the same graph
figure(1)
plot(x1Vals, y1Vals, '-bd')
hold on
plot(x2Vals, y2Vals, '-rx')
plot(x3Vals, y3Vals, '-gx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors (pool size 8)')
legend('250 Data', '5,000 Data', '9,000 Data')

%% Show two plots on different y-axes
figure(2)

%% 250 data processed
yyaxis left
plot(x1Vals, y1Vals, '-bd')
hold on

%% 5,000 data processed
yyaxis right
plot(x2Vals, y2Vals, '-rx')
hold on

%% 9,000 data processed
yyaxis right
plot(x3Vals, y3Vals, '-gx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors (pool size 8)')
legend('250 Data', '5,000 Data', '9,000 Data')

%% Show two plots on same y-axis
%% Mean processing time
y1MeanVals = y1Vals / 250;
y2MeanVals = y2Vals / 5000;
y3MeanVals = y3Vals / 9000;

figure(3)
plot(x1Vals, y1MeanVals, '-bd')
hold on
plot(x2Vals, y2MeanVals, '-rx')
plot(x3Vals, y3MeanVals, '-gx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Mean Processing time vs number of processors (pool size 8)')
legend('250 Data', '5,000 Data', '9,000 Data')

%% Data per datum
figure(4)
plot(x1Vals, y1Vals ./ 250, '-bd')
hold on
plot(x2Vals, y2Vals ./ 5000, '-rx')
plot(x3Vals, y3Vals ./ 9000, '-gx')
xlabel('Number of Processors')
ylabel('Processing time per datum (s)')
title('Processing time per datum vs number of processors (pool size 8)')
legend('250 Data', '5,000 Data', '9,000 Data')