function Z=NTU812
k1=10000;%/mol/min
k2=600;%/min
k3=150;%/min
cE=10^(-6);%mol
cS=10^(-5);%mol
K0=k1*cE*cS;%initial reaction rate.
a=(k2+k3)*cE;%intermidate variable.
for i=1:400000
    x(i)=0.002*(i-1);
    h=0.002;
    if i==1
        ys(i)=cS;
        ye(i)=cE;
        yp(i)=0;
        yes(i)=0;
        KS1=-K0;
        KE1=-K0;
        KP1=0;
        V(i)=0;
        KES1=K0;
        KS2=-k1*(ys(i)+h/2*KS1)*(ye(i)+h/2*KE1)+(yes(i)+h/2*KES1)*k2;
        KE2=-k1*(ys(i)+h/2*KS1)*(ye(i)+h/2*KE1)+(yes(i)+h/2*KES1)*(k2+k3);
        KP2=k3*(yes(i)+h/2*KES1);
        KES2=k1*(ys(i)+h/2*KS1)*(ye(i)+h/2*KE1)-(yes(i)+h/2*KES1)*(k2+k3);
        KS3=-k1*(ys(i)+h/2*KS2)*(ye(i)+h/2*KE2)+(yes(i)+h/2*KES2)*k2;
        KE3=-k1*(ys(i)+h/2*KS2)*(ye(i)+h/2*KE2)+(yes(i)+h/2*KES2)*(k2+k3);
        KP3=k3*(yes(i)+h/2*KES2);
        KES3=k1*(ys(i)+h/2*KS2)*(ye(i)+h/2*KE2)-(yes(i)+h/2*KES2)*(k2+k3);
        KS4=-k1*(ys(i)+h*KS3)*(ye(i)+h*KE3)+k2*(yes(i)+h*KES3);                
        KE4=-k1*(ys(i)+h*KS3)*(ye(i)+h*KE3)+(yes(i)+h*KES3)*(k2+k3);
        KP4=k3*(yes(i)+h*KES3);
        KES4=k1*(ys(i)+h*KS3)*(ye(i)+h*KE3)-(yes(i)+h*KES3)*(k2+k3);    
    else
         ys(i)=ys(i-1)+h*(KS1+2*KS2+2*KS3+KS4)/6;
         ye(i)=ye(i-1)+h*(KE1+2*KE2+2*KE3+KE4)/6;
         yp(i)=yp(i-1)+h*(KP1+2*KP2+2*KP3+KP4)/6;
         yes(i)=yes(i-1)+h*(KES1+2*KES2+2*KES3+KES4)/6;
         KS1=-k1*ys(i)*ye(i)+yes(i)*k2;
         KE1=-k1*ys(i)*ye(i)+yes(i)*(k2+k3);
         KP1=k3*yes(i);
         V(i)=(KP1+2*KP2+2*KP3+KP4)/6;
         KES1=k1*ys(i)*ye(i)-(k2+k3)*yes(i);
         KS2=-k1*(ys(i)+h/2*KS1)*(ye(i)+h/2*KE1)+(yes(i)+h/2*KES1)*k2;
         KE2=-k1*(ys(i)+h/2*KS1)*(ye(i)+h/2*KE1)+(yes(i)+h/2*KES1)*(k2+k3);
         KP2=k3*(yes(i)+h/2*KES1);
         KES2=k1*(ys(i)+h/2*KS1)*(ye(i)+h/2*KE1)-(yes(i)+h/2*KES1)*(k2+k3);
         KS3=-k1*(ys(i)+h/2*KS2)*(ye(i)+h/2*KE2)+(yes(i)+h/2*KES2)*k2;
         KE3=-k1*(ys(i)+h/2*KS2)*(ye(i)+h/2*KE2)+(yes(i)+h/2*KES2)*(k2+k3);
         KP3=k3*(yes(i)+h/2*KES2);
         KES3=k1*(ys(i)+h/2*KS2)*(ye(i)+h/2*KE2)-(yes(i)+h/2*KES2)*(k2+k3);
         KS4=-k1*(ys(i)+h*KS3)*(ye(i)+h*KE3)+k2*(yes(i)+h*KES3);                
         KE4=-k1*(ys(i)+h*KS3)*(ye(i)+h*KE3)+(yes(i)+h*KES3)*(k2+k3);
         KP4=k3*(yes(i)+h*KES3);
         KES4=k1*(ys(i)+h*KS3)*(ye(i)+h*KE3)-(yes(i)+h*KES3)*(k2+k3);
    end
end
figure(1)%figure of substrate S-time T.
plot(x,ys);
title('amount of substrate-time relation');
xlabel('time/min');
ylabel('amount of substrate/mol');
figure(2);%figure of enzyme E-time T.
plot(x,ye);
title('amount of enzyme-time relation');
xlabel('time/min');
ylabel('amount of enzyme/mol');
figure(3)%figure of product P-time T.
plot(x,yp);
title('amount of product-time relation');
xlabel('time/min');
ylabel('amount of product/mol');
figure(4)%figure of ES complex-time T.
plot(x,yes);
xlabel('time/min');
title('amount of ES complex-time relation');
ylabel('amount of ES complex/mol');
for i=1:1000
    s(i)=0.005*(i-1);%Michaelis–Menten kinetics.
    p(i)=(k3*cE*s(i))/(s(i)+(k2+k3)/k1);
end
figure(5)
plot(s,p);%figure of velocity V-substrate S,by Michaelis–Menten kinetics.
title('velocity-substrate relation');
xlabel('amount of substrate/mol');
ylabel(' velocity/mol/min');
figure(6)
plot(ys,V);%figure of velocity V-substrate S,by this algorithm..
title('velocity-substrate relation');
xlabel('amount of substrate/mol');
ylabel(' velocity/mol/min');
end