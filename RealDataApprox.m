function RealDataApprox (datafile,xFinal,yInitial,flipx)

# realDataApprox('BallMachine_Exp3_v2.txt',69,12.5/12,'flip')

% get data
data = dlmread(datafile); % this is delim read. it is finding ' ' and '\n' in this case

heightCheck = dlmread('sideline_heightCheck.txt');

x_sideline = heightCheck(:,1);
y_sideline = heightCheck(:,2);

#figure;
#plot(x_sideline,y_sideline,'ro');
#hold on;

% split data into points
frameCount = data(:,1);
x = data(:,2);
y = data(:,3);

#plot(x,y,'bo');

for i = 1:length(x)
  closeCandidates = abs(x(i)-x_sideline());
  [value index] = min(closeCandidates); % index of closest value
  zeroHeight = y_sideline(index); % closest value
  y(i) = y(i)-zeroHeight;
end;

#plot(x,y,'ko');

% make time varible based on frameCount
t = (frameCount-min(frameCount))/120;

% (optional) flip x data so that ball moves in positive x direction
if(flipx=='flip')
  x = max(x) - x;
end;
  
% flip y data since y axis is opposite for image convention.
y = max(y) - y;

% adjust x and y "mins" to be at 0
x = x - x(1);
y = y - y(end);

% scale (est) x and y to ft (from pixels)
x_real_final = xFinal; % ft
y_real_initial = yInitial; % ft 

x_ratio = x_real_final/x(end);
y_ratio = y_real_initial/y(1);
%y_ratio = 64/12/max(y);

x = x_ratio*x;
y = y_ratio*y;


% compute velocity (including angle) and save time
dataStep = 1;
timeStep = dataStep/120;  % 1/(frame rate)
sum = 0;
for i = 1:dataStep:(length(x)-dataStep)
  x0 = x(i); x1 = x(i+dataStep);
  y0 = y(i); y1 = y(i+dataStep);
  d = sqrt((x1-x0)^2+(y1-y0)^2);
  v(i) = d/(-t(i)+t(i+dataStep));
  theta(i) = atan((y1-y0)/(x1-x0))*180/pi;
  sum = sum + d;
end;

sum

v(1:5)
theta(1:5)

% make column vectors
v = v';
t = t';

% plot position
figure;
plot(x,y,'or');
grid on;
hold on;
%quiver(x(1),y(1),v0*cos(theta),v0*sin(theta));
%xlim([0 80]);
xlabel('Position Along Baseline (ft)');
ylabel('Position Above Court (ft)');
#title('Position Graph of Topspin Groundstroke by Ryan Grindle');

% plot speed
figure;
plot(t(1:end-1),v,'or');
grid on;
hold on;
xlabel('Time (s)');
ylabel('Speed (ft/s)');
#title('Speed Graph of Topspin Groundstroke by Ryan Grindle');

% plot speed
figure;
plot(t(1:end-1),theta,'or');
grid on;
hold on;
xlabel('Time (s)');
ylabel('Angle (degrees)');
#title('Angle Graph of Topspin Groundstroke by Ryan Grindle');

endfunction;