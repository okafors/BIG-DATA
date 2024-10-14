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

%% 10,000 data processed
x2Vals = [1, 2, 3, 4];
y2Vals = [5142.18, 1925.33, 1456.02, 1361.42];

figure(1)
yyaxis right
plot(x2Vals, y2Vals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')
hold on

x3Vals = [1, 2, 3, 4];
y3Vals = [3055.87,1014.82,871.94,847.23];
figure(1)
plot(x1Vals, y3Vals, '-g')

legend('250 Data','5000 data', '9,000 Data')


%% Show two plots on same y-axis
%% Mean processing time
y1MeanVals = y1Vals / 250;
y2MeanVals = y2Vals / 9000;
y3meanvals = y3vals / 5000
figure(2)
plot(x1Vals, y1MeanVals, '-bd')
hold on
yyaxis right
plot(x2Vals, y2MeanVals, '-rx')
hold on
plot(x2Vals, y2MeanVals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Mean Processing time vs number of processors')
legend('250 Data','5000 data', '9000 Data')