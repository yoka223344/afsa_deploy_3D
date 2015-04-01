function draw_af = draw_af(af)
[x,y,z]=sphere();
mesh(af.coverage*x+af.c(1),af.coverage*y+af.c(2),af.coverage*z+af.c(3));
plot3(af.c(1),af.c(2),af.c(3),'+');
axis equal
hold on