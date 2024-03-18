% load the collected data and assign it to variable 'Data' 
data = load('Otobus.mat', 'Position');

% assign latitude and longitude values to variables 'latitude' and 'longitude'
load('latitude.mat')
load('longitude.mat')

% Plot vehicle trajectory using the latitude and longitude
plot(longitude, latitude, 'r-','LineWidth', 3); % Plot trajectory with red line
hold on;
grid on;
xlabel('Longitude', 'FontSize', 14); % X-axis label
ylabel('Latitude', 'FontSize', 14); % Y-axis label
title('Trajectory of the Bus Number 2 In Vaasa', 'FontSize', 16);

% import webmap to visualize the data in a map
gnssTrack = geoshape(latitude, longitude);

% plot the driven/collected path using geoshape object
wm = webmap('OpenStreetMap');

% define the color and width for the driven/collected path
wmline(gnssTrack, 'Color', 'red', 'Width', 3);

% Calculate the total distance by using the function 
total_distance = calculate_total_distance(latitude, longitude);

% display the total distance in meters or kilometers
disp(['Total distance: ', num2str(total_distance), ' km']);

function total_distance = calculate_total_distance(latitude, longitude)
% Convert latitude and longitude from degrees to radians
 lat_radians = deg2rad(latitude);
 long_radians = deg2rad(longitude);

% Earth's radius in kilometers
earthRadius = 6371; 

% Initialize total distance
total_distance = 0;

    % Calculate distances between consecutive points
     for i = 1:(length(latitude) - 1)
        deltaLat = lat_radians(i+1) - lat_radians(i);
        deltaLon = long_radians(i+1) - long_radians(i);
        a = sin(deltaLat / 2)^2 + cos(lat_radians(i)) * cos(lat_radians(i+1)) * sin(deltaLon / 2)^2;
        c = 2 * atan2(sqrt(a), sqrt(1-a));
        distance = earthRadius * c;  % Distance in kilometers

        % Sum up the distance
        total_distance = total_distance + distance;
    end

end

