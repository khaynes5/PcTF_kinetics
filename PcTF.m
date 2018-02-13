
% Model for PcTF dissociation from substrate

p.ka=2e3;
p.kd=1e-2;
p.Ptotal=1e-6;
p.Ltotal=1e-6;
p.Vr=100;

p.Pb0=1e-6;
p.tf=1800; 

y0=[p.Pb0];

options = odeset('AbsTol', 1e-9, 'RelTol', 1e-6);
[t y] = ode15s(@PcTFrhs, [0 p.tf], y0, options, p);

figure(1);
plot (t, y(:,1)); 
xlabel ('Time'); ylabel ('PcTF bound'); title ('PcTF dissociation under washing');
% figure(2);
% plot (t, y(:,2));
% xlabel ('Time'); ylabel ('Complex A concentration'); title ('Concentration profile');
% figure(3);
% plot (t, y(:,3)); 
% xlabel ('Time'); ylabel ('Complex B concentration'); title ('Concentration profile');
% figure(4);
% plot (t, Ra);
% xlabel ('Time'); ylabel ('Receptor A concentration'); title ('Concentration profile');
% figure(5);
% plot (t, Rb);
% xlabel ('Time'); ylabel ('Receptor B concentration'); title ('Concentration profile');