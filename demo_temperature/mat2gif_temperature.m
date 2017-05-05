clear
filename= 'result.gif'; %命名gif文件的名字
N=length(dir('*jpg'));%读取文件个数
delaytimeN=0.8;%动图的间隔时间
%切割图片
for i=1:N
    Img=imread([num2str(i),'.jpg']);
    figure(i)
    imshow(Img,'Border','tight'); %添加后面两个属性可以去掉灰边，似乎可以通过set(gcf,'color','white')不过这是填充颜色，不是切
    frame=getframe(i);
    im=frame2im(frame);%制作gif文件→必须是index索引图像
    [I,map]=rgb2ind(im,256);
    k=i;
    if k==1;
        imwrite(I,map,filename,'gif','Loopcount',inf,...
            'DelayTime',delaytimeN);%loopcount只是在i==1的时候才有用
    else
        imwrite(I,map,filename,'gif','WriteMode','append',...
            'DelayTime',delaytimeN);%?layTime用于设置gif文件的播放快慢
    end
    close all
end

