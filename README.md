# Astr34000_stats
Final Project for Stats ASTR34000 @ UChicago, Winter 2024

Uses Alex Drlica-Wagner's "dsphsim" code to generate line-of-sight "spectroscopic" velocity observations for spheroidal dwarf galaxy satellites of the Milky Way. 
https://github.com/kadrlica/dsphsim

What is necessary to know about this package is
1. The number of stars generated according to (I think) a Chabrier IMF and a user specified stellar mass.
2. The dark matter profile follows a NFW profile and the stars (positions) are simulated according to a Plummer profile.
3. The dark matter profile (with no contribution from the stars) is used to generate a velocity distribution at every radius from the center.
4. For every star, a los velocity VTRUE is selected from the velocity distribution at that radius
5. Independent of the velocity, every star has its magnitudes selected from an isochrone.
6. A VSTATERR is calculated from the magnitude, representing measurement uncertainty from the brightness of the star. A VSYSERR is assumed (broadly related to systematic factors that vary with instruments and observers)
7. A VSTAT and VSYS adjustment to the VTRUE are generated from normals with spreads of VSTATERR and VSYSERR, respectively.
8. VMEAS=VTRUE+VSTAT+VSYS
9. VERR=sqrt(VSTATERR^2+VSYSERR^2)

In my personal set up I run this folder in dsphsim/ (the parent repository) parallel to the dsphsim folder (with all the scripts in it).
