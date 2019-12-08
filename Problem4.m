function Problem4()
disp('This will display the path of trajectory of an object');

%Input of data
y = input('Initial height of the object (from the ground) ');
v = input('Velocity of the object ');
theta = input('Angle of the projectile ');
ax = input('Horizontal Acceleration ');
ay = input('Vertical Acceleration ');
g = -9.8;

if ay == 0
    msg = ('Invalid value for Vertical Acceleration');
    error(msg)
    
elseif theta > 180
    msg = ('Invalid value for Angle; Angle cannot exceed 180 degrees');
    error(msg)
    
else
    A = -(1/2)*ay;
    B = (v*sind(theta));
    C = -y;
    D = sqrt(B^2 - 4*A*C);
    x1 = abs(( -B + D ) / (2*A));
    x2 = abs(( -B - D ) / (2*A));
    time = max([x1, x2]);
    t = 0:0.0001:time;
    X = (v*cosd(theta).*t)+(1/2).*ax.*t.^2;
    Y = y + (v*sind(theta).*t)+(1/2).*ay*t.^2;
    plot(X, Y,'-r','markersize',5);
    hold on
    K = sqrt(B^2 - 4*(4.9)*C);
    x3 = abs(( -B + K ) / (2*(4.9)));
    x4 = abs(( -B - K ) / (2*(4.9)));
    time2 = max([x3, x4]);
    t2 = 0:0.0001:time2;
    N = (v*cosd(theta).*t2)+(1/2).*ax.*t2.^2;
    M = y + (v*sind(theta).*t2)+(1/2).*g*t2.^2;
    plot(N, M,'--m','markersize',5);
    grid on
    xlabel 'X-axis'; ylabel 'Y-axis'; title 'Projectile Motion';
    legend('Non-Ideal','Ideal');
end
end
