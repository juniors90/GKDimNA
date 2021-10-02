#
# GKDimNA: ON FINITE GK-DIMENSIONAL NICHOLS ALGEBRAS OF DIAGONAL TYPE: RANK 3 AND CARTAN TYPE
#
# Implementations
#
# This is the basic file to run the criteria for lines and triangles.
#################################
# 1. Preliminaries
#################################
# We introduce two indeterminates "q" and "r";
# which will be our generic parameters
q := Indeterminate(Rationals, "q" );
r := Indeterminate(Rationals, "r" );
# We denote by "K" the field of rational functions on those two variables. 
K := Field(q,r);;
# "F1" (also, later F(1)) and "F0" will denote the unit and the null element of the field "K"
F1 := One( K );;
F0 := Zero( K );;
# we define our roots in the field K, they shall be called "F()" instead of E():
F := n->E(n)*F1;
