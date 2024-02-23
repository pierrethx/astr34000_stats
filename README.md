# Astr34000_stats
Final Project for Stats ASTR34000 @ UChicago, Winter 2024


## The Question

Is there an optimal strategy for observing that minimizes velocity dispersion uncertainty for Milky way dwarf spheroidal satellites? 

Velocity dispersion corresponds to dynamical (i.e. dark matter) mass in a system. Higher dispersion means more energetic motions of stars, which means greater binding energy required to keep the system together, which means greater mass. Then, minimizing the velocity dispersion uncertainty allows us to better constrain the dark matter masses of these systems. 

1. When looking at a population of stars, measuring the dynamical mass allows us to determine if the system is dark matter dominated (dwarf galaxies) or not (star clusters). Minimizing the velocity dispersion uncertainty helps us better differentiate dwarf galaxies from star clusters.
2. Better constraints of velocity dispersion would also apply better constraints on J-factors, which correspond to the distribution of dark matter in the systems and are calculated for various types of dark matter (self-annihilating, etc.). Minimizing velocity dispersion uncertainty helps us select dark matter models that better align with observations.


## DSPHSIM

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
This is to say that the velocity dispersion would be weakly a function of radius, the circular velocity curve is relatively flat and we can, for our purposes here, consider the velocity means and dispersion to be constant across radii (=isotropic velocity dispersion).

In my personal set up I run this folder in dsphsim/ (the parent repository) parallel to the dsphsim folder (with all the scripts in it).

