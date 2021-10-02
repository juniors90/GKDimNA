#######################################################################
##          PackageInfo.g file for the GAP 4 Package - GKDimNA
## ON FINITE GK-DIMENSIONAL NICHOLS ALGEBRAS OF DIAGONAL TYPE:
##                RANK 3 AND CARTAN TYPE
##
##                         Author1
##                         Author2
##
## Reading the implementation part of the package.
##
## This file contains package meta data. For additional information on
## the meaning and correct usage of these fields, please consult the
## manual of the "Example" package as well as the comments in its
## PackageInfo.g file.
##

SetPackageInfo( rec(

PackageName := "GKDimNA",
Subtitle := "ON FINITE GK-DIMENSIONAL NICHOLS ALGEBRAS OF DIAGONAL TYPE: RANK 3 AND CARTAN TYPE",
Version := "0.0.1",
Date := "21/09/2021", # dd/mm/yyyy format
License := "GPL-2.0-or-later",

Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Ahuthor1",
    LastName := "Author1",
    WWWHome := "https://GKDimNA",
    Email := "GKDimNA0@gmail.com",
    PostalAddress := "3600",
    Place := "Formosa",
    Institution := "Universidad Nacional de Formosa",
  ),
],

SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/juniors90/GKDimNA",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://juniors90.github.io/GKDimNA/",
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),
README_URL      := Concatenation( ~.PackageWWWHome, "README.rst" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),

ArchiveFormats := ".tar.gz",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##

Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := ~.PackageName,
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := ~.Subtitle,
),

Dependencies := rec(
  GAP := ">= 4.10",
  NeededOtherPackages := [ ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := ReturnTrue,

TestFile := "tst/testall.g",

Keywords := [ "Nichols Algebras", "Quantum Algebra", "Gelfand-Kirillov dimension" ],

));


