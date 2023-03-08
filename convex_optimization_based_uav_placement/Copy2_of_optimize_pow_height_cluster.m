% Function that gives the optimal Power, Height, Coverage Radius, Users
% Served with the given thresholds. 
%Função que fornece a potência ideal, altura, raio de cobertura, usuários
% Servido com os limites fornecidos.

function [pow, height, rad, users_served, total_users] = Copy2_of_optimize_pow_height_cluster(k_means_cluster, ... 
    centroid, p_thresh, h_thresh, alpha, channel_cap_thresh, bw_uav)
    
    % Input:
    % k_means_cluster: Contains the x and y cooordinates of all points in
    % the cluster.
    % centroid: Contains the x and y coordinate of the centroid of the
    % cluster.
    % p_thresh: Power threshold of the UAV.
    % h_thresh: Minimum height threshold of the UAV.
    % alpha: Tradeoff between height and power.
    % channel_cap_thresh: Minimum channel capacity required for proper
    % communication.
    % bw_uav: Bandwidth of the UAV communication.
    % var_n: Noise Variance
    
    % Output:
    % pow: Power required by the UAV to communicate.
    % height: Minimum height required by the UAV to communicate.
    % rad: Radius of the cluster that can be served.
    % users_served: Number of users served.
    
    % Latex Equation:
    % \textrm{min }(\alpha P + (1 - \alpha) * H) \\
    % \textrm{subject to: } \\
    % 0 <= P <= P_{Threshold} \\
    % H >= H_{Threshold} \\
    % BW*log (1 + \frac{P}{D^2 + H^2})

    
    
    % Creating the Data Array,
    dist = (k_means_cluster(:, 1) - centroid(1,1)) .^ 2 + ... 
        (k_means_cluster(:, 2) - centroid(1,2)) .^ 2;
    
    % Sorting the array
    [~, id] = sort(dist(:,1));
    dist = dist(id, :);
    
    % Creating a Loop to check which max
    K = size(k_means_cluster, 1);

    pow = 25;
    height = 0.5;
    rad = 3;
    users_served = 90;
    total_users = K;
    for i=K:-1:1
       


            fprintf('pow: %f \n', pow);
            fprintf('height: %f \n', height);
            fprintf('rad: %f \n', rad);
            fprintf('users_served: %f \n', users_served);
            fprintf('totalusers: %f \n', total_users);
fprintf('========================= \n');
   

    end 
    