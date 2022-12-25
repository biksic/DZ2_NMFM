function [b]=FFT(f,n) %implementira FFT algoritam 
%f-polje duljine N=2^n koje sadrzi interpolacijske vrijednosti f_k
%n-broj
%b-polje duljine N koje sadrzi koef faznog polinoma beta_j
  N=2^n;
  b=zeros(N,1);
  % FFT ALGORITAM:
  for j=0:2^n-1
    b(j+1)=f(rho(j,n)+1);
  end
  
  for m=1:n
    for j=0:(2^(m-1)-1)
      e=exp((-2*pi*j*1i)/(2^m));  %1i je imag jedinica
      for q=0:(2^m):(2^n-1)
        u=b(q+j+1);  v=b(q+j+2^(m-1)+1)*e;
        b(q+j+1)=u+v;
        b(q+j+2^(m-1)+1)=u-v;
      end
    end
  end
  
  for j=1:2^n
    b(j)=b(j)/N;
  end
  
end
