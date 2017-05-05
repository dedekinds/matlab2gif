clear
filename= 'result.gif'; %命名gif文件的名字
%%
%你要输入的参数：（不包括切割，以后要是做GUI的话还是要的）
delaytimeN=0.8;                %动图的间隔时间
typeimg='png';                 %图片类型
N=length(dir(['*',typeimg]));  %读取文件个数
%%
%切割图片
%用画图打开图片，吸管工具可以获取图片的某点的像素位置
%假设截取的是长方形，那么左上角的点坐标设为x_1,y_1,右下角的点设为x_2,y_2
x_1=976;
y_1=151;
x_2=1467;
y_2=845;
%那么下面的图片每个都用B=A(y_1:y_2,x_1:x_2,:)
%%
for i=1:N
    Imgtemp=imread([num2str(i),'.',typeimg]);
    Img=Imgtemp(y_1:y_2,x_1:x_2,:);
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
