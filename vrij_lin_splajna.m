function [y]=vrij_lin_splajna(x, t, alfa)
%x-tocka u kojoj se racuna vrijednost po dijelovima lin fje 
%t-vektor cvorova duljine n+1
%alfa-vektor koef duljine n+1
%y-vrijendost splajna u tocki x
  
n=length(t)-1;
k=bintrazenje(x, n, t);

if x==t(n+1) 
  y=alfa(n+1);
else
  H1=(t(k+1)-x)/(t(k+1)-t(k));
  H2=(x-t(k))/(t(k+1)-t(k));
  y=alfa(k)*H1+alfa(k+1)*H2;
end

end