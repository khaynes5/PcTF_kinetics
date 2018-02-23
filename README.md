# PcTF_kinetics
Modeling interactions of synthetic chromatin proteins with histone tail ligands
Author: Michael R. Caplan, Arizona State University
Posted to Github with permission from the Author by: Karmella A. Haynes, Arizona State university

Initial conditions were written to describe the initial amount of bound PcTF (1 x 10-6 M) and bound Pc2TF (0.5 x 10-6 M) to simulate saturated ligands – each Pc2TF is bound to two ligands, thus half as many Pc2TF molecules would saturate the surface. 

In one simulation, for washing a spot array with PcTF, an equation was written to describe PcTF association and dissociation with a single ligand as: dPb/dt = ka * Pu * Lu – kd * Pb. 

ka is the association rate constant.
kd is the dissociation rate constant.
Pu is the concentration of unbound PcTF (or Pc2TF)
Lu is the concentration of unbound ligand
Pb is the complex of PcTF bound to ligand
Algebraic equations also track unbound PcTF (Pu = Ptotal – Pb) and unbound ligand (Lu = Ltotal – Pb).

In the other simulation, for washing a spot array with Pc2TF, two equations were written. 

The first equation describes Pc2TF association with a ligand to form a complex bound by one PCD to one ligand (Pb1) which can be lost either by dissociation or association of a second PCD or can be regained by one of the two PCDs of a Pb2 dissociating: 
dPb1/dt = ka * Pu * Lu – kd * Pb1 – ka * Vr * Pb1 * Lu + kd * Pb2
These parameters are the same as above but also include Vr which is the ratio of overall concentration to effective local concentration (see Shewmake et al. 2008) and Pb2 which is a Pc2TF bound to two ligands via a PCD for each ligand. 
The second equation describes the second PCD of Pb1 binding to a ligand and dissociation of one PCD from a ligand: 
dPb2/dt = ka * Vr * Pb1 * Lu – kd * Pb2. 
Algebraic equations also track unbound Pc2TF (Pu = Ptotal – (Pb1 + Pb2)) and unbound ligand (Lu = Ltotal – 1* Pb1 – 2* Pb2).

Parameters were set to: ka = 2000 M-1 s-1, kd = 0.01 s-1, Ptotal = initial value of Pb (PcTF) or Pb2 (Pc2TF), Ltotal = 1 x 10-6 M, Vr = 100. 

Simulations can be run using most ordinary differential equation (ODE) solvers, but we used ode15s with absolute tolerance of 1e-9 and relative tolerance of 1e-6. 
Pb vs. time is plotted for PcTF. 
(Pb1 + Pb2), Pb1, and Pb2 are plotted vs. time for Pc2TF.
