%% Creating a new environment

clc;

close all;

% Parameters that can be changed according to the experiments.
num_of_clusters = 5;  
start_range_mean = -10;%raio bs
end_range_mean = 10;%raio bs
start_range_var = 0;
end_range_var =  2;
data_points_per_cluster = 100;%100
no_of_users = num_of_clusters * data_points_per_cluster;

% Calling the generate_data function.
dat = generate_data(num_of_clusters, start_range_mean, end_range_mean, ...
   start_range_var, end_range_var, data_points_per_cluster);


X = dat(:,1);
Y = dat(:,2);


%% Plotting each of the Gaussian Dsitributions.

scatter(X,Y)