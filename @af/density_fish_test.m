%��ȡĳһ������Χ���ܶ�
function density = density_fish_test(af,best_rp,afs)
af_foodnumber = foodnumber_test(af,best_rp);
af_fishnumber = fishnumber_test(af,afs);
density = af_foodnumber/af_fishnumber;