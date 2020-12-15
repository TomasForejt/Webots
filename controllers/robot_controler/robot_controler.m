% MATLAB controller for Webots
% File:          robot_controler.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
%  motor = wb_robot_get_device('motor');
motor_left = wb_robot_get_device('motor_left');
motor_right = wb_robot_get_device('motor_right');
motor_leftB = wb_robot_get_device('motor_leftB');
motor_rightB = wb_robot_get_device('motor_rightB');

ifR = wb_robot_get_device('ifR');
ifL = wb_robot_get_device('ifL');


wb_motor_set_position(motor_left, inf);
wb_motor_set_velocity(motor_left, -3);
wb_motor_set_position(motor_right, inf);
wb_motor_set_velocity(motor_right, 3);
wb_motor_set_position(motor_leftB, inf);
wb_motor_set_velocity(motor_leftB, -3);
wb_motor_set_position(motor_rightB, inf);
wb_motor_set_velocity(motor_rightB, 3);







% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1

ifL_value = wb_distance_sensor_get_value(ifL)

if ifL_value > 800

 
wb_motor_set_velocity(motor_left, 0);
wb_motor_set_velocity(motor_right, 0);
wb_motor_set_velocity(motor_leftB, 0);
wb_motor_set_velocity(motor_rightB,0);
else

wb_motor_set_velocity(motor_left, -3);
wb_motor_set_velocity(motor_right, 3);
wb_motor_set_velocity(motor_leftB, -3);
wb_motor_set_velocity(motor_rightB, 3);
    
    
end


  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.
