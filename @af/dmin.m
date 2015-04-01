function [dmin,near] = dmin(af)
global afs;
global af_total;
global x_length;
global y_length;
global z_length;
dmin = (x_length^2+y_length^2+z_length^2)^(1/2);
near = 0;
for i=1:1:af_total
    if sum(af.c~=afs{i}.c)>0
        cr_layer_list = cr_layer(af,afs{i}.c(3));
        dis_layer_reduce = sum(af.layer_reduce.*cr_layer_list);
        d_ch = 0;
        dis = ((af.c(1)-afs{i}.c(1))^2+(af.c(2)-afs{i}.c(2)+(af.c(3)-afs{i}.c(3))^2)^2)^(1/2)+d_ch+dis_layer_reduce;
        if dmin >dis
            near = i;
            dmin = dis;
        end
    end
end