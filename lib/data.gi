#######################################################################################################
#######################################################################################################
## 2.1 The list of diagrams of rank 2: the finite, the parametric on q and the parametric functions
##                                                                                                   
## ---------------------------------------------------------------------------  

d1 := [q,F(1),r];;
d2 := [q,q^-1,q];;
d3a := [q,q^-1,-F(1)];;
# q different from -1
d3b := [-F(1),q^-1,-F(1)];;
d4 := [q,q^-2,q^2];;#B2
d5 := [q,q^-2,-F(1)];;
# q is not a root of order 4
# d5b := [-q^-1,q^2,-F(1)];;
d6 := [F(3),q^-1,q];;
# q is not a root of order 3
# d6b := [F(3),F(3)^-1*q,F(3)*q^-1];;
d7 := [F(3),-F(3),-F(1)];;
# d7b := [F(3)^-1,-F(3)^-1,-F(1)];;
d8a := [-F(12)^-2,-F(12)^3,-F(12)^2];;
d8b := [-F(12)^-2,F(12)^-1,-F(1)];;
d8c := [-F(12)^2,-F(12),-F(1)];;
d8d := [-F(12)^3,F(12),-F(1)];;
d8e := [-F(12)^3,-F(12)^-1,-F(1)];;
d9a := [-F(12)^2,F(12),-F(12)^2];;
d9b := [-F(12)^2,F(12)^3,-F(1)];;
d9c := [-F(12)^-1,-F(12)^3,-F(1)];;
d10a := [-F(9),F(9)^-2,F(9)^3];;
d10b := [F(9)^3,F(9)^-1,-F(1)];;
d10c := [-F(9)^2,F(9),-F(1)];;
d11 := [q,q^-3,q^3];;
d12a := [F(8)^2,F(8),F(8)^-1];;
d12b := [F(8)^2,-F(8)^-1,-F(1)];;
d12c := [F(8),-F(8),-F(1)];;
d13a := [F(24)^6,-F(24)^-1,-F(24)^-4];;
d13b := [F(24)^6,F(24),F(24)^-1];;
d13c := [-F(24)^-4,F(24)^5,-F(1)];;
d13d := [F(24),F(24)^-5,-F(1)];;
d14a := [F(5),F(5)^2,-F(1)];;
d14b := [-F(5)^-2,F(5)^-2,-F(1)];;
d15a := [F(20),F(20)^-3,-F(1)];;
d15b := [-F(20),-F(20)^-3,-F(1)];;
d15c := [-F(20)^-2,F(20)^3,-F(1)];;
d15d := [-F(20)^-2,-F(20)^3,-F(1)];;
d16a := [-F(15),-F(15)^-3,F(15)^5];;
d16b := [F(15)^3,-F(15)^4,-F(15)^-4];;
d16c := [F(15)^5,-F(15)^-2,-F(1)];;
d16d := [F(15)^3,-F(15)^2,-F(1)];;
d17a := [-F(7),-F(7)^-3,-F(1)];;
d17b := [-F(7)^-2,-F(7)^3,-F(1)];;
                                                                                  
## --------------------------------------------------------------------------- 
## generic rank 2 diagrams as functions (together with their flips):

d2q := q->[q,q^-1,q];;
d3aq := q->[q,q^-1,-F(1)];;
d3apq := q->[-F(1),q^-1,q];;
# q is not -1
d3bq := q->[-F(1),q^-1,-F(1)];;
d4q := q->[q,q^-2,q^2];;
d4pq := q->[q^2,q^-2,q];;
d5q := q->[q,q^-2,-F(1)];;
d5pq := q->[-F(1),q^-2,q];;
# q not of order 4
#d5b := [-q^-1,q^2,-F(1)];;
d6q := q->[F(3),q^-1,q];;
d6pq := q->[q,q^-1,F(3)];;
d11q := q->[q,q^-3,q^3];;
d11pq := q->[q^3,q^-3,q];;

## --------------------------------------------------------------------------- 
# the list of all diagrams:
H := [   d1,   d2,  d3a,  d3b,   d4,   d5,   d6,   d7,  d8a,  d8b,  d8c,  d8d,  d8e,
        d9a,  d9b,  d9c, d10a, d10b, d10c,  d11, d12a, d12b, d12c, d13a, d13b, d13c,
       d14a, d14b, d15a, d15b, d15c, d15d, d16a, d16b, d16c, d16d, d17a, d17b
];;

## --------------------------------------------------------------------------- 
# the list of finite (i.e. non-generic) diagrams:

Hf := [   d7,  d8a,  d8b,  d8c,  d8d,  d8e,  d9a,  d9b,  d9c, d10a,
        d10b, d10c, d12a, d12b, d12c, d13a, d13b, d13c, d14a, d14b,
        d15a, d15b, d15c, d15d, d16a, d16b, d16c, d16d, d17a, d17b
];;

# the permutations:
fH := [];;
for d in Hf do
    if [d[3],d[2],d[1]]<>d then
        Add(fH,[d[3],d[2],d[1]]);
    fi;
od;
#both 
Hff:=Concatenation(Hf,fH);;

## --------------------------------------------------------------------------- 
#list of generic diagrams
Hg:=[d2,d3a,d3b,d4,d5,d11];;
# the permutations:
gH:=[];;
for d in Hg do
if [d[3],d[2],d[1]]<>d then
Add(gH,[d[3],d[2],d[1]]);
fi;
od;
#both:
Hgg:=Concatenation(Hg,gH);;

## --------------------------------------------------------------------------- 
#list of generic diagrams  as functions
Hgq:=[d2q,d3aq,d3bq,d4q,d5q,d11q];;
#permutations:
Hq:=[d2q,d3aq,d3apq,d3bq,d4q,d4pq,d5q,d5pq,d6q,d6pq,d11q,d11pq];

## --------------------------------------------------------------------------- 
#parametric diagrams evaluated at roots in Gf
Hqev:=[];
Gf:=SetConcat(14,18,20,24,30);;
for d in Hq do
for p in Gf do
if d(p)[1]<>F1 and d(p)[2]<>F1 and d(p)[3]<>F1 then
Add(Hqev,d(p));
fi;
od;
od;
Hqev:=Set(Hqev);;

## --------------------------------------------------------------------------- 
#finite and Gf-evaluated parametric diagrams:
all:=Concatenation(Hff,Hqev);;
all:=Set(all);;