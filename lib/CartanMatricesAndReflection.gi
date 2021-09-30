############################################################################################
############################################################################################
############################################################################################
##                                                                                         #
##                                         GKDimNA                                         #
##                                                                                         #
##                                     A GAP4 Packege                                      #
##                   ON FINITE GK-DIMENSIONAL NICHOLS ALGEBRAS OF DIAGONAL TYPE:           #
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
##                        3. Cartan matrices and reflections
############################################################################################

############################################################################################
############################################################################################
################################### A Main Function ########################################
## This program compute the entry $m(i,j)$ of the $GCM$ of a diagram $d$.
## In this program the following programs and subroutines are called.
## 1. Rp:=RootsinF(100);
############################################################################################

m@ := function( d, i, j )
    local l, n, dt;
    
    l := [ ];
    
    if Number( d ) = 5 then
        dt := Concatenation( d, [ F1 ] );
    else
        dt := d;
    fi;

    if i = j then
        return -2;
    
    elif j = i + 1 or i = j + 1 then
        for n in [0..10] do
            if
                dt[2*i-1]^n*dt[i+j-1] = F(1)
            then
                Add(l,n);
            fi;
        od;

        if dt[2*i-1] in Rp then
            Add( l, Order(dt[2*i-1])-1);
        fi;

        if l <> [ ] then
            return Minimum( l );
        else
            return 0;
        fi;
    
    elif j = i + 2 or i = j + 2 then
        for n in [0..10] do
            if
                dt[2*i-1]^n*dt[i+j+2]=F(1)
            then
                Add( l, n );
            fi;
        od;

        if dt[2*i-1] in Rp then
            Add(l,Order(dt[2*i-1])-1);
        fi;
        
        if l <> [ ] then
            return Minimum(l);
        else
            return 0;
        fi;
    else
        return 0;
    fi;
end;

############################################################################################
############################################################################################
################################### A Main Function ########################################
# the function $mm$ gives the list of values of $m(i,j)$ for each $i$,m$j$.
## In this program the following programs and subroutines are called.
## 1. m
############################################################################################


InstallGlobalFunction( mm, function(dt)
    local d, listmij;

	if Number(dt) = 5 then
	    d := Concatenation( dt, [F1] );
	else
	    d:=dt;
	fi;

	listmij := [ m@(d,1,2), m@(d,2,1), m@(d,2,3), m@(d,3,2), m@(d,1,3), m@(d,3,1)];
	
	return listmij;
end );

############################################################################################
############################################################################################
################################### A Main Function ########################################
# the function return a list of reflections.
## In this program the following programs and subroutines are called.
## 1. m
############################################################################################

ss@:=function(i, d)
    local dt, reflec_list;

    if Number(d) = 5 then
	    dt:=Concatenation(d, [ F1 ] );
	else
        dt := d;
	fi;
	if i = 1 then
	    reflec_list := [
		    dt[1],
			dt[1]^(2*m@(dt,1,1)*m@(dt,1,2))*dt[1]^(2*m@(dt,1,2))*dt[2]^m@(dt,1,1)*dt[2],
			(dt[1]^m@(dt,1,2)*dt[2])^m@(dt,1,2)*dt[3],
			dt[1]^(2*m@(dt,1,2)*m@(dt,1,3))*dt[2]^m@(dt,1,3)*dt[6]^m@(dt,1,2)*dt[4],
			(dt[1]^m@(dt,1,3)*dt[6])^m@(dt,1,3)*dt[5],
			dt[1]^(2*m@(dt,1,1)*m@(dt,1,3))*dt[1]^(2*m@(dt,1,3))*dt[6]^m@(dt,1,1)*dt[6]
		];
    fi;
	if i = 2 then
		reflec_list := [
			(dt[3]^m@(dt,2,1)*dt[2])^m@(dt,2,1)*dt[1],
			dt[3]^(2*m@(dt,2,1)*m@(dt,2,2))*dt[2]^m@(dt,2,2)*dt[3]^(2*m@(dt,2,1))*dt[2],
			dt[3],
            dt[3]^(2*m@(dt,2,2)*m@(dt,2,3))*dt[3]^(2*m@(dt,2,3))*dt[4]^m@(dt,2,2)*dt[4],
			(dt[3]^m@(dt,2,3)*dt[4])^m@(dt,2,3)*dt[5],
			dt[3]^(2*m@(dt,2,1)*m@(dt,2,3))*dt[2]^m@(dt,2,3)*dt[4]^m@(dt,2,1)*dt[6]
		];
    fi;
	if i = 3 then
	    reflec_list := [
			(dt[5]^m@(dt,3,1)*dt[6])^m@(dt,3,1)*dt[1],
			dt[5]^(2*m@(dt,3,1)*m@(dt,3,2))*dt[6]^m@(dt,3,2)*dt[4]^m@(dt,3,1)*dt[2],
			(dt[5]^m@(dt,3,2)*dt[4])^m@(dt,3,2)*dt[3],
			dt[5]^(2*m@(dt,3,2)*m@(dt,3,3))*dt[4]^m@(dt,3,3)*dt[5]^(2*m@(dt,3,2))*dt[4],
			dt[5],
            dt[5]^(2*m@(dt,3,1)*m@(dt,3,3))*dt[6]^m@(dt,3,3)*dt[5]^(2*m@(dt,3,1))*dt[6]
		];
	fi;
    return reflec_list;
end;

############################################################################################
############################################################################################
################################### A Main Function ########################################
## the function return a list of reflections.
## In this program the following programs and subroutines are called.
## 1. ss
## 2. F1
############################################################################################

InstallGlobalFunction( s, function(i, d)
    if ss@( i, d)[2] <> F1 and ss@( i, d)[4] <> F1 then
        return ss@( i, d );
	elif ss@( i, d )[2] = F1 then
        return Permuted( ss@( i, d ), ( 1, 5, 3 )( 2, 6, 4 ) );
	elif ss@(i, d)[4] = F1 then
        return Permuted( ss@( i, d ), ( 1, 3, 5 ) ( 2, 4, 6 ) );
	fi;
end );