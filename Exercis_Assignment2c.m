% Load the collected data and assign it to variable 'Data'
Data = load('Otobus.mat');

% Retrieve the latitude, longitude and altitude to a new variable
gps_lat = Data.Position.latitude;
gps_long = Data.Position.longitude;
gps_alti = Data.Position.altitude;

% Retrieve GNSS data 
gps_data = [gps_lat, gps_long, gps_alti];

% Convert GNSS data from lla to NED frame and assign it to 'lla_ned'
lla_ned = zeros(length(gps_data), 3);
for jj = 1:length(gps_data)
    gps_lat_long_alt1 = [0, 0, 0];
    gps_lat_long_alt2 = [gps_data(jj, 1), gps_data(jj, 2), gps_data(jj, 3)];
    lla2ned_val = lla2ned(gps_lat_long_alt2, gps_lat_long_alt1, "ellipsoid"); 
    lla_ned(jj, :) = lla2ned_val;
end

% estimate standard deviation of the latitude and longitude after ECEF
% conversion and assign it to variables 'sigma_lat' and 'sigma_lon'
sigma_lat = 
sigma_lon = 
sigma_alti = 

%3D GPS noise covariance matrix
R_GPS = [
    sigma_lat^2, 0, 0;
    0, sigma_lon^2, 0;
    0, 0, sigma_alti^2;
];

% Object tracking using a Kalman filter 
kf = trackingKF('MotionModel', '3D Constant Velocity'); 

% Initialize state estimate 
initialState = [lla_ned(1,1); 0; lla_ned(1,2); 0; lla_ned(1,3); 0]; 
initialCovariance = diag([1, 1, 1, 1, 1, 1]); % Initial covariance matrix

% Set the initial state of the filter
initialize(kf, initialState, initialCovariance);

% User tracking
for ii = 1:(length(lla_ned)) 
    
    % Get GPS measurement data
    gpsMeasurement = [lla_ned(ii, 1); lla_ned(ii, 2); lla_ned(ii, 3)];

    % Predict the next state based on the model
    predict(kf);

    % Update the state estimate with the GPS measurement
    gpsMeasurementNoise = R_GPS;
    stateEstimate = correct(kf, gpsMeasurement, gpsMeasurementNoise);

    % Extract the state estimate
    estimatedLatitude(ii) = stateEstimate(1);
    estimatedLongitude(ii) = stateEstimate(3); 
    estimatedaltitude(ii) = stateEstimate(5); 
    
    % Get the state estimate
    stateEstimate = kf.State;
end 

% Convert the estimated latitude, longitude, altitude in NED frame to lla frame.


% Plot the Kalman filter estimated trajectory and actual trajectory on webmap


