#! @Chapter Implementation
#! In this section we define skew braces and list some of their
#! main properties. References: 
#! <Cite Key="angiono2021"/>.
#! @Section Basic usage
DeclareGlobalFunction( "Per" );
DeclareGlobalFunction( "TrisSet" );
#! @ExampleSession
#! gap> # Case 1: all edges are finite.
#! gap> # we collect all triangles on a list "tris"
#! gap> tris := TrisSet( Hff );;
#! @EndExampleSession
DeclareGlobalFunction( "TrisSet2" );
#! @ExampleSession
#! gap> # we keep only those triangles that are triangles under simple reflections.
#! gap> triss := SimpleSReflection(tris, F1);;
#! gap> Number(triss);
#! 106
#! @EndExampleSession
DeclareGlobalFunction( "SimpleSReflection" );
DeclareGlobalFunction( "RemainingElementsList" );
DeclareGlobalFunction( "HqevSet" );