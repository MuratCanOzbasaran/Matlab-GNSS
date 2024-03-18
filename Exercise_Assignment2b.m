% load the collected data and assign it to variable 'Data'
Data = load('Otobus.mat');

% assign magnetic field values to respective variables and timestamp
 
Mag_X= Data.MagneticField.X;
Mag_Y= Data.MagneticField.Y;
Mag_Z= Data.MagneticField.Z;
Ori_timestamp= Data.MagneticField.Timestamp;
% initialize a vector t_mag with zeros
t_mag = sqrt(Mag_X.^2 + Mag_Y.^2 + Mag_Z.^2);

% Convert the absolute time into relative values setting the start as reference

Ori_timestamp_relative = seconds(Ori_timestamp - Ori_timestamp(1));

% assign orientation values to respective variables and timestamp
Ori_X = Data.Orientation.X;
Ori_Y = Data.Orientation.Y;
Ori_Z = Data.Orientation.Z;
Ori_timestamp = Data.Orientation.Timestamp;

% initialize a vector t_ori with zeros
t_ori = zeros(length(Ori_timestamp), 1);
t_ori = (Ori_timestamp - Ori_timestamp(1));
% Convert the absolute time into relative values setting the start as reference
t_ori = seconds(Ori_timestamp - Ori_timestamp(1));

% assign Angular Velocity values to respective variables and timestamp
AV_X = Data.AngularVelocity.X;
AV_Y = Data.AngularVelocity.Y;
AV_Z = Data.AngularVelocity.Z;
AV_timestamp = Data.AngularVelocity.Timestamp;

% initialize a vector t_AV with zeros
t_AV = zeros(length(AV_timestamp), 1);

% Convert the absolute time into relative values setting the start as reference
t_AV = seconds(AV_timestamp - AV_timestamp(1));

% % plot x-axis magnetic field with respect to time 't'
% subplot(3, 1, 1);  % 3 satır 1 sütunluk bir grid'in ilk elemanı
% plot(t_mag, Mag_X);
% title('Magnetic Field in X-axis');
% xlabel('Time (s)');
% ylabel('Magnetic Field (uT)');
% % plot y-axis magnetic field with respect to time 't'
% subplot(3, 1, 2);  % 3 satır 1 sütunluk bir grid'in ikinci elemanı
% plot(t_mag, Mag_Y);
% title('Magnetic Field in Y-axis');
% xlabel('Time (s)');
% ylabel('Magnetic Field (uT)');
% % plot z-axis magnetic field with respect to time 't'
% subplot(3, 1, 3);  % 3 satır 1 sütunluk bir grid'in üçüncü elemanı
% plot(t_mag, Mag_Z);
% title('Magnetic Field in Z-axis');
% xlabel('Time (s)');
% ylabel('Magnetic Field (uT)');
% plot x-axis orientation with respect to time 't'
% subplot(3, 2, 1); 
% plot(t_ori, Ori_X);
% title('X-axis Orientation');
% xlabel('Time (s)');
% ylabel('Orientation (degrees/radians)');
% % plot y-axis orientation with respect to time 't'
% subplot(3, 2, 3); 
% plot(t_ori, Ori_Y);
% title('Y-axis Orientation');
% xlabel('Time (s)');
% ylabel('Orientation (degrees/radians)');
% % plot z-axis orientation with respect to time 't'
% subplot(3, 2, 5);
% plot(t_ori, Ori_Z);
% title('Z-axis Orientation');
% xlabel('Time (s)');
% ylabel('Orientation (degrees/radians)');
% plot x-axis Angular Velocity with respect to time 't'
subplot(3, 2, 2); 
plot(t_AV, AV_X);
title('X-axis Angular Velocity');
xlabel('Time (s)');
ylabel('Angular Velocity (rad/s)');
% plot y-axis Angular Velocity with respect to time 't'
subplot(3, 2, 4); 
plot(t_AV, AV_Y);
title('Y-axis Angular Velocity');
xlabel('Time (s)');
ylabel('Angular Velocity (rad/s)');
% plot z-axis Angular Velocity with respect to time 't'
subplot(3, 2, 6); 
plot(t_AV, AV_Z);
title('Z-axis Angular Velocity');
xlabel('Time (s)');
ylabel('Angular Velocity (rad/s)');

