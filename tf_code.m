Gsc = tf([100 40], [1 0]);
KaGtc = tf([10 6], [1 0]);
Jtot_s = tf(1, [7.226 0]);

Kcs = 0.5;
Kss = 0.0433;
Ra = 1;
Kf = 0.1;
Kb = 2;
r_itot = 0.0615;
pcwAv0r_itot = 0.6154;
etatotKt = 1.8;

b1 = feedback(Jtot_s, pcwAv0r_itot);
b2 = feedback(b1, Kf);
b3 = series(b2, etatotKt);
b4 = feedback(b3, Kb);
b5 = series(b4, KaGtc);
b6 = feedback(b5, Kcs / b3);
b7 = series(b6, Gsc);
b8 = feedback(b7, Kss);
b9 = series(b8, r_itot);

minreal(b9)