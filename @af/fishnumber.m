% 一条鱼覆盖范围内总鱼数
function fishnumber = fishnumber(af)
global afs;
global af_total;
fishnumber = 0;
for i=1:1:af_total
    cr_layer_list = cr_layer(af,afs{i}.c(3));
    dis_layer_reduce = sum(af.layer_reduce.*cr_layer_list);
    d_ch = 0;
    dis = ((af.c(1)-afs{i}.c(1))^2+(af.c(2)-afs{i}.c(2)+(af.c(3)-afs{i}.c(3))^2)^2)^(1/2)+d_ch+dis_layer_reduce;
    if dis <= af.coverage
        fishnumber = fishnumber + 1;
    end
end