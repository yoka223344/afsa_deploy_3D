function af = swarm(af)
global af_total;
global afs;
global x_length;
global y_length;
global z_length;
dmin = (x_length^2+y_length^2+z_length^2)^(1/2);
near = 0;
if af.comfort >=x_length*y_length*z_length/af_total;
    af.c = rmove(af);
else
    for i = 1:1:af_total
        if afs{i}.comfort > af.comfort
            cr_layer_list = cr_layer(af,afs{i}.c(3));
            dis_layer_reduce = sum(af.layer_reduce.*cr_layer_list);
            d_ch = 0;
            dis = ((af.c(1)-afs{i}.c(1))^2+(af.c(2)-afs{i}.c(2))^2+(af.c(3)-afs{i}.c(3))^2)^(1/2)+d_ch+dis_layer_reduce;
            if dmin >dis
                af.c = move(af,afs{i}.c);
            end
        end
    end
end

