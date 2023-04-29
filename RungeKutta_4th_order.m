clc
clear
%%
h=0.1;
t0=0;
tF=0.7;
x0=0.5;
y0=-0.5;
t=t0:h:tF;
F=@(t,y)[-y(1)+6*y(2);-y(2)+4*y(1)];
y=zeros(2,length(t));

y(:,1)=[x0 ; y0];
for i=1:(length(t)-1)
    kx1=F(t(i),y(:,i));
    kx2=F(t(i)+0.5*h,y(:,i)+0.5*h*kx1);
    kx3=F(t(i)+0.5*h,y(:,i)+0.5*h*kx2);
    kx4=F(t(i)+h,y(:,i)+kx3*h);
    y(:,i+1)=y(:,i)+(kx1+2*kx2+2*kx3+kx4)*h/6;
end
figure(1)
plot(t,y)