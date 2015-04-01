%ÅÐ¶ÏÊÇ·ñ¿ç²ã
function cr_layer = cr_layer(afx,point_heigth)
global layer_height;
cr_layer = zeros(1,length(layer_height));
for i=1:1:length(layer_height)
    if layer_height(i)>min(afx.c(3),point_heigth) && layer_height(i)<max(afx.c(3),point_heigth)
        cr_layer(1,i) = 1;
    end
end
        