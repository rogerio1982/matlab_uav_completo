
clc;
clear all;
close all;


x = rand(1,10);
y = rand(1,10);
z = duration(rand(10,1),randi(60,10,1),randi(60,10,1));

plot3(x,y,z,'o','DurationTickFormat','mm:ss')
xlabel('X')
ylabel('Y')
zlabel('Duration')
grid on


  