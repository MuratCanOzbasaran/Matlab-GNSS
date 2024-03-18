% load the collected data and assign it to variable 'Data'
Data = load('Otobus.mat');

% assign acceleration values to variables x, y, z and assign acceleration timestamp
x = Data.Acceleration.X;
y = Data.Acceleration.Y;
z = Data.Acceleration.Z;
timestamp = Data.Acceleration.Timestamp;

% calculate the magnitude of the combined 3-axes vector
magnitude = sqrt(x.^2 + y.^2 + z.^2);

% initialize a vector t with zeros
t = zeros(size(timestamp));

% Convert the absolute time into relative values setting the start as reference
for n = 1 : length(timestamp)
  t(n) = seconds(timestamp(n) - timestamp(1));
end

% plot the combined acceleration (magnitude) result with respect to time 't'
figure(1)
plot(t, magnitude);
xlabel('Time (s)');
ylabel('Acceleration Magnitude X (m/s^2)');
title('Combined Acceleration Magnitude');
% plot x-axis acceleration with respect to time 't'
figure(2);
plot(t, x);
xlabel('Time (s)');
ylabel('Acceleration Magnitude Y (m/s^2)');
title('X Acceleration Magnitude');
% plot y-axis acceleration with respect to time 't'
figure(3);
plot(t, y);
xlabel('Time (s)');
ylabel('Acceleration Magnitude Z (m/s^2)');
title('Y Acceleration Magnitude');
% plot z-axis acceleration with respect to time 't'
figure(4);
plot(t, z);
xlabel('Time (s)');
ylabel('Acceleration Magnitude (m/s^2)');
title('Z Acceleration Magnitude');

