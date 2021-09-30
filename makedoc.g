#################################################################
##          read.g file for the GAP 4 Package - GKDimNA
## ON FINITE GK-DIMENSIONAL NICHOLS ALGEBRAS OF DIAGONAL TYPE:
##                RANK 3 AND CARTAN TYPE
##
##                      Author1
##                      Author2
##
## Reading the implementation part of the package.
##
## This file is a script which compiles the package manual.
##

if fail = LoadPackage("AutoDoc", "2019.05.20") then
    Error("AutoDoc version 2019.05.20 or newer is required");
fi;

AutoDoc(
    rec(
        scaffold := rec(
            MainPage := false
        ),
        gapdoc := rec(
            main := "GKDimNA.xml"
        )
    )
);
