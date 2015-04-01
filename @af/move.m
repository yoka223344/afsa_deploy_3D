function move_xyz = move(af,fg)
global x_length;
global y_length;
global z_length;
movex = af.c(1)+(fg(1)-af.c(1))/((fg(1)-af.c(1))^2+(af.c(2)-fg(2))^2+(af.c(3)-fg(3))^2)^(1/2)*af.step*rand;
movey = af.c(2)+(fg(2)-af.c(2))/((fg(1)-af.c(1))^2+(af.c(2)-fg(2))^2+(af.c(3)-fg(3))^2)^(1/2)*af.step*rand;
movez = af.c(3)+(fg(3)-af.c(3))/((fg(1)-af.c(1))^2+(af.c(2)-fg(2))^2+(af.c(3)-fg(3))^2)^(1/2)*af.step*rand;
movex = max(0,min(movex,x_length));
movey = max(0,min(movey,y_length));
movez = max(0,min(movez,z_length));
move_xyz = [movex,movey,movez];
