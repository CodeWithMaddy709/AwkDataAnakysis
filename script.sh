#!/bin/bash
awk '
{if ($1=="MODEL") 

 {
  imod = $2;
  ia = 0;
  sum = 0;
  itot = 838;
  dmax=0;
 }
}

{if ($1=="ATOM") 
 {
  ia++; 
x[ia]=$7;
y[ia]=$8;
z[ia]=$9;
#  x[ia] = strtonum(substr($0,31,8)); 
#  y[ia] = strtonum(substr($0,39,8));  
#  z[ia] = strtonum(substr($0,47,8));
 }
}

{if ($1=="ENDMDL") 
 for (i1 = 1; i1 <= itot; i1++)
  {
   for (i2 = 1; i2 <= itot; i2++)
    {
     d2 = (x[i1]-x[i2])*(x[i1]-x[i2]) + (y[i1]-y[i2])*(y[i1]-y[i2]) + (z[i1]-z[i2])*(z[i1]-z[i2]); 
     

     d1 = sqrt(d2);
     if ( d1 > dmax )
       dmax = d1
     fi
    
     
    }
   
  }
 
}
{
  if ($1=="ENDMDL") 
    print imod, dmax;
    }
    {
     if ($1=="ENDMDL") 
    print  sqrt(((x[1]-x[45])*(x[1]-x[45])+ (y[1]-y[45])*(y[1]-y[45]) + (z[1]-z[45])*(z[1]-z[45])));
}' file.pdb



