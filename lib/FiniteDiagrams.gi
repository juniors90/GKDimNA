# We denote by "R@(n)" the set of roots in K of order n

R@ := function(n)
    local l, k;
	l := [ ];
	for k in [1..n] do
	    if Order( F(n)^k ) = n then
		    Add( l, F(n)^k );
		fi;
	od;
	return l;
end; 

# We collect in " C@(n)" the set of roots of order leeser or equal than n

C@ := function(n)
    local l, k;
	    l:=[];
	for k in [1..n] do
	    if F(n)^k <> F1 then
		    Add(l, F(n)^k );
	    fi;
	od;
    return l;
end;

# The set of roots we need to check.

InstallGlobalFunction( SetConcat, function(h, i, j, k, l) 
    local m;
	m := Set(Concatenation( C@(h), C@(i), C@(j), C@(k), C@(l)));;
	return m;
end );

# We let "Rp" be the set of roots in F of order at most 100.

InstallGlobalFunction( RootsinF, function(n)
    local Rp, idx;
	Rp:=[ ];;
	for idx in [1..n] do
	    Append( Rp, R@(idx) );
	od;
	return Rp;
end );

Rp := RootsinF(100);

#################################
# 2. The list
#################################

##############################
# the function "check" returns the name of a given diagram in the list of "finite" diagrams of rank two in [H].
# the nth diagram of the kth row is named dk.n. 
# It returns 0 if the input diagram is not in the list.
# It admits mirrored diagrams.

Check@ := function(d)
    if d[2] = F(1) then
	    return "d1";
	elif d[1] = d[3]
	     and d[1]*d[2] = F(1)
		 and d[2] <> F(1) then
	    return "d2";
	elif (d[1]*d[2] = F(1) and d[3] = -F(1) and d[2] <> F(1) and d[2] <> F(2))
	     or
	     (d[2]*d[3] = F(1) and d[1] = -F(1) and d[2] <> F(1) and d[2] <> F(2)) then
		return "d3.1";
	elif (d[1] = d[3]
	      and d[3] = -F(1)
		  and d[2] <> F(1)
		  and d[2] <> F(2)) then
	    return "d3.2";
	elif (d[1]^2*d[2] = F(1)
	     and d[2]*d[3] = F(1)
		 and d[1] <> F(1)
		 and d[1] <> F(2)) or
	     (d[1]*d[2] = F(1)
		 and d[2]*d[3]^2=F(1)
		 and d[3] <> F(1)
		 and d[3] <> F(2)) then
	    return "d4";
	elif (d[1]^2*d[2] = F(1)
	     and d[3] = -F(1)
		 and d[1] <> F(1)
		 and d[1] <> F(2)
		 and d[1] <> F(4)
		 and d[1] <> -F(4)) or
	     (d[3]^2*d[2] = F(1)
		 and d[1] = -F(1)
		 and d[3] <> F(1)
		 and d[3] <> F(2)
		 and d[3] <> F(4)
		 and d[3] <> -F(4)) then
        return "d5";
	elif (d[1] in R@(3)
	     and d[2]*d[3] = F(1)
		 and d[3] <> F(1)
		 and d[3] <> F(3)
		 and d[3] <> F(3)^2) or
         (d[3] in R@(3)
		 and d[2]*d[1] = F(1)
		 and d[1] <> F(1)
		 and d[1] <> F(3)
		 and d[1] <> F(3)^2) then
		return "d6";
	elif (d[1] in R@(3)
	     and d[1] = -d[2]
		 and d[3] = -F(1)) or
	     (d[3] in R@(3)
		 and d[3] = -d[2]
		 and d[1] = -F(1)) then
		return "d7";
	elif (d[1]*d[3] = F(1)
	     and d[1] in R@(3)
		 and d[1]*d[2] in R@(12)) then
	    return "d8.1";
	    Print(d[1]*d[2]);
    elif (d[2] in R@(12)
	     and d[1] = -d[2]^2
		 and d[3] = -F(1)) or
	     (d[2] in R@(12)
		 and d[3] = -d[2]^2
		 and d[1] = -F(1)) then
		return "d8.2";
		Print(d[2]^-1);
	elif (-d[2] in R@(12)
	     and d[1] = -d[2]^2
		 and d[3] = -F(1)) or
	     (-d[2] in R@(12)
		 and d[3] = -d[2]^2
		 and d[1] = -F(1)) then
		return "d8.3";
		Print(-d[2]);
	elif (d[2] in R@(12)
	     and d[1] = -d[2]^3
		 and d[3] = -F(1)) or
	     (d[2] in R@(12)
		 and d[3] = -d[2]^3
		 and d[1] = -F(1)) then
		return "d8.4";
		Print(d[2]);
	elif (-d[2] in R@(12)
	     and d[1] = d[2]^-3
		 and d[3] = -F(1)) or
	     (d[2] in R@(12)
		 and d[3] = d[2]^-3
		 and d[1] = -F(1)) then
		return "d8.5";
		Print(-d[2]^-1);
	elif (d[2] in R@(12)
	     and d[1] = -d[2]^2
		 and d[3] = d[1]) then
	    return "d9.1";
		Print(d[2]);
	elif (-d[2]*d[1]^-1 in R@(12)
	     and d[2] = -d[2]^3*d[1]^-3
		 and d[3] = -F(1)) or
	     (-d[2]*d[3]^-1 in R@(12)
		 and d[2] = -d[2]^3*d[3]^-3
		 and d[1] = -F(1)) then
	    return "d9.2"; 
	    Print(-d[2]*d[1]^-1);
	elif (d[1] in R@(12)
	     and d[2] = d[1]^-3
		 and d[3] = -F(1)) or
	     (d[3] in R@(12)
		 and d[2] = d[3]^-3
		 and d[1] = -F(1)) then
		return "d9.3";
		Print(-d[1]^-1);
	elif (d[1] in R@(18)
	      and d[2] = d[1]^-2
		  and d[3] = -d[1]^3) or
	     (d[3] in R@(18)
		 and d[2] = d[3]^-2
		 and d[1] = -d[3]^3) then
		return "d10.1";
	elif (d[2] in R@(9)
	     and d[1] = d[2]^-3
		 and d[3] = -F(1)) or
	     (d[2] in R@(9)
		 and d[3] = d[2]^-3
		 and d[1] = -F(1)) then 
		return "d10.2";
	elif (d[2] in R@(9)
	     and d[1] = -d[2]^2
		 and d[3] = -F(1)) or
	     (d[2] in R@(9)
		 and d[3] = -d[2]^2
		 and d[1] = -F(1)) then
		return "d10.3";
	elif (d[1]^3*d[2] = F(1)
	     and d[3]*d[2] = F(1)
		 and d[1] <> F(1)
		 and d[1] <> F(2)
		 and d[1] <> F(3)
		 and d[1] <> F(3)^2) or
	     (d[3]^3*d[2] = F(1)
		 and d[1]*d[2] = F(1)
		 and d[3] <> F(1)
		 and d[3] <> F(2)
		 and d[3] <> F(3)
		 and d[3] <> F(3)^2) then
		return "d11";
	elif (d[2] in R@(8)
	     and d[1] = d[2]^2
		 and d[3] = d[2]^-1) or
	     (d[2] in R@(8)
		 and d[3] = d[2]^2
		 and d[1] = d[2]^-1) then
		return "d12.1";
		Print(d[2]);
	elif (d[2] in R@(8)
	     and d[1] = d[2]^-2
		 and d[3] = -F(1)) or
	     (d[2] in R@(8)
		 and d[3] = d[2]^-2
		 and d[1] = -F(1)) then
		return "d12.2";
	elif (d[1] in R@(8)
	     and d[2] = -d[1]
		 and d[3] = -F(1)) or
	     (d[3] in R@(8)
		 and d[2] = -d[3]
		 and d[1] = -F(1)) then
	    return "d12.3";
	    Print(-d[2]);
	elif (d[2] in R@(24)
	     and d[1] = d[2]^-6
		 and d[3] = -d[2]^4) or
	     (d[2] in R@(24)
		 and d[3] = d[2]^-6
		 and d[1] = -d[2]^4) then
		return "d13.1";
	elif (d[2] in R@(24)
	     and d[1] = d[2]^6
		 and d[3] = d[2]^-1) or
	     (d[2] in R@(24)
		 and d[3] = d[2]^6
		 and d[1] = d[2]^-1) then
		return "d13.2";
		Print(d[2]); # por qué más abajo es un string? 
	elif (d[2] in R@(24)
	     and d[1] = -d[2]^4
		 and d[3] = -F(1)) or
	     (d[2] in R@(24)
		 and d[3] = -d[2]^4
		 and d[1] = -F(1)) then
		return "d13.3";
	    Print(d[2]^5); # por qué más abajo es un string del tipo "d[2]^5"? 
	elif (d[1] in R@(24)
	     and d[2] = d[1]^-5
		 and d[3] = -F(1)) or
	     (d[3] in R@(24)
		 and d[2] = d[3]^-5
		 and d[1] = -F(1)) then
		return "d13.4";
	elif (d[1] in R@(5)
	     and d[2] = d[1]^2
		 and d[3] = -F(1)) or
		 (d[3] in R@(5)
		 and d[2] = d[3]^2
		 and d[1] = -F(1)) then
	    return "d14.1";
	elif (-d[1] in R@(5)
	     and d[2] = -d[1]
		 and d[3] = -F(1)) or
	     (-d[3] in R@(5)
		 and d[2] = -d[3]
		 and d[1] = -F(1)) then
		return "d14.2"; Print(d[2]^-3);
	elif (d[1] in R@(20)
	     and d[2] = d[1]^-3
		 and d[3] = -F(1)) or
	     (d[3] in R@(20)
		 and d[2] = d[3]^-3
		 and d[1] = -F(1)) then
		return "d15.1";
	elif (d[2] in R@(20)
	     and d[1] = -d[2]^6
		 and d[3] = -F(1)) or
	     (d[2] in R@(20)
		 and d[3] = -d[2]^6
		 and d[1] = -F(1)) then
		return "d15.3";
		Print("-d[2]^7"); # por qué acá inprime una cadena y más arriba no
	elif (d[1] in R@(30)
	     and d[2] = d[1]^-3
		 and d[3] = d[1]^20) or
	     (d[3] in R@(30)
		 and d[2] = d[3]^-3
		 and d[1] = d[3]^20) then
		return "d16.1";
	elif (d[2] in R@(30)
	     and d[1] = d[2]^12
		 and d[3] = d[2]^-1) or
	     (d[2] in R@(30)
		 and d[3] = d[2]^12
		 and d[1] = d[2]^-1) then
		return "d16.2";
	elif (d[2] in R@(30)
	     and d[1] = -d[2]^5
		 and d[3] = -F(1)) or
	     (d[2] in R@(30)
		 and d[3] = -d[2]^5
		 and d[1] = -F(1)) then
	    return "d16.3";
	elif (d[2] in R@(30)
	     and d[1] = d[2]^-6
		 and d[3] = -F(1)) or
	     (d[2] in R@(30)
		 and d[3] = d[2]^-6
		 and d[1] = -F(1)) then
	    return "d16.4";
	elif (-d[1] in R@(7)
	     and d[2] = d[1]^-3
		 and d[3] = -F(1)) or
	     (-d[3] in R@(7)
		 and d[2] = d[3]^-3
		 and d[1] = -F(1)) then
		return "d17.1";
	elif (d[2]*d[1] in R@(7)
	     and d[2] = -d[2]^3*d[1]^3
		 and d[3] = -F(1)) or
	     (d[2]*d[3] in R@(7)
		 and d[2] = -d[2]^3*d[3]^3
		 and d[1] = -F(1)) then
		return "d17.2";
	else
	    return 0;
	fi;
end;

#The function "Hcheck" returns 1 if the input diagram
# (of rank 2) is on the list; returns 0 otherwise. 

Hcheck@ := function(d)
    if Check@(d) <> 0 then
	    return 1;
	else
	    return 0;
	fi;
end;


#####################################################################################

#the function "checkrb" returns the name of a given diagram in the list of "finite" diagrams of rank two in [H].
#the nth diagram of the kth row is named dk.n. 
#It returns 0 if the input diagram is not in the list.
#It does not admit mirrored diagrams, added further on.

Checkr3b@ := function(d)
    if d[1] = d[3] and d[3] = d[5] and d[1]*d[2] = F(1) and d[1]*d[4] = F(1) and d[1] <> F(1) then
	   return "d1";
	elif d[1] = d[5]^2 and d[3] = d[5]^2 and d[1]*d[2] = F(1) and d[3]*d[4] = F(1) and d[5] <> F(1) and d[5] <> -F(1) then
		return "d2";
	elif d[1] = d[3]
	     and d[5] = d[3]^2
		 and d[1]*d[2] = F(1)
		 and d[5]*d[4] = F(1)
		 and d[1] <> F(1)
		 and d[1] <> -F(1) then
		return "d3";
	elif d[1] = -F(1)
	     and d[3] = d[5]
		 and d[3]*d[2] = F(1)
		 and d[3]*d[4] = F(1)
		 and d[5] <> F(1)
		 and d[5] <> -F(1) then
		return "d4a";
	elif d[1] = -F(1)
	     and d[3] = -F(1)
		 and d[4]*d[2] = F(1)
		 and d[5]*d[4] = F(1)
		 and d[5] <> F(1)
		 and d[5] <> -F(1) then
		return "d4b";
	elif d[1] = -F(1)
	     and d[3] = d[5]^2
		 and d[3]*d[2] = F(1)
		 and d[3]*d[4] = F(1)
		 and d[5] <> F(1)
		 and d[5] <> -F(1)
		 and d[5] <> F(4)
		 and d[5] <> -F(4) then
		return "d5a";
	elif d[1] = -F(1)
	     and d[3] = -F(1)
		 and d[4]*d[2] = F(1)
		 and d[2] = d[5]^2
		 and d[5] <> F(1)
		 and d[5] <> -F(1)
		 and d[5] <> F(4)
		 and d[5] <> -F(4) then
		return "d5b";
	elif d[1] = d[5]^-2
	     and d[1]*d[2] = F(1)
		 and d[4]*d[2] = F(1)
		 and d[5] <> F(1)
		 and d[5] <> -F(1)
		 and d[5] <> F(4)
		 and d[5] <> -F(4) then
		return "d5c";
	elif d[1] = -F(1)
	     and d[2]*d[3] = F(1)
		 and d[5] = d[3]^2
		 and d[4]*d[5] = F(1)
		 and d[3] <> F(1)
		 and d[3] <> -F(1) then
		return "d6a";
	elif d[1] = -F(1)
		 and d[3] = -F(1)
		 and d[5] = d[2]^2
		 and d[4]*d[5] = F(1)
		 and d[2] <> F(1)
		 and d[2] <> -F(1) then
		return "d6b";
	elif d[1] = -F(1)
	     and d[3]*d[2] = F(1)
		 and d[5] = d[3]^3
		 and d[4]*d[5] = F(1)
		 and d[3] <> F(1)
		 and d[3] <> -F(1)
		 and d[3] <> F(3)
		 and d[3] <> F(3)^2 then
		return "d7a";
	elif d[1] = -F(1)
	     and d[3] = -F(1)
		 and d[5] = d[2]^3
		 and d[4]*d[5] = F(1)
		 and d[2] <> F(1)
		 and d[2] <> -F(1)
		 and d[2] <> F(3)
		 and d[2] <> F(3)^2 then
		return "d7b";
	elif d[1] = -d[5]^-3
	     and d[1]*d[2] = F(1)
		 and d[3] = -F(1)
		 and d[4] = d[5]^-2
		 and d[5] <> F(1)
		 and d[5] <> -F(1)
		 and d[5] <> -F(3)
		 and d[5] <> -F(3)^2 then
		return "d7c";
	elif d[1]*d[2] = F(1)
	     and d[5]*d[4] = F(1)
		 and d[5]*d[1] = F(1)
		 and d[3] = -F(1)
		 and d[1] <> F(1)
		 and d[1] <> -F(1) then
		return "d8a";
	elif d[4]*d[2] = F(1)
	     and d[1] = -F(1)
		 and d[3] = -F(1)
		 and d[5] = -F(1)
		 and d[2] <> F(1)
		 and d[2] <> -F(1) then
		return "d8b";
	elif d[3]*d[2] = F(1)
	     and d[3]*d[4] = F(1)
		 and d[1] = -F(1)
		 and d[5] = -F(1)
		 and d[3] <> F(1)
		 and d[3] <> -F(1) then
		return "d8c/d";
	elif d[1]*d[2] = F(1)
	     and d[5]*d[4] = F(1)
		 and d[3] = -F(1)
		 and d[1]*d[5] <> F(1)
		 and d[1] <> F(1)
		 and d[5] <> F(1) then
		return "d9";
	elif d[1]*d[2] = F(1)
	     and d[3] = -F(1)
		 and d[5] = d[1]
		 and d[4] = d[2]
		 and d[1] <> F(1)
		 and d[1] <> -F(1)
		 and d[1] <> F(3)
		 and d[1] <> F(3)^2 then
		return "d10a";
	elif d[1]*d[2] = F(1)
	     and d[3] = -F(1)
		 and d[5] = d[1]^-2
		 and d[4] = d[1]^2
		 and d[1] <> F(1)
		 and d[1] <> -F(1)
		 and d[1] <> F(3)
		 and d[1] <> F(3)^2 then
		return "d10b";
	elif d[1] in R@(3)
	     and d[2] = d[1]^-1
		 and d[3] = -F1
		 and d[4] = d[2]
		 and d[5] = d[1] then
		return "d11";
	elif d[1] in R@(3)
	     and d[2] = -d[1]
		 and d[3] = -d[1]^-1
		 and d[4] = -d[1]
		 and d[5] = d[3] then
		return "d12";
	elif d[1] in R@(3)
	     and d[5] = -F1
		 and d[4] = d[1]^-2
		 and d[2] = d[1]^-1
		 and d[3] = d[1] then
		return "d13.1.3";
	elif d[1] in R@(6)
	     and d[5] = -F1
		 and d[4] = d[1]^-2
		 and d[2] = d[1]^-1
		 and d[3] = d[1] then
		return "d13.1.6";
	elif d[1] in R@(3)
	     and d[5] = -F1
		 and d[4] = d[1]^2
		 and d[2] = d[1]^-1
		 and d[3] = -d[1]^-1 then
		return "d13.2.3";
	elif d[1] in R@(6)
	     and d[5] = -F1
		 and d[4] = d[1]^2
		 and d[2] = d[1]^-1
		 and d[3] = -d[1]^-1 then
		return "d13.2.6";
	elif d[1] = -F1
	     and d[5] in R@(3)
		 and d[4] = -d[5]
		 and d[2] = d[4]
		 and d[3] = -d[5]^-1 then
		return "d14.1";
	elif d[1] = -F1
	     and d[5] in R@(3)
		 and d[4] = -d[5]
		 and d[2] = d[4]^-1
		 and d[3] = -F1 then
		return "d14.2";
	elif d[5] in R@(3)
	     and d[4] = -d[5]
		 and d[2] = d[4]^-1
		 and d[1] = -d[5]
		 and d[3] = -F1 then
		return "d14.3";
	elif d[1] = -F1
	     and d[3] in R@(3)
		 and d[2] = d[3]^-1
		 and d[4] = d[3]
		 and d[5] = -F1 then
	    return "d15.1";
	elif d[1] = -F1
	     and d[2] in R@(3)
		 and d[3] = d[1]
		 and d[4] = d[2]
		 and d[5] = -F1 then
		return "d15.2";
	elif d[1] = -F1
	     and d[2] in R@(3)
		 and d[3] = -d[2]
		 and d[4] = d[2]
		 and d[5] = -F1 then
		return "d15.3";
	elif d[1] = -F1
	     and d[3] in R@(3)
		 and d[4] = -d[3]^-1
		 and d[2] = d[3]^-1
		 and d[5] = -d[3] then
		return "d16.1";
	elif d[1] = -F1
	     and d[2] in R@(3)
		 and d[3] = -F1
		 and d[4] = -d[2]^-1
		 and d[5] = -d[2] then
		return "d16.2";
	elif d[1] in R@(3)
	     and d[3] = -F1
		 and d[4] = -d[1]^-1
		 and d[2] = -F1
		 and d[5] = -d[1] then
		return "d16.3";
	elif d[1] in R@(3)
	     and d[3] = -d[1]
		 and d[4] = -d[1]^-1
		 and d[2] = -d[1]^-1
		 and d[5] = -d[1] then
		return "d16.4";
	elif d[4] in R@(3)
	     and d[1] = -F1
		 and d[2] = d[1]
		 and d[3] = d[1]
		 and d[5] = d[1] then
		return "d17.1";
	elif d[3] in R@(3)
	     and d[1] = -F1
		 and d[2] = d[1]
		 and d[5] = d[1]
		 and d[4] = d[3]^-1 then
		return "d17.2";
	elif d[2] in R@(3)
	     and d[1] = -F1
		 and d[3] = d[1]
		 and d[5] = d[1]
		 and d[4] = -d[2] then
		return "d17.3";
	elif d[4] in R@(3)
	     and d[1] = -F1
		 and d[3] = d[1]
		 and d[5] = d[1]
		 and d[4] = -d[2] then
		return "d17.3";
	elif d[2] in R@(3)
	     and d[3] = d[2]
		 and d[4] = -d[3]
		 and d[1] = -F1
		 and d[5] = -F1 then
		return "d17.4";
	elif d[2] in R@(3)
	     and d[3] = d[2]^-1
		 and d[4] = -d[3]
		 and d[1] = -F1
		 and d[5] = -F1 then
		return "d17.5";
	elif d[5] in R@(3)
	     and d[4] = -d[5]
		 and d[3] = -F1
		 and d[1] = -F1
		 and d[2] = -F1 then
		return "d17.6";
	elif d[2] in R@(3)
	     and d[3] = -d[2]
		 and d[4] = -d[2]^-1
		 and d[1] = -F1
		 and d[5] = -F1 then
		return "d17.7";
	elif d[1] in R@(9)
	     and d[2] = d[1]^-1
		 and d[3] = d[1]
		 and d[4] = d[2]
		 and d[5] = d[1]^-3 then
		return "d18.1";
	elif d[1] in R@(9)
	     and d[2] = d[1]^-1
		 and d[3] = d[1]^-4
		 and d[4] = d[1]^4
		 and d[5] = d[1]^-3 then
		return "d18.2";
	else
	    return 0;
	fi;
end;

#the function "checkr3p" flips a diagram of rank 3.

Checkr3p:=d->Checkr3b@(Permuted(d,(1,5)(2,4)));

#"checkr3" is analogous to "Checkr3b", it admits mirrored diagrams.

Checkr3@ := function(d)
    local r3b, r3p;
	r3b := Checkr3@(d);
    if r3b <> 0 then
	    return r3b;
	else
	    r3p := Checkr3p(d);
	    return r3p;
	fi;
end;

#The function "Hckeckr3" returns 1 if the input diagram
# (of rank 3, not a triangle) is on the list; returns 0 otherwise. 

Hcheckr3@ := function(d)
    if Checkr3@(d) <> 0 then
	    return 1;
	else
	    return 0;
	fi;
end;