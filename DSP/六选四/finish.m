f1=20;f2=5;f3=40;f4=5;
N=1600;
Fs=1000;T=1/Fs;Tp=N*T;
t=0:T:(N-1)*T;k=0:N-1;f=k/Tp;
s1=cos(2.*pi.*f1.*t).*cos(2.*pi.*f2.*t);
s2=10.*cos(2.*pi.*f3.*t).*cos(2.*pi.*f4.*t);
xt=s1+s2;
S1=fft(s1,N);
S2=fft(s2,N);
X=fft(xt,N);%%第一问； 
Fs1=100;T1=1/Fs1;Tp1=N*T1;
t1=0:T1:(N-1)*T;f1n=k/Tp1;
s1n=cos(2.*pi.*f1.*t1).*cos(2.*pi.*f2.*t1);
s2n=10.*cos(2.*pi.*f3.*t1).*cos(2.*pi.*f4.*t1);
xtn=s1n+s2n;
S1n=fft(s1n,N);
S2n=fft(s2n,N);
X1n=fft(xtn,N);%%第二问； 
fp=28;fs=34;
wp=2*fp/Fs1;ws=2*fs/Fs1;rp=1;rs=50;
[N,Wc]=buttord(wp,ws,rp,rs);
[Bz,Az]=butter(N,Wc);
w=0:0.001:3;
[H1,w]=freqz(Bz,Az,w);
ytn=filter(Bz,Az,xtn);
Y=fft(ytn,N);
figure(1);title('模拟信号时域');
subplot(3,1,1);plot(t,s1);title('s1(t)');xlabel('时间（s）');ylabel('幅度');
grid;
subplot(3,1,2);plot(t,s2);title('s2(t)');xlabel('时间（s）');ylabel('幅度');
grid;
subplot(3,1,3);plot(t,xt);title('x(t)');xlabel('时间（s）');ylabel('幅度');
grid;
figure(2);title('模拟信号频域');
subplot(3,1,1);plot(f,abs(S1)/max(abs(S1)));title('s1(t)');xlabel('频率（f/Hz）');ylabel('幅度');
axis([0 50 0 1.2]);grid;
subplot(3,1,2);plot(f,abs(S2)/max(abs(S2)));title('s2(t)');xlabel('频率（f/Hz）');ylabel('幅度');
axis([0 50 0 1.2]);grid;
subplot(3,1,3);plot(f,abs(X)/max(abs(X)));title('x(t)');xlabel('频率（f/Hz）');ylabel('幅度');
axis([0 50 0 1.2]);grid;
figure(3);title('离散信号时域');
subplot(3,1,1);stem(t1,s1n);title('s11(t)');xlabel('时间（s）');ylabel('幅度');
grid;
subplot(3,1,2);stem(t1,s2n);title('s22(t)');xlabel('时间（s）');ylabel('幅度');
grid;
subplot(3,1,3);stem(t1,xtn);title('x1(t)');xlabel('时间（s）');ylabel('幅度');
grid;
figure(4);title('离散信号频域');
subplot(3,1,1);plot(f1n,abs(S1n)/max(abs(S1n)));title('s1(t)');xlabel('频率（f/Hz）');ylabel('幅度');
axis([0 50 0 1.2]);grid;
subplot(3,1,2);plot(f1n,abs(S2n)/max(abs(S2n)));title('s2(t)');xlabel('频率（f/Hz）');ylabel('幅度');
axis([0 50 0 1.2]);grid;
subplot(3,1,3);plot(f1n,abs(X1n)/max(abs(X1n)));title('x(t)');xlabel('频率（f/Hz）');ylabel('幅度');
axis([0 50 0 1.2]);grid;
figure(5);title('滤波器时频域');
subplot(2,1,1),plot(w/pi,20*log10(abs(H1)));xlabel('\omega/\pi');ylabel('|H1(e^j^\omega)|/dB');
subplot(2,1,2),plot(w/pi,angle(H1)/pi);xlabel('\omega/\pi');ylabel('\phi(\omega)/\pi');
figure(6);title('ytn时频域');
subplot(2,1,1);plot(ytn);title('yt(n)');xlabel('时间（s）');ylabel('幅度');
subplot(2,1,2);plot(abs(Y)/max(abs(Y)));title('Y(n)');xlabel('频率（f/Hz）');ylabel('幅度');