clear
filename= 'result.gif'; %����gif�ļ�������
%%
%��Ҫ����Ĳ��������������и�Ժ�Ҫ����GUI�Ļ�����Ҫ�ģ�
delaytimeN=0.8;                %��ͼ�ļ��ʱ��
typeimg='png';                 %ͼƬ����
N=length(dir(['*',typeimg]));  %��ȡ�ļ�����
%%
%�и�ͼƬ
%�û�ͼ��ͼƬ�����ܹ��߿��Ի�ȡͼƬ��ĳ�������λ��
%�����ȡ���ǳ����Σ���ô���Ͻǵĵ�������Ϊx_1,y_1,���½ǵĵ���Ϊx_2,y_2
x_1=976;
y_1=151;
x_2=1467;
y_2=845;
%��ô�����ͼƬÿ������B=A(y_1:y_2,x_1:x_2,:)
%%
for i=1:N
    Imgtemp=imread([num2str(i),'.',typeimg]);
    Img=Imgtemp(y_1:y_2,x_1:x_2,:);
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
