
% Model for Pc2TF dissociation from substrate

p.ka=2e3;
p.kd=1e-2;
p.Ptotal=(1e-6)/2;
p.Ltotal=1e-6;
p.Vr=100;

p.Pb10=0;
p.Pb20=(1e-6)/2;
p.tf=1800; 

y0=[p.Pb10 p.Pb20];

options = odeset('AbsTol', 1e-9, 'RelTol', 1e-6);
[t y] = ode15s(@Pc2TFrhs, [0 p.tf], y0, options, p);

PbTotal = y(:,1) + y(:,2);

figure(1);
plot (t, PbTotal); 
xlabel ('Time'); ylabel ('Pc2TF bound'); title ('Pc2TF dissociation under washing');
figure(2);
plot (t, y(:,1));
xlabel ('Time'); ylabel ('Pb1 concentration'); title ('Concentration profile');
figure(3);
plot (t, y(:,2)); 
xlabel ('Time'); ylabel ('Pb2 concentration'); title ('Concentration profile');
% figure(4);
% plot (t, Ra);
% xlabel ('Time'); ylabel ('Receptor A concentration'); title ('Concentration profile');
% figure(5);
% plot (t, Rb);
% xlabel ('Time'); ylabel ('Receptor B concentration'); title ('Concentration profile');