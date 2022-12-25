% metoda konjugiranih gradijenata
function [x]=cg(A,b)
  tol=1e-8;
  dim=size(A);
  x0=zeros(dim(2),1);
  r=b-A*x0;
  d=r;
  k=0;
  x=x0;
  stari_r=r'*r;
  novi_r=stari_r;
  % iz cg-a raèunamo rezid(1)
  rezid(1)=norm(r)/norm(b);
  
  while rezid(k+1)>tol
    Ad=A*d; % skalarni produkt da ga ne raèunamo više puta
    alfa=(stari_r)/(d'*Ad);
    x=x+alfa*d;
    r=r-alfa*Ad;
    novi_r=r'*r;
    beta=novi_r/stari_r;
    d=r+beta*d;
    % k= k+1 ide prije reziduala!! vektor ide od 1, ne od 0
    k=k+1;
    rezid(k+1)=sqrt(novi_r)/norm(b);
    stari_r=novi_r;
  
  end
end
