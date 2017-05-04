% clear%n边形随机试验
 n=43;
% x=20*rand(n,1);
% y=20*rand(n,1);
% x=[0.5;0.1;0.55;0.7;0.9];
% y=[1;0.5;0.2;0.2;0.46];





o=(n+1)/2;%间隔
X=[x;x;x];
Y=[y;y;y];%循环数组用3倍的原数组表示，其中实际数组为中间的数组(n+1)号位开始
Z=X+Y*i;


for iter=1:40
    %Z=real(Z)-mean(real(Z))+(imag(Z)-mean(imag(Z)))*i;%将重心移到原点
   %Z=real(Z)./norm(real(Z),2)+imag(Z)./norm(imag(Z),2)*i;%标准化
   pause(0.05)
   plot(1:n+1,[real(Z(n+1:2*n));real(Z(n+1))],'bo-',1:n+1,[imag(Z(n+1:2*n));imag(Z(n+1))],'r*-')
    title(['Iteration ', num2str(iter)]);
    picname=[num2str(iter) '.fig'];%保存的文件名：如i=1时，picname=1.fig
    %hold on % 写后面的字时，不把前面的字冲掉
    saveas(gcf,picname)
    %set(gca, 'XLim', [-0.5 0.5], 'YLim', [-0.5 0.5]); axis equal;
    %title(['Iteration ', num2str(iter)]);
    %pause(0.5)
    %t=t+1
   % hold on
    X=[real(Z(n+1:2*n));real(Z(n+1:2*n));real(Z(n+1:2*n))];
    Y=[imag(Z(n+1:2*n));imag(Z(n+1:2*n));imag(Z(n+1:2*n))];
    for t=(n+1):(2*n)
        k_dui=(Y(t+o)-Y(t+o-1))./(X(t+o)-X(t+o-1));%先求角平分线的对边
        c_dui=Y(t+o)-X(t+o).*k_dui;%常数项
    
        k_lin1=(Y(t+1)-Y(t))./(X(t+1)-X(t));%第一条邻边
        c_lin1=Y(t)-X(t).*k_lin1;
    
        k_lin2=(Y(t-1)-Y(t))./(X(t-1)-X(t));%第一条邻边 
        c_lin2=Y(t)-X(t).*k_lin2;
    
        X1=-(c_dui-c_lin1)./(k_dui-k_lin1);%第一个交点
        Y1=k_dui*X1+c_dui;
        X2=-(c_dui-c_lin2)./(k_dui-k_lin2);%第二个交点
        Y2=k_dui*X2+c_dui;
        
        Z1=X1+Y1*i;
        Z2=X2+Y2*i;
        Z0=Z(t);
        lamda=abs(Z1-Z0)./abs(Z2-Z0);%定比分点定理
        Z(t)=(Z1+lamda.*Z2)./(1+lamda);
    end
end



%end


%——————————————————————————————
stepall=iter;
for i=1:stepall
    picname=[num2str(i) '.fig'];
    open(picname)
%     set(gcf,'outerposition',get(0,'screensize'));% matlab窗口最大化
    frame=getframe(gcf);  
    im=frame2im(frame);%制作gif文件，图像必须是index索引图像  
    [I,map]=rgb2ind(im,20);          
    if i==1
        imwrite(I,map,'matlab2gif.gif','gif', 'Loopcount',inf,'DelayTime',0.5);%第一次必须创建！
    elseif i==stepall
        imwrite(I,map,'matlab2gif.gif','gif','WriteMode','append','DelayTime',0.5);
    else
        imwrite(I,map,'matlab2gif.gif','gif','WriteMode','append','DelayTime',0.5);
    end;  
    close all

end