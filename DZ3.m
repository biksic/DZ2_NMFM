f=@(x) 5*sin(5*x)+5*cos(5*x)+5*x;
n=7;
N=2^n;
x=[0:2*pi/N:2*pi*(N-1)/N];

d=55;
t=0:(2*pi/d):2*pi;

[A,b]=nnk_lin_splajn(t,f);
alfa=cg(A,b);

for i=1:length(t)
  sy(i)=vrij_lin_splajna(t(i),t,alfa);
end

fplot(f,[0 2*pi], 'r-', 'LineWidth', 1.2);
hold on
plot(t,sy,'b:', 'LineWidth', 1.5);
title('Aproksimacija po dijelovima linearnom funkcijom pomocu neprekidne MNK');
xlabel('x');ylabel('f(x)');
legend('f(x)=5sin(5x)+5cos(5x)+5x','po dijelovima linearna funkcija');
hold off
print slika3.pdf

