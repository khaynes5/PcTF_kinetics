function yp = Pc2TFrhs (t, y, p);

Pb1=y(1); Pb2=y(2);

yp=y;

Pu = p.Ptotal - (Pb1 + Pb2);
Lu = p.Ltotal - 1*Pb1 - 2*Pb2;

%dPb/dt (Pc2TF bound to ligand by one PC-domain)
yp(1) = p.ka*Pu*Lu - p.kd*Pb1 - p.ka*p.Vr*Pb1*Lu + p.kd*Pb2;

%dPb/dt (PcTF bound to ligand by two PC-domains)
yp(2) = p.ka*p.Vr*Pb1*Lu - p.kd*Pb2;