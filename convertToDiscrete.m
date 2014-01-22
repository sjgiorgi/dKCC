function [A_d, B_d, C_d, D_d, G_d] = convertToDiscrete(A,B,C,D,G,dt)

    sysyaw = c2d(ss(A,B,C,D), dt);
    A_d = sysyaw.a;
    B_d = sysyaw.b;
	C_d = sysyaw.c;
	D_d = sysyaw.d;
    G_d = dt*G;

end