#
# GKDimNA: ON FINITE GK-DIMENSIONAL NICHOLS ALGEBRAS OF DIAGONAL TYPE: RANK 3 AND CARTAN TYPE
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "GKDimNA" );

TestDirectory(DirectoriesPackageLibrary( "GKDimNA", "tst" ),
  rec(exitGAP := true, testOptions := rec(compareFunction := "uptowhitespace")));

FORCE_QUIT_GAP(1); # if we ever get here, there was an error


