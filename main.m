clear all
tic
global afs;
global x_length;
global y_length;
global z_length;
global af_total;
global rp;
global rp_b;
global it_times;
global pass_times;
global layer_height;
global k_coverage; %已覆盖层数
k_coverage = 0;
af_total = 120;
it_times = 200;
b_value = zeros(1,it_times);
pass_times = 0;
x_length = 18;
y_length = 18;
z_length = 18;
layer_height = [3,6,9,12,15];
rp = zeros(x_length,y_length,z_length);
rp_b = zeros(x_length,y_length,z_length);
af_x = af();
for i = 1:1:af_total
    afs{i} = af();
end
for i = 1:1:af_total
    af_cover(afs{i});
end
for it_number = 1:1:it_times
    pass_times = pass_times + 1;
    if(pass_times>1)
        b_value(pass_times) = b_value(pass_times-1);
    else
        b_value(1)=0;
    end
    for i=1:1:af_total
        af_discover(afs{i});
        af_density = density_fish(afs{i});
        for j=1:1:10
            [afs{i},find] = food(afs{i},af_density);
            if find == 1
                continue
            end
            if find == 0 && j == 10
                xyz_tmp = rmove(afs{i});
                afs{i} = set_xyz(afs{i},xyz_tmp);
            end
        end
        afs{i} = swarm(afs{i});
        af_cover(afs{i});
    end
    covered_count = 0;
    for i=1:1:18
        for j=1:1:18
            for k=1:1:18
                if(rp(i,j,k)>=1)
                    covered_count=covered_count+1;
                end
            end
        end
    end
    value = covered_count/(x_length*y_length*z_length)
    if(b_value(pass_times) < value)
        b_value(pass_times) = value;
        b_afs = afs; %保存最优解的所有数据
        best_rp = rp;
        best_rp_b = rp_b;
    end
    if (b_value(pass_times)>=0.97)
        break;
    end
end
max(b_value)
for i=1:1:af_total
    draw_af(b_afs{i});
end
toc
            
    
    
    
    
    
    
    
    
