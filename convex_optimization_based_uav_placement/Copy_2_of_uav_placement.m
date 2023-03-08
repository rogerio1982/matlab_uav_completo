%% Creating a new environment

clc;
close all;


%% Generating the data from each of the 2D Gaussian Distributions.

% Parameters that can be changed according to the experiments.
%num_of_clusters = 5;  
%start_range_mean = -280;%raio bs
%end_range_mean = 280;%raio bs
%start_range_var = 0;
%end_range_var =  2;
%data_points_per_cluster = 100;%100
%no_of_users = num_of_clusters * data_points_per_cluster;


% Parameters that can be changed according to the experiments.
num_of_clusters = 5;  
start_range_mean = -1;%raio bs
end_range_mean = 1;%raio bs
start_range_var = 0;
end_range_var =  2;
data_points_per_cluster = 1000;%100
no_of_users = num_of_clusters * data_points_per_cluster;


% Calling the generate_data function.
data = generate_data(num_of_clusters, start_range_mean, end_range_mean, ...
   start_range_var, end_range_var, data_points_per_cluster);


X = data(:, 1);
Y = data(: ,2);



%% Plotting each of the Gaussian Dsitributions.
scatter(X,Y ,idx)

title('Users Distributed ');
xlabel('500 meters');
ylabel('500 meters');
%% Getting the K-Means Centroids and Clusters

num_of_centroids = num_of_clusters;
[idx, centroids] = kmeans(data, num_of_centroids);

% Getting the Clusters Associated with each centroid.
k_means_clusters = cell(num_of_centroids, 1);
for i = 1:num_of_centroids
    k_means_clusters{i} = [X(idx==i),Y(idx==i)] ;
end



%% Generating Random Points for Placing the the Random UAVs

start_range_random = start_range_mean - sqrt(end_range_var);
end_range_random = end_range_mean + sqrt(end_range_var);
X_random = start_range_random + (end_range_random - start_range_random) * ... 
    rand(num_of_clusters, 1);
Y_random = start_range_random + (end_range_random - start_range_random) * ...
    rand(num_of_clusters, 1);
random_centroids = [X_random, Y_random];


%% Getting the optimal UAV power, height, coverage area, and the users served per Cluster
% Obtendo a potência ideal do UAV, altura, área de cobertura e os usuários atendidos por cluster

% The five columns are optimal power, optimal height, radius of the users
% served, number of users served
optimal_data = zeros(num_of_centroids, 5);
power_threshold = 30;
height_threshold = 0.5;
bw_uav  = 5;
alpha =  0;%0.1;
chan_capacity_thresh = 1;
var_n = 0.5;



for i=1:num_of_centroids
    alpha =  rand();
    [optimal_data(i,1), optimal_data(i,2), optimal_data(i,3), ...
        optimal_data(i,4), optimal_data(i,5)] = ...
        optimize_pow_height_cluster(k_means_clusters{i}, centroids(i,:), ...
        power_threshold, height_threshold, alpha, chan_capacity_thresh, bw_uav);
end

% salvo no arquivo optimal_data




%% Plotting 2d the K-Means Centroids

figure('Name', 'K Means Centroids', 'units','normalized','outerposition', ...
    [0 0 1 1]);

gscatter(X, Y, idx);

p_centroid = plot(centroids(:,1), centroids(:,2), 'kx', 'MarkerSize', 10, 'LineWidth', 3); 
hold on;
p_center = plot(x_bs, y_bs, 'ks', 'MarkerSize', 10, 'LineWidth', 3);
hold on;
users = scatter(X, Y, idx);
hold on;
%axis equal;

legend([p_centroid,p_center], 'UAV', 'Base Station');
%legend([p_centroid],'UAVs')

title('2D Coverage UAV Base stations ');
xlabel('500 meters');
ylabel('500 meters');
%text(centroids(:,1) + dx, centroids(:,2) + dy, numbered_labelling_uav);
%text(x_bs + dx, y_bs + dy, numbered_labelling_bs);



%% Plotting 3d

figure('Name', 'Communication Ranges', 'units','normalized','outerposition', ...
    [0 0 1 1]);

for i=1:num_of_centroids
    %alteracao para plot 3d
    x_circle_uav = centroids(i, 1) ;
    y_circle_uav = centroids(i, 2) ;
    z = duration(0,50,1);
    
    plot3(x_circle_uav,y_circle_uav,z,'X','DurationTickFormat','mm:ss')
    xlabel('X')
    ylabel('Y')
    zlabel('height')
    hold on;
end


p_centroid = plot(centroids(:,1), centroids(:,2), 'kx', 'MarkerSize', 10, 'LineWidth', 3); 
hold on;
p_center = plot(x_bs, y_bs, 'ks', 'MarkerSize', 10, 'LineWidth', 3);
hold on;
users = gscatter(X, Y, idx);
hold on;
%axis equal;

legend([p_centroid,p_center], 'UAV', 'Base Station');
%legend([p_centroid],'UAVs')

title(' 3D Coverage UAV Base stations ');
xlabel('500 meters');
ylabel('500 meters');




