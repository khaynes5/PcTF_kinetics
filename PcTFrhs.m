function yp = PcTFrhs (t, y, p);

Pb=y(1);

yp=y;

Pu = p.Ptotal - Pb;
Lu = p.Ltotal - Pb;

%dPb/dt (PcTF bound to ligand)
yp(1) = p.ka*Pu*Lu - p.kd*Pb;