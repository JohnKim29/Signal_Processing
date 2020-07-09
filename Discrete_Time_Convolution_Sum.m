clear
clc

x = [1,2,-1,1]; % Input Signal
h = [2,3,1]; % System
times = length(x) + length(h) - 1; % Compute Times

space_x = zeros(1,length(h)); 
space_h = zeros(1,length(x));
%vector length matching

x = horzcat(space_x,x); 
h = horzcat(space_h,h);
% for multiply vector and transposed vector (Multiplication & Sum)

h=fliplr(h); % Folding

for i = 1:times
    h=circshift(h,1); % Shifting
    y(i) = x*h'; % Multiplication & Sum
end

y%output