%º∆À„”„»∫√‹∂»
function afs_density = afs_density(afs,best_rp)
global af_total;
afs_density = zeros(1,af_total);
for i = 1:1:af_total
    afs_density(i) = density_fish_test(afs{i},best_rp,afs);
end