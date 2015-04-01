count=0;
for i=1:1:18
    for j=1:1:18
        for k=1:1:18
            if(best_rp(i,j,k)>=2)
                count=count+1;
            end
        end
    end
end