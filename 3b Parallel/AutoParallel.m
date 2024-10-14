function AutoParallel

    function [total_time, hour_times, worker_times] = ParallelProcessing(data_size)
        
        


        % Define the number of hours and workers
        num_hours = 24;
        num_workers = maxNumCompThreads();

        % Pre-allocate array to store processing times
        hour_times = zeros(num_hours, 1);
        worker_times = zeros(num_workers, 1);

        % Generate random data
        data = rand(data_size, 1);

        % Loop over the hours and workers and process the data
        for hour = 1:num_hours
            for worker = 1:num_workers
                tic
                % Process the data with the current hour and worker
                processed_data = ProcessData(data, hour, worker);
                % Store the processing time for the current hour and worker
                worker_times(worker) = toc;
                hour_times(hour) = hour_times(hour) + worker_times(worker);
            end
        end

        % Calculate the total processing time
        total_time = sum(hour_times);

    end

    % Open a log file for writing
    log_file = fopen('resultslog.txt', 'w');

    function processed_data = ProcessData(data, hour, worker)

        

        % Do some processing on the data with the current hour and worker
        processed_data = data * hour * worker;
        pause(1);

    end

    % Define the sizes of data to test
    sizes = [250, 5000, 9000];

    % Pre-allocate arrays to store run times and processing times
    run_times = zeros(length(sizes), 1);
    hour_times_all = zeros(length(sizes), 24);
    worker_times_all = zeros(length(sizes), maxNumCompThreads());

    % Loop over the sizes of data and run the function
    for i = 1:length(sizes)
        % Call the function with the current size of data
        fprintf(log_file, 'Running with data size: %d\n', sizes(i));
        fprintf('Running with data size: %d\n', sizes(i));
        [total_time, hour_times, worker_times] = ParallelProcessing(sizes(i));
        run_times(i) = total_time;
        hour_times_all(i, :) = hour_times';
        worker_times_all(i, 1:length(worker_times)) = worker_times';
        fprintf(log_file, 'Run time: %f seconds\n', run_times(i));
        fprintf('Run time: %f seconds\n', run_times(i));
    end

    % Print the processing times for each hour for each load size
    disp('Processing time for each hour for each load size:');
    fprintf(log_file, '%f ', hour_times_all);
    disp(hour_times_all);

    % Print the processing times for each worker for each load size
    disp('Processing time for each worker for each load size:');
    fprintf(log_file, '%f ', worker_times_all);
    disp(worker_times_all);

    % Print the run time for each Datasize
    disp('Run time for each Datasize:');
    fprintf(log_file, '%f ', run_times);
    disp(run_times);

    disp('Maximum number of workers for each load size:');
    for i = 1:length(sizes)
        fprintf(log_file, '%f ', 'Data size %d: %d\n', sizes(i), min(maxNumCompThreads, sizes(i)));
        fprintf('Data size %d: %d\n', sizes(i), min(maxNumCompThreads, sizes(i)));
    end
    % Close the log file
    fclose(log_file);
    
    
    % Plot the processing time for 250, 5000, and 9000 data points
    figure
    hold on
    plot(hour_times_all(1,:), 'r')
    plot(hour_times_all(2,:), 'g')
    plot(hour_times_all(3,:), 'b')
    legend('250 Data Points', '5000 Data Points', '9000 Data Points')
    xlabel('Hour')
    ylabel('Processing Time (s)')
    title('Processing Time for Different Data Point Sizes')
    
    % Plot the processing time for 250 data points on the left y-axis
    % and for 5000 and 9000 data points on the right y-axis
    figure
    yyaxis left
    plot(hour_times_all(1,:), 'r')
    ylabel('Processing Time (s)')
    xlabel('Hour')
    title('Processing Time for Different Data Point Sizes')
    hold on
    yyaxis right
    plot(hour_times_all(2,:), 'g')
    plot(hour_times_all(3,:), 'b')
    legend('250 Data Points', '5000 Data Points', '9000 Data Points')
    ylabel('Processing Time (s)')
    xlabel('Hour')

    % Plot the run time for each data size
    figure
    plot(sizes, run_times, '-o')
    xlabel('Data Size')
    ylabel('Total Processing Time (s)')
    title('Run Time for Different Data Point Sizes')

    % Plot the processing time for each worker for each data size
    figure
    hold on
    for i = 1:length(sizes)
        plot(1:min(maxNumCompThreads, sizes(i)), worker_times_all(i, 1:min(maxNumCompThreads, sizes(i))), '-o')
end
    xlabel('Number of Workers')
    ylabel('Processing Time (s)')
    title('Processing Time for Different Number of Workers')
    legend('250 Data Points', '5000 Data Points', '9000 Data Points')
    end

    % End of the function