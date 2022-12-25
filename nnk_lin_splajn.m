function [A,b]=nnk_lin_splajn(t,f)
%t-vektor cvorova duljine n+1
%pokazivac na fiju f
  n=length(t)-1;
  A=zeros(n+1,n+1);
%A racunamo kao sto je prikazano na slajdovima 
  A(1,1)=(t(2)-t(1))/3;
  A(1,2)=(t(2)-t(1))/6;
  A(n+1,n)=(t(n+1)-t(n))/6;
  A(n+1,n+1)=(t(n+1)-t(n))/3;
  
  for i=2:n
    A(i,i)=(t(i+1)-t(i-1))/3;
    A(i,i-1)=(t(i+1)-t(i))/6;
    A(i,i+1)=(t(i+1)-t(i))/6;
  end
  
  b=zeros(n+1,1);
  f_1=@(x) f(x).*((t(2)-x)./(t(2)-t(1)));
  f_2=@(x) f(x).*((x-t(n))./(t(n+1)-t(n)));
  
  b(1)=quad(f_1,t(1),t(2)); %racunanje integrala pomocu fije quad koja zahtjeva pokazivac na funkciju
  b(n+1)=quad(f_2,t(n),t(n+1));
  
  for j=2:n
    f_1=@(x) f(x).*((x-t(j-1))./(t(j)-t(j-1))); %anonimni pokazivaci na funkciju ,racunanje za interval [t(j-1),t(j)]
    f_2=@(x) f(x).*((t(j+1)-x)./(t(j+1)-t(j))); %racunanje za interval [t(j),t(j+1)]
    b(j)=quad(f_1,t(j-1),t(j))+quad(f_2,t(j),t(j+1));
  end
end