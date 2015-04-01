%以一条鱼为中心计算食物量
function foodnumber = foodnumber_test(af,best_rp)
global x_length;
global y_length;
global z_length;
x_size = zeros(1,2);
x_size(1) = ceil(max(af.c(1)-af.coverage,0.1));
x_size(2) = min(ceil(af.c(1)+af.coverage),x_length);
y_size = zeros(1,2);
y_size(1) = ceil(max(af.c(2)-af.coverage,0.1));
y_size(2) = min(ceil(af.c(2)+af.coverage),y_length);
z_size = zeros(1,2);
z_size(1) = ceil(max(af.c(3)-af.coverage,0.1));
z_size(2) = min(ceil(af.c(3)+af.coverage),z_length);
foodnumber = 0;
for x_i = x_size(1):1:x_size(2)
    for y_i = y_size(1):1:y_size(2)
        for z_i = z_size(1):1:z_size(2)
            if best_rp(x_i,y_i,z_i) == 0
                continue;
            end    
            d_ch = 0;
            cr_layer_list = cr_layer(af,z_i);
            dis_layer_reduce = sum(af.layer_reduce.*cr_layer_list);
            dis_a = ((x_i-af.c(1))^2+(y_i-af.c(2))^2+(z_i-af.c(3))^2)^(1/2)+d_ch+dis_layer_reduce;
            if dis_a <= af.coverage
                foodnumber = foodnumber + 1;
            end
        end
    end
end