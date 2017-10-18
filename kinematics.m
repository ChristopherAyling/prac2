global h;
global r;
global l1;
global l2;
global l3;
global l4;
global c;
h = 53.0;
r = 30.309;
l1 = sqrt(r*r + h*h);
l2 = 170.384;
l3 = 136.307;
l4 = 86.0;
c = 40.0;

jointRot = backwardKinematics(200, 200, 200);
jointPos = forwardKinematics(jointRot(1), jointRot(2), jointRot(3), jointRot(4));

%for i = 1:length(jointRot)
%    jointRot(i) = jointRot(i) * 180 / pi;
%end

function result = backwardKinematics(x, y, z)
    global h;
    global r;
    global l2;
    global l3;
    r1 = sqrt(x*x + y*y);
    i2 = r1 - r;
    j2 = z - h;
    l23 = sqrt(i2*i2 + j2*j2);
    Theta1 = atan2(y, x);
    Theta2a = atan2(j2, i2);
    Theta2b = acos((-(l3*l3) + (l23*l23) + (l2*l2)) / (2 * l23 * l2));
    Theta2 = Theta2a + Theta2b;
    Theta3 = acos((-(l23*l23) + (l3*l3) + (l2*l2)) / (2 * l3 * l2));
    Theta4 = (2*pi) - (pi/2) - Theta2 - Theta3;
    result = [Theta1, Theta2, Theta3, Theta4];
end

function result = forwardKinematics(Theta1, Theta2, Theta3, Theta4)
    global h;
    global r;
    global l2;
    global l3;
    l23 = sqrt(l2*l2 + l3*l3 - 2*l2*l3*cos(Theta3));
    Theta2b = acos((-(l3*l3) + (l23*l23) + (l2*l2)) / (2 * l23 * l2));
    Theta2a = Theta2 - Theta2b;
    i2 = cos(Theta2a) * l23;
    j2 = sin(Theta2a) * l23;
    r2 = i2 + r;
    x = cos(Theta1) * r2;
    y = sin(Theta1) * r2;
    z = j2 + h;
    result = [x, y, z];
end