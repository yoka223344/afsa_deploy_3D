%获取某一条鱼周围的密度
function density = density_fish(af)
af_foodnumber = foodnumber(af);
af_fishnumber = fishnumber(af);
density = af_foodnumber/af_fishnumber;
