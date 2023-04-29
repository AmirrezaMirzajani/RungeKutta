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
    kx2=F(t(i)+0.25*h,y(:,i)+(1/4)*h*kx1);
    kx3=F(t(i)+0.25*h,y(:,i)+((1/8)*kx1+(1/8)*kx2)*h);
    kx4=F(t(i)+0.5*h,y(:,i)+(-0.5*kx2+kx3)*h);
    kx5=F(t(i)+(3/4)*h,y(:,i)+((3/16)*kx1+(9/16)*kx4)*h);
    kx6=F(t(i)+h,y(:,i)+((-3/7)*kx1+(2/7)*kx2+(12/7)*kx3-(12/7)*kx4+(8/7)*kx5)*h);
    y(:,i+1)=y(:,i)+(7*kx1+32*kx3+12*kx4+32*kx5+7*kx6)*h/90;
end
figure()
plot(t,y)
title('Runge kutta 5th order');