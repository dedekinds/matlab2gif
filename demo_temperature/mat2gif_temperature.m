clear
filename= 'result.gif'; %����gif�ļ�������
N=length(dir('*jpg'));%��ȡ�ļ�����
delaytimeN=0.8;%��ͼ�ļ��ʱ��
%�и�ͼƬ
for i=1:N
    Img=imread([num2str(i),'.jpg']);
    figure(i)
    imshow(Img,'Border','tight'); %��Ӻ����������Կ���ȥ���ұߣ��ƺ�����ͨ��set(gcf,'color','white')�������������ɫ��������
    frame=getframe(i);
    im=frame2im(frame);%����gif�ļ���������index����ͼ��
    [I,map]=rgb2ind(im,256);
    k=i;
    if k==1;
        imwrite(I,map,filename,'gif','Loopcount',inf,...
            'DelayTime',delaytimeN);%loopcountֻ����i==1��ʱ�������
    else
        imwrite(I,map,filename,'gif','WriteMode','append',...
            'DelayTime',delaytimeN);%?layTime��������gif�ļ��Ĳ��ſ���
    end
    close all
end

