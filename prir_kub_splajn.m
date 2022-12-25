function [s]=prir_kub_splajn(x,f)
%x-vektor intepolacijskih cvorova x
%f-vektor intepolacijskih vrijednosti u cvorovima f
%s-vektor parametara, vrijednosti derivacija prirodnog kubicnog spajna u cvorivima

n=length(x)-1;
for i=1:n
   h(i)=x(i+1)-x(i);
end

A=zeros(n+1,n+1); %stavljamo nule  A dim (n+1)x(n+1)
A(1,1:2)=[2 1]; %jer je ovako u prirodnom splajnu
A(n+1,n:n+1)=[1 2];

for i=1:n-1
  A(i+1,i:i+2)=[h(i+1) 2*(h(i)+h(i+1)) h(i)]; %iz def matrice A prirodnog splajna
end

b(1)=3*(f(2)-f(1))/h(1);
b(n+1)=3*(f(n+1)-f(n))/h(n);

for i=2:n
  b(i)=3*(h(i)*(f(i)-f(i-1))/h(i-1)+h(i-1)*(f(i+1)-f(i))/h(i));
end
%As=b
s=A\b';

end