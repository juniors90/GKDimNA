gap> START_TEST( "test_sep.tst");
gap> # Case 1: all edges are finite.
gap> # we collect all triangles on a list "tris"
gap> tris := TrisSet( Hff );;
gap> # we keep only those triangles that are triangles under simple reflections.
gap> triss := SimpleSReflection(tris, F1);;
gap> Number(triss);
106
gap> l1 := RemainingElementsList(triss);;
gap> Number(l1);
0
gap> STOP_TEST("test_sep.tst", 1 );
