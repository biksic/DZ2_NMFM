function [x]=rho(x,n) %obrce znamenke bin broja x
%x broj 
%n-broj binarnih znamenki u zapisu
  s=dec2bin(x,n); %prebacivanje prirodnog broja u string sa bin zapisom
  s=fliplr(s); %obrtanje znakova u stringu
  x=bin2dec(s); %prebacivanje stringa sa bin zapisom u prirodni broj

end