In a coaxial cable, the energy flow changes from the solenoid's radial storage to longitudinal transport. While a solenoid moves energy inward to build a field, a coaxial cable guides energy parallel to the wires from a source to a load.

## Ideal coaxial cable

Consider a cable with inner radius \\(a\\) and outer radius \\(b\\), carrying current \\(I\\) and voltage \\(V\\). The electric field is radial,

\\[
\\mathbf{E} = \\frac{V}{r\\ln(b/a)} \\hat{\\mathbf{r}},
\\]

and the magnetic field is azimuthal,

\\[
\\mathbf{B} = \\frac{\\mu_0 I}{2\\pi r} \\hat{\\boldsymbol{\\phi}}.
\\]

The Poynting vector is

\\[
\\mathbf{S} = \\frac{1}{\\mu_0}(\\mathbf{E}\\times\\mathbf{B})
= \\frac{VI}{2\\pi r^2\\ln(b/a)} \\hat{\\mathbf{z}},
\\]

so the energy flow is longitudinal.

Integrating over the annular cross section gives

\\[
P = VI.
\\]

## Real cables

In a real cable, resistive and dielectric losses introduce a small tilt of the Poynting vector toward the conductors. The ideal result \\(P=VI\\) remains the dominant description of the transmitted power.
