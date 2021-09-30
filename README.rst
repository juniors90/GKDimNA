===================================
The GAP package GKDimNA [building]
===================================

.. image:: https://img.shields.io/badge/GKDimNA-Package-blue
   :target: https://img.shields.io/badge/GKDimNA-Package-blue

.. image:: https://img.shields.io/badge/arXiv-2103.06856-b31b1b.svg
   :target: https://arxiv.org/abs/2106.10143

.. image:: https://img.shields.io/badge/GAP-System-yellow
   :target: https://img.shields.io/badge/GAP-System-yellow

.. image:: https://img.shields.io/badge/License-MIT-blue.svg
   :target: https://tldrlegal.com/license/mit-license

`GKDimNA packages <https://github.com/juniors90/GKDimNA/>`_ - On
Finite GK-Dimensional Nichols Algebras of Diagonal Type - check
rank 3 and Cartan type. Inspirated by scripts of
Iván Angiono and Agustín García Iglesias.

Requirements
--------------

You need GAP 4.10+ to run GKDimNA.

Usage
-----

Here is an example::

    gap> LoadPAckage( "GKDimNA", false );
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

The GKDimNA Package has a `proper documentation
<https://github.com/juniors90/GKDimNA/>`_, which you can check for more
details.

## Contact

TODO: add info on how to contact you and/or how to report issues with your
package

## License

TODO: Provide information on the license of your package. A license is
important as it determines who has a right to distribute your package. The
"default" license to consider is GNU General Public License v2 or later, as
that is the license of GAP itself.
