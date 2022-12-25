function [y]=hornerova_shema(x,b)
%algoritam s predavanja
%izvrednjavanje faznog polinoma
  e=exp(1i*x); %x je jedna tocka!
  N=length(b);
  y=b(N);
  for j=(N-1):-1:1
    y=y*e+b(j);
  end
end
