clear all
tic
global z_ax;
global z_r;
global z_d;
global afs;
global afs_value;
global af_total;
global afs_c;
global afs_value;
global b;
global b_value;
global t_value;
global it_times;
global pass_times;
global weight;
global height;
global rp;
global cover;
global b_afs;
global zong_afs;
%global dmin;
cover=7;
af_total=30;
zong_afs=0;
it_times=500;
weight=100;
height=100;
z_ax=[weight*rand,height*rand];
z_r=[1,2];
z_d=[1,1];
af_x=af();
rp_base=zeros(100,100);
for k_c=1:1:cover
%     if k_c>2
%         af_total=23;
%     end
%     if k_c>4
%         af_total=25;
%     elseif k_c>2
%          af_total=30;
%     end
     zong_afs=zong_afs+af_total;
    b_value=[0];
    pass_times=0;
    afs=[];
    for i=1:1:af_total
        afs{i}=af();
    end
    for mym=1:1:af_total
     afs{mym}=afk(afs{mym},z_ax,z_r);
    end
    for j=1:1:it_times
        rp=rp_base;
        pass_times=pass_times+1;
        if(pass_times>1)
          b_value(pass_times)=b_value(pass_times-1);
        else
            b_value(1)=0;
        end
        for i=1:1:af_total
            [x,y]=getxy(afs{i});
            [x,y]=food(afs{i},k_c);
            af_xy=[x,y];
            afs{i}=setxy(afs{i},af_xy);
            afs{i}=afk(afs{i},z_ax,z_r);
%             if k_c>1
%                 [d_b,near_b]=dmin_b(afs{i},k_c);
%                 [x,y]=leave_b(afs{i},d_b,near_b,k_c);
%                 af_xy=[x,y];
%                 afs{i}=setxy(afs{i},af_xy);
%                 afs{i}=afk(afs{i},z_ax,z_r);
%             end
            [afd,n_x]=dmin(afs{i});
            [x,y]=swarm(afs{i},afd,n_x);
             af_xy=[x,y];
            afs{i}=setxy(afs{i},af_xy);
            afs{i}=afk(afs{i},z_ax,z_r);
            fux(afs{i});
        end
        k=0;
        for ii=1:1:100
            for jj=1:1:100
                if rp(ii,jj)<1*k_c
                    k=k+1;
                end
            end
        end
        value=1-k/(100*100);
       if(b_value(pass_times)<value)
           b_value(pass_times)=value;
           for b_i=1:1:af_total
               kmk=b_i+zong_afs-af_total;
               b_afs{kmk}=afs{b_i};
           end
           bb_rp=rp;
       end
       if(b_value(pass_times)>=0.99)
           break;
       end
    end
    value
    rp_base=bb_rp;
end
global count_dead;
rp=rp_base;
count_dead=0;
for i=zong_afs:-1:1
    b_afs{i}=dead(b_afs{i},cover);
end
count_dead
for iii=1:1:zong_afs
    [x,y]=getxy(b_afs{iii});
%     rectangle('Position',[x-15,y-15,2*15,2*15],'Curvature', [1 1]);
%     hold on;
    plot(x,y,'+');
    hold on;
end
hold on
plot(z_ax(1),z_ax(2),'*');
toc