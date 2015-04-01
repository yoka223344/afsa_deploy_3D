function movexyz = rmove(af)
global x_length;
global y_length;
global z_length;
a=2*pi*rand;
b=2*pi*rand;
movex=af.c(1)+cos(b)*cos(a)*af.step*rand;
movey=af.c(2)+cos(b)*sin(a)*af.step*rand;
movez=af.c(3)+sin(b)*af.step*rand;
movex=max(0,min(movex,x_length));
movey=max(0,min(movey,y_length));
movez=max(0,min(movez,z_length));
movexyz = [movex,movey,movez];