function [k]=bintrazenje(t,n,x)   
%algoritam s prezentacije
donji=1;
gornji=n+1;
while(gornji-donji)>1
      srednji=fix((donji+gornji)/2);
      if(t<x(srednji))
         gornji=srednji;
      else
         donji=srednji;
      end
end
k=donji;
end
          