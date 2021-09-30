############################################################################################
############################################################################################
##                                                                                         #
##                                        GKDimNA                                          #
##                                                                                         #
##                                     A GAP4 Packege                                      #
##                ON FINITE GK-DIMENSIONAL NICHOLS ALGEBRAS OF DIAGONAL TYPE:              #
##                                   RANK 3 AND CARTAN TYPE                                #
##                                                                                         #
##                Developed by: Author1                                                    #
##                              Department Name,                                           #
##                              University Name,                                           #
##                              City, State, .                                             #
##                              E-mail: Email Adress                                       #
##                              Home Page: homepage's URL                                  #
##                                                                                         #
############################################################################################

############################################################################################
##                        4. Diagrams associated to hyperplanes
############################################################################################

############################################################################################
############################################################################################
################################### A Main Function ########################################
## This program return a diagram associated to $i*alpha_1+j*alpha_2+k*alpha_3$
## and $p*alpha_1+q*alpha_2+r*alpha_3$
## In this program the following programs and subroutines are called.
## 1.
############################################################################################

InstallGlobalFunction( dab, function(dt, i, j, k, p, q, r)
    local d, l1, l2, l3;
    if Number( dt ) = 5 then
	    d := Concatenation(dt,[F1]);
    else
        d:=dt;
    fi;
	# Refactory this return
    l1:=d[1]^(i^2)*d[3]^(j^2)*d[5]^(k^2)*d[2]^(i*j)*d[6]^(i*k)*d[4]^(j*k);
    l2:=d[1]^(2*i*p)*d[3]^(2*j*q)*d[5]^(2*k*r)*d[2]^(i*q+j*p)*d[6]^(i*r+k*p)*d[4]^(j*r+k*q);
    l3:=d[1]^(p^2)*d[3]^(q^2)*d[5]^(r^2)*d[2]^(p*q)*d[6]^(p*r)*d[4]^(q*r);
    return [l1,l2,l3];
end );

##########
# 4.1 Diagrams for Criterium 1
##########

# diagram associated to  alpha1 and  k*alpha2+alpha3
w@ := function(d, k)
    return dab(d, 1, 0, 0, 0, k, 1);
end;

# diagram associated to alpha1 and  alpha2+k*alpha3
w1@ := function(d, v)
    return dab(d, 1, 0, 0, 0, 1, v);
end;

# diagram associated to k*alpha1+alpha2 and alpha3
w2@ := function(d, h)
    return dab(d, h, 1, 0, 0, 0, 1);
end;

# diagram associated to alpha1+k*alpha2 and alpha3
w3@ := function(d, p)
    return dab(d, 1, p, 0, 0, 0, 1);
end;

# diagram associated to alpha2 and  k*alpha1+alpha3
w4@ := function(d, r)
    return dab(d, 0, 1, 0, r, 0, 1);
end;

# diagram associated to alpha2 and  alpha1+k*alpha3
w5@ := function(d, s)
    return dab(d, 0, 1, 0, 1, 0, s);
end;

##########
# 4.2 Diagrams for Criterium 2
##########

# diagram associated to alpha1+alpha2+alpha3 and  k*alpha1+alpha2 
w412@ := function(d,k)
    return dab(d,1,1,1,k,1,0);
end;

# diagram associates to alpha1+alpha2+alpha3 and  k*alpha2+alpha1 
w421@ := function(d,k)
    return dab(d,1,1,1,1,k,0);
end;

# diagram associated to alpha1+alpha2+alpha3 and  k*alpha2+alpha3 
w423@ := function(d,k)
    return dab(d,1,1,1,0,k,1);
end;

# diagram associated to alpha1+alpha2+alpha3 and  k*alpha3+alpha2 
w432@ := function(d,k)
    return dab(d,1,1,1,0,1,k);
end;

# diagram associated to alpha1+alpha2+alpha3 and  k*alpha1+alpha3 
w413@ := function(d,k)
    return dab(d,1,1,1,k,0,1);
end;

# diagram associated to alpha1+alpha2+alpha3 and  k*alpha3+alpha1 
w431@ := function(d,k)
    return dab(d,1,1,1,1,0,k);
end;

##########
# 4.3 Diagrams for Criterium 3
##########

# diagram associated to alpha1+alpha2 and alpha2+alpha3
w1223@ := function(d)
    return dab(d,1,1,0,0,1,1);
end;

# diagram associated to alpha1+alpha2 and alpha1+alpha3
w1213@ := function(d)
    return dab(d,1,1,0,1,0,1);
end;

# diagram associated to alpha1+alpha3 and alpha2+alpha3
w1323@ := function(d)
    return dab(d,1,0,1,0,1,1);
end;
