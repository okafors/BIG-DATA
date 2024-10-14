%% Plotting graphs in Matlab
clear all
close all


%% Show two plots on different y-axes
%% 250 data processed
x1Vals = [1, 2, 3, 4];
y1Vals = [238.02,158.89,135.00,118.52];
figure(1)
yyaxis left
plot(x1Vals, y1Vals, '-bd')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')


%% 5,000 data processed
x2Vals = [1, 2, 3, 4];
y2Vals = [3055.87,1014.82,871.94,847.23];
figure(1)
yyaxis right
plot(x2Vals, y2Vals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

hold on

%% 9,000 data processed
x3Vals = [1, 2, 3, 4];
y3Vals = [5142.18, 1925.33, 1456.02, 1361.42];
figure(1)
plot(x3Vals, y3Vals, '-g')

legend('250 Data', '5,000 Data', '9000 Data')
%% Show two plots on same y-axis
%% Mean processing time
y1MeanVals = y1Vals / 250;
y2MeanVals = y2Vals / 5000;
y3MeanVals = y3Vals / 9000;
figure(2)
plot(x1Vals, y1MeanVals, '-bd')
hold on
plot(x2Vals, y2MeanVals, '-rx')
hold on
plot(x3Vals,y3MeanVals, '-g')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Mean Processing time vs number of processors')
legend('250 Data', '5,000 Data', '9,000 Data')
%% Plot the extrapolated data
figure(3)
plot(x1Vals, y1Vals, '-bd')
hold on
plot(x2Vals, y2Vals, '-rx')
hold on
plot(x3Vals, y3Vals, '-g')
hold on
plot(xVals, y1Extrap, '--b')
hold on
plot(xVals, y2Extrap, '--r')
hold on
plot(xVals, y3Extrap, '--g')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors (extrapolated)')
legend('250 Data', '5,000 Data', '9000 Data', 'Extrapolated (250)', 'Extrapolated (5,000)', 'Extrapolated (9,000)')