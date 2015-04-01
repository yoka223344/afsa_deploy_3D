%µ•Ãı”„∏≤∏««¯”Ú
function af = af_cover(af_x)
global rp;
global rp_b
global x_length;
global y_length;
global z_length;
%global layer_height;
x_plane = [max(1,ceil(af_x.c(1)-af_x.coverage)), min(x_length,floor(af_x.c(1)+af_x.coverage))];
y_plane = [max(1,ceil(af_x.c(2)-af_x.coverage)), min(y_length,floor(af_x.c(2)+af_x.coverage))];
z_plane = [max(1,ceil(af_x.c(3)-af_x.coverage)), min(z_length,floor(af_x.c(3)+af_x.coverage))];
for z_tmp = z_plane(1):1:z_plane(2)
    cr_layer_list = cr_layer(af_x,z_tmp);
    dis_layer_reduce = sum(af_x.layer_reduce.*cr_layer_list);
    d_ch = 0;
    for y_tmp = y_plane(1):1:y_plane(2)
        for x_tmp = x_plane(1):1:x_plane(2)
            dis = ((af_x.c(1) - x_tmp)^2 + (af_x.c(2) - y_tmp)^2 + (af_x.c(3) - z_tmp)^2)^(1/2);
            dis = dis + dis_layer_reduce + d_ch;
            if (dis <= af_x.coverage)
                rp(x_tmp,y_tmp,z_tmp) = rp(x_tmp,y_tmp,z_tmp) + 1;
                rp_b(x_tmp,y_tmp,z_tmp) = 1;
            end
        end
    end
end