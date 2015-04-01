%��ʳ
function [af,find] = food(af, af_density)
global rp;
global x_length;
global y_length;
global z_length;
global k_coverage;
a = 2*pi*rand;%ȷ��x��y
b = 2*pi*rand;%ȷ��z
find = 0; %����Ƿ��ҵ�ʳ��
r = af.visual*rand;
fx = min(x_length, max(0.01,af.c(1)+r*cos(a)*cos(b)));
fy = min(y_length, max(0.01,af.c(2)+r*sin(a)*cos(b)));
fz = min(z_length, max(0.01,af.c(3)+r*sin(b)));
fg = [fx,fy,fz];
fx_c = ceil(fx);
fy_c = ceil(fy);
fz_c = ceil(fz);
if rp(fx_c,fy_c,fz_c) > k_coverage
    return;
end
af_tmp = af();
af_tmp = set_xyz(af_tmp, fg);
af_tmp_density = density_fish(af_tmp);
if af_tmp_density>af_density
    af.c = move(af,fg);
    find = 1;
end
