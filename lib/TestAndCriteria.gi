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
##                        5. Tests and Criteria
############################################################################################

############################################################################################
############################################################################################
################################### A Main Function ########################################
## This program return a diagram associated to $i*alpha_1+j*alpha_2+k*alpha_3$
## and $p*alpha_1+q*alpha_2+r*alpha_3$
## In this program the following programs and subroutines are called.
## 1.
############################################################################################

####################
# 5.1 Cartan
####################

#to check if a diagram is Cartan.
Cartan:=function(dt)
    local d;

	if Number(dt)=5 then
	    d:=Concatenation(dt,[F1]);
	else
	    d:=dt;
	fi;

	if d[1]^m@(d,1,2)*d[2]=F1
	   and d[1]^m@(d,1,3)*d[6]=F1
	   and d[3]^m@(d,2,1)*d[2]=F1
	   and d[3]^m@(d,2,3)*d[4]=F1
	   and d[5]^m@(d,3,2)*d[4]=F1
	   and d[5]^m@(d,3,1)*d[6]=F1
	   then
	   return 1;
	else
	    return 0;
	fi;
end;

#####
# 5.2 Criterium 1
#####

# * the function "Testk", depending on a diagram d and
# a natural number k applies the function "Hcheck@"
# (which returns either 1 or 0 dependending a given rank
# 2 diagram is on the list or not) for the diagram associated
# to the roots alpha1 and k*alpha2+alpha3

Testk:=function(d,k)
    return Hcheck@(w@(d,k));
end;

# idem as above, for alpha1 y alpha2+k*alpha3
Testv:=function(d,v)
    return Hcheck@(w1@(d,v));
end;

# idem as above, for  a k*alpha1+alpha2 y alpha3
Testh:=function(d,h)
    return Hcheck@(w2@(d,h));
end;

# idem as above, for  alpha1+k*alpha2 y alpha3
Testp:=function(d,p)
    return Hcheck@(w3@(d,p));
end;

# idem as above, for  k*alpha1+alpha3 y alpha2
Testr:=function(d,r)
    return Hcheck@(w4@(d,r));
end;

# idem as above, for alpha1+k*alpha3 y alpha2
Tests:=function(d,s)
    return Hcheck@(w5@(d,s));
end;

##################
# 5.2.1 The Test for Criterium 1
##################

Test1:=function(d)
    local y,t,k,v,n,j,h,p,r,s;
	k:=1;
	v:=1;
	h:=1;
	p:=1;
	r:=1;
	s:=1;

    if Number(d)=5 then
	    y:=Concatenation(d,[F1]);
	else
        y:=d;
	fi;
	
	for j in [1..m@(y,2,3)] do
		if Testk(y,j)=1 then
		    k:=k+1;
		fi;
	od;

	if k=m@(y,2,3)+1 then
		for j in [1..m@(y,3,2)] do
			if Testv(y,j)=1 then
				v:=v+1;
			fi;
		od;
		if v=m@(y,3,2)+1 then
			for j in [1..m@(y,1,2)] do
			    if Testh(y,j)=1 then
			        h := h + 1;
			    fi;
			od;
			if h = m@(y,1,2) + 1 then
				for j in [1..m@(y,2,1)] do
				    if Testp(y,j) = 1 then
				        p := p+1;
				    fi;
				od;
			    if p=m@(y,2,1)+1 then
		            for j in [1..m@(y,1,3)] do
			            if Testr(y,j)=1 then
			                r:=r+1;
			            fi;
			        od;
			        if r=m@(y,1,3)+1 then
				        for j in [1..m@(y,3,1)] do
				            if Tests(y,j)=1 then
				                s := s+1;
				            fi;
				        od;
			            if s=m@(y,3,1)+1 then		
		                    return 1;
			            else
			                return 0;
			            fi;
			        else
					    return 0;
					fi;
				else
				    return 0;
				fi;
			else
			    return 0;
			fi;
		else
		    return 0;
		fi;
    else
        return 0;
	fi;
end;

#####
# 5.3 Criterium 2
#####

TestCriterium2 := function(d)
    local k, j, n;
	if ValueOption("12d") = true then
        n := m@(d, 1, 2);
    fi;
	if ValueOption("21d") = true then
        n := m@(d, 2, 1);
    fi;
	if ValueOption("23d") = true then
        n := m@(d, 2, 3);
    fi;
	if ValueOption("32d") = true then
        n := m@(d, 3, 2);
    fi;
	if ValueOption("31d") = true then
        n := m@(d, 3, 1);
    fi;
	if ValueOption("13d") = true then
        n := m@(d,  1, 3);
    fi;
	
	if n < 2 then
	    return 1;
	else
	    k:=2;
		for j in [2..n] do
		    if ValueOption("12d") = true then
			    if Hcheck@( w412@(d, k) ) = 1 then
			        k := k + 1;
				fi;
			fi;
			if ValueOption("21d") = true then
			    if Hcheck@( w421@(d, k) ) = 1 then
			        k := k + 1;
				fi;
			fi;
			if ValueOption("23d") = true then
			    if Hcheck@( w423@(d, k) ) = 1 then
			        k := k + 1;
				fi;
			fi;
			if ValueOption("32d") = true then
			    if Hcheck@( w432@(d, k) ) = 1 then
			        k := k + 1;
				fi;
			fi;
			if ValueOption("13d") = true then
			    if Hcheck@( w413@(d, k) ) = 1 then
			        k := k + 1;
				fi;
			fi;
			if ValueOption("31d") = true then
			    if Hcheck@( w431@(d, k) ) = 1 then
			        k := k + 1;
				fi;
			fi;
		od;
		if k = n + 1 then
		    return 1;
		else
		    return 0;
		fi;
	fi;
end;

##################
# 5.3.1 The Test for Criterium 2
##################

Test2:=function(d)
    local dt;
	if Number(d)=5 then
	    dt:=Concatenation(d,[F1]);
	else
	    dt:=d;
	fi;
	if TestCriterium2( dt : 12d) = 0 then
	    return 0;
	elif TestCriterium2( dt : 21d)=0 then
	    return 0;
	elif TestCriterium2( dt : 23d)=0 then
	    return 0;
	elif TestCriterium2( dt : 32d) = 0 then
	    return 0;
	elif TestCriterium2( dt : 13d) = 0 then
	    return 0;
	elif TestCriterium2( dt : 31d) = 0 then
	    return 0;
	else
	    return 1;
	fi;
end;

##################
# 5.4 Criterium 3
##################

TestCriterium3:=function(d)
    if ValueOption("1223d") = true then
        if m@( d, 1, 2 )*m@( d, 2, 3 ) <> 0 then
	        return Hcheck@( w1223@(d) );
		fi;
	elif ValueOption("1213d") = true then
	    if m@( d, 1, 2 )*m@( d, 1, 3 ) <> 0 then
	        return Hcheck@( w1213@(d) );
		fi;
	elif ValueOption("1323d") = true then
	    if m@( d, 1, 3 )*m@( d, 2, 3 ) <> 0 then
	        return Hcheck@( w1323@(d) );
		fi;
	else
	    return 1;
	fi;
end;

##################
# 5.4.1 The Test for Criterium 3
##################

Test3:=function(d)
    if TestCriterium3( d : 1223d ) = 0 then
	    return 0;
	elif TestCriterium3( d : 1213d ) = 0 then
	    return 0;
	elif TestCriterium3( d : 1323d ) = 0 then
	    return 0;
	else
	    return 1;
	fi;
end;

#########################
# 5.5 All Tests together
#########################

#Tests for Criteria 1 to 3:

Test123:=function(d)
    if Test1(d)=0 then
        return 0;
    elif Test2(d)=0 then 
        return 0;
	elif Test3(d)=0 then 
        return 0;
    else
	    return 1;
	fi;
end;

###########################
# 5.5.1 The complete Test: Cartan, 1 to 3, and reflections.
###########################

Testall@:=function(d)
    # Test 1 to 3:
	if Test123(d)=0 then
	    return 0;
	#Cartan:
	elif Cartan(d)=1 then
	    return 0;
	#Test 1 to 3 for reflections:
	elif Test123(s(1,d))=0 then
	    return 0;
	elif Test123(s(2,d))=0 then 
	    return 0;
	elif Test123(s(3,d))=0 then
	    return 0;
	elif Test123(s(1,s(2,d)))=0 then
	    return 0;
	elif Test123(s(1,s(3,d)))=0 then
	    return 0;
	elif Test123(s(2,s(1,d)))=0 then
	    return 0;
	elif Test123(s(2,s(3,d)))=0 then
	    return 0;
	elif Test123(s(3,s(2,d)))=0 then
	    return 0;
	elif Test123(s(3,s(1,d)))=0 then
	    return 0;
	elif Test123(s(2,s(1,s(2,d))))=0 then
	    return 0;
	elif Test123(s(3,s(1,s(2,d))))=0 then
	    return 0;
	elif Test123(s(2,s(1,s(3,d))))=0 then
	    return 0;
	elif Test123(s(3,s(1,s(3,d))))=0 then
	    return 0;
	elif Test123(s(1,s(2,s(1,d))))=0 then
	    return 0;
	elif Test123(s(3,s(2,s(1,d))))=0 then
	    return 0;
	elif Test123(s(1,s(2,s(3,d))))=0 then
	    return 0;
	elif Test123(s(3,s(2,s(3,d))))=0 then
	    return 0;
	elif Test123(s(1,s(3,s(2,d))))=0 then
	    return 0;
	elif Test123(s(2,s(3,s(2,d))))=0 then
	    return 0;
	elif Test123(s(1,s(3,s(1,d))))=0 then
	    return 0;
	elif Test123(s(2,s(3,s(1,d))))=0 then
	    return 0;
	else
	    return 1;
	fi;
end;