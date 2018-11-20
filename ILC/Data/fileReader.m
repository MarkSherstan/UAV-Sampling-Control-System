clear all
close all

load 1000PWM.txt
A = X1000PWM;

time = A(:,1) * 1e-6;
pos = A(:,2); % Measured at gear (multiply by 2 to get pinion)
voltage = A(:,3);
current = A(:,4);
PWM = A(:,5);

% Find the min angle values for rpm calc
localMin = islocalmin(pos,'MinProminence',30);
idx = find(localMin);

deltaTime = time(idx);

for ii = 1:length(deltaTime) - 1
    rps(ii) = deltaTime(ii+1)-deltaTime(ii);
end

Ts = mean(diff(time));
t = [0:Ts:time(1) time']';
y = [ones(1,length(0:Ts:time(1)))*current(1) current']';
u = [zeros(1,length(0:Ts:time(1))) PWM']';

y = y(1:1800);
u = u(1:1800);
% figure
% plot(t,y)
% 
% figure
% plot(t,u)


data = iddata(y,u,Ts);

sys = tfest(data,3)

% 
rpm = (1/mean(rps))*60

% 
% % Make some figures
% figure(1)
% plot(time,voltage)
% title('Voltage vs Time')
% 
% figure(2)
% plot(time,current)
% title('Current vs Time')
% 
% figure(3)
% plot(time,pos,time(idx),pos(idx),'*r')
% title('Position vs time')