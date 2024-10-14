function GraphsFunction(returntime, EndSet) 
%% Plotting graphs in Matlab
clear all
close all


%% Show two plots on different y-axes
%% 250 data processed
x1Vals = [1, 2, 3, 4, 5, 6];
y1Vals = [10.00, 5.75, 4.42, 4.12, 4.02, 3.97];
figure(1)
yyaxis left
plot(x1Vals, y1Vals, '-bd')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')


%% 10,000 data processed
x2Vals = [1, 2, 3, 4, 5, 6];
y2Vals = [496.78, 281.82, 195.82, 172.60, 145.50, 128.68];
figure(1)
yyaxis right
plot(x2Vals, y2Vals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Processing time vs number of processors')

legend('250 Data', '10,000 Data')


%% Show two plots on same y-axis
%% Mean processing time
y1MeanVals = y1Vals / 250;
y2MeanVals = y2Vals / 10000;

figure(2)
plot(x1Vals, y1MeanVals, '-bd')
hold on
yyaxis right
plot(x2Vals, y2MeanVals, '-rx')
xlabel('Number of Processors')
ylabel('Processing time (s)')
title('Mean Processing time vs number of processors')
legend('250 Data', '10,000 Data')
end

