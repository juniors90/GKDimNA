###############################################
# 6. To remove permutations and/or reflections from a list.
###############################################

InstallGlobalFunction( Per, function(l)
    local d,ll,lt,lf;
	lt:=[];
	lf:=[];
	for d in l do
	    if Number(d)=5 then
		    Add(lt,Concatenation(d,[F1]));
		else
		    Add(lt,d);
		fi;
	od;

	ll:=[lt[1]];

	for d in lt do
	    if d in ll or Permuted(d,(1,3,5)(2,4,6)) in ll
		    or Permuted(d,(1,5,3)(2,6,4)) in ll 
            or Permuted(d,(3,5)(2,6)) in ll
			or Permuted(d,(1,5)(2,4)) in ll
			or Permuted(d,(1,3)(4,6)) in ll
			or s(1,d) in ll
			or Permuted(s(1,d),(1,3,5)(2,4,6)) in ll
			or Permuted(s(1,d),(1,5,3)(2,6,4)) in ll
			or Permuted(s(1,d),(3,5)(2,6)) in ll
			or Permuted(s(1,d),(1,5)(2,4)) in ll
			or Permuted(s(1,d),(1,3)(4,6)) in ll
			or s(2,d) in ll
			or Permuted(s(2,d),(1,3,5)(2,4,6)) in ll
			or Permuted(s(2,d),(1,5,3)(2,6,4)) in ll
			or Permuted(s(2,d),(3,5)(2,6)) in ll
			or Permuted(s(2,d),(1,5)(2,4)) in ll
			or Permuted(s(2,d),(1,3)(4,6)) in ll
			or s(3,d) in ll
			or Permuted(s(3,d),(1,3,5)(2,4,6)) in ll
			or Permuted(s(3,d),(1,5,3)(2,6,4)) in ll
			or Permuted(s(3,d),(3,5)(2,6)) in ll
			or Permuted(s(3,d),(1,5)(2,4)) in ll
			or Permuted(s(3,d),(1,3)(4,6)) in ll then
		else
			Add(ll,d);
		fi;
	od;

	for d in ll do
	    if d[6]=F1 then
		    Remove(d,6);
		    Add(lf,d);
		else
		    Add(lf,d);
		fi;
	od;

    return Set(lf);
end );

# This file deals with triangles
Tri@ := function(d, f, g)
    if d[3] = f[1] and f[3] = g[1] and g[3] = d[1] then
        return Concatenation( d, [f[2], f[3], g[2]] );
    else
        return 0;
    fi;
end;

# we collect all triangles on a list "tris"
InstallGlobalFunction( TrisSet, function(Hff)
    local tris, d, f, g;
    tris := [ ];;
    for d in Hff do
        for f in Hff do
            for g in Hff do
                if Tri@( d, f, g ) <> 0 then
                    Add( tris, Tri@( d, f, g ) );
                fi;
            od;
        od;
    od;
    tris := Set( tris );;
    return tris;
end );

# we collect all triangles on a list "tris"
InstallGlobalFunction( TrisSet2, function(Hff)
    local tris, d, f, g;
    tris := [ ];;
    for d in Hff do
        for f in Hff do
            for g in Hqev do
                if Tri@( d, f, g ) <> 0 then
                    Add( tris, Tri@( d, f, g ) );
                fi;
            od;
        od;
    od;
    tris := Set( tris );;
    return tris;
end );

InstallGlobalFunction( SimpleSReflection, function(tris, F1)
    local triss, d;
    # we keep only those triangles that are triangles under simple reflections.
    triss := [ ];;
    for d in tris do
        if s(1,d)[6] <> F1 and s(2,d)[6] <> F1 and s(3,d)[6] <> F1 then
            Add( triss, d );
        fi;
    od;
    return triss; 
end );

InstallGlobalFunction( RemainingElementsList, function(triss)
    local list1, d;
    list1 := [ ];
    for d in triss do
        if Testall@( d ) = 1 then
            Add( list1, d );
        fi;
    od;
    return list1;
end);

InstallGlobalFunction( HqevSet, function(listH, F1, Gf)
    local gf, H, d, p;
    H := [ ];
    for d in listH do
        for p in Gf do
            if d( p )[1] <> F1 and d(p)[2] <> F1 and d(p)[3] <> F1 then
                Add( H, d( p ) );
            fi;
        od;
    od;
    H := Set( H );;
    return H;
end );