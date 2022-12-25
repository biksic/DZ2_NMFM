f=@(x) 5*sin(5*x)+5*cos(5*x)+5*x;
n=7; 
N=2^n;
x=[0:2*pi/N:2*pi*(N-1)/N];
fut=f(x); 

s=prir_kub_splajn(x,fut);

for i=1:length(x)
  [y(i),~,~]=vrij_kub_splajna(x(i),x,fut,s);
  e(i)=abs(y(i)-fut(i));
end

greska_1=max(e');

fplot(f, [0 2*pi], 'r-', 'LineWidth', 1.2);
hold on
plot(x,y,'b:', 'LineWidth', 1.5);
title('Interpolacija prirodnim kubicnim splajnom');
xlabel('x'); ylabel('f(x)');
legend('f(x)=5sin(5x)+5cos(5x)+5x', 'Interpolacijski splajn');
hold off
print slika1.pdf

save greska1.mat greska_1