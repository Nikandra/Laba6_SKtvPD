function y = kineticheskaya_energia(t, x)
H0=4.5; T=0.1;
Psi =0.035*x(3)^2;
u=(0.952-(1/50*T)*x(3)+1.55*sin(x(1)));
 
y = [x(2); 
    6.14*x(3)+50*sin(x(1))-6.46*u; 
    -23.8*x(3)-38.8*sin(x(1))+ 25*u];
