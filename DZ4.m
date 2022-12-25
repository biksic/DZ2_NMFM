f=@(x) 5*sin(5*x)+5*cos(5*x)+5*x;
n=7;
N=2^n;
x=[0:2*pi/N:2*pi*(N-1)/N];;
fut=f(x); 

b=FFT(fut,n);

for i=1:N
  p(i)=hornerova_shema(x(i),b);
end

p=p';
for i=1:N
e(i)=abs(fut(i)-p(i));
end
greska_4=max(e);

figure(1)
fplot(f, [0 2*pi], 'r-');
hold on
plot(x,p,'bo');
title('Interpolacija faznim polinomom');
xlabel('x'); ylabel('f(x)');
legend('f(x)=5sin(5x)+5cos(5x)+5x','(x_k,p(x_k))');
hold off
print slika4.pdf

figure(2)
fplot(f, [0 2*pi], 'r-');
hold on
plot(x,p,'bo');
title('Interpolacija faznim polinomom na intervalu [0,0.5]');
xlabel('x'); ylabel('f(x)');
legend('f(x)=5sin(5x)+5cos(5x)+5x','(x_k,p(x_k))');
xlim([0,0.5])
hold off
print slika4ogranicena.pdf

save greska4.mat greska_4