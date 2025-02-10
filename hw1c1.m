

clear % this command clears the memory 
clc %this command clears the command window 

%%%%%%%% Here we define the top & bottom parts of the head 
x=-1:.01:1;
yt=sqrt(1-x.^2); % top
yb=-sqrt(1-x.^2); % bottom

%%%%%%% here we define the mouth 
xm=-0.3:.01:0.3; 
ym=-0.1-sqrt(.3-xm.^2);

%%%%%%% here with you find the nose 
yn=0.1:.01:0.4;
xn=0*ones(1,length(yn));

%%%%%%%%% Here we plot the face 
figure
plot(x,yt,'b')
axis([-3 3 -3 3])
hold on
plot(x,yb,'b')
plot(xn,yn,'^b')
plot(-.5, .4,'ok') %Here we plot the left eye 
plot(.5 ,.4,'ok') %Here we plot the right eye 
plot(xm,ym,'b')
title('This is the original face')
xlabel('x')
ylabel('y')
grid on

%%%%%%%%% Here we defined a linear transformation 
T=[0.5 0; 0 3];
%T1=[cos(pi/2) -sin(pi/2); sin(pi/2) cos(pi/2)]
%T=T1*T;

%%%%%%%%%% Here we use the Matlab command “eig” to diagonalize matrix T, If possible 

[Pm,Dm]=eig(T) % See the command window for the outputs,   
% we can test the results by varifying that T = PDP^-1
Test=Pm*Dm*inv(Pm) % Observe that if the linear transformation T is diagonalizable then we must have T=Test matrix
% note that P={v1 v2}, where v1 and v2 determine the direction of the stretch or squeeze 


%%%%%%%%%%%% Additional note %%%%%%%%%

%We can see that the matrix that was discussed in the class is the product of a 
%diagonal matrix of vertical stretch/ horizontal squeeze  + horizontal shear
%Specifically we have A=D*S, where
A=[0.2 4; 0 3]
D=[0.2 0;0 3]
S=[1 20;0 1]
D*S

%%%%%%%%%%% Here we apply the linear transformation to each part of the face 
el=[-.5; 0.4];
er=[.5; 0.4];
Tt=T*[x;yt];
Tb=T*[x;yb];
Tn=T*[xn;yn];
Tm=T*[xm;ym];
Tel=T*el;
Ter=T*er;



%%%%%%% Here we plot the face after applying the transformation 
figure
plot(Tt(1,:),Tt(2,:),'b')
axis([-3 3 -3 3])
hold on
plot(Tb(1,:),Tb(2,:),'b')
plot(Tn(1,:),Tn(2,:),'^b')
plot(Tel(1), Tel(2),'ok')
plot(Ter(1) ,Ter(2),'ok')
plot(Tm(1,:),Tm(2,:),'b')
title('This is the transformed face')
xlabel('x')
ylabel('y')
grid on

