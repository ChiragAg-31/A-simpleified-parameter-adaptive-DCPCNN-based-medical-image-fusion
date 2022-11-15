
%MATLAB code for the paper "A Simplified Parameter Adaptive DCPCNN Based
%Medical Image Fusion", written by Mr. Chirag Agrawal

%If you use this code, Please cite the paper, "Chirag Agrawal, Sujit Kumar Yadav, 
%Shreyaskar Pratap Singh, and Chinmaya Panigrahy. "A Simplified Parameter 
%Adaptive DCPCNN Based Medical Image Fusion." In Proceedings of International Conference on 
%Communication and Artificial Intelligence, pp. 489-501. Springer, Singapore, 2022."

 clear all
 P=imread('MRI.png');
 Q=imread('PET.png');

  if size(Q,3)==3       % For MRI-PET or MRI-SPECT Image Fusion
        tic
        P=double(P)/255;
        Q=double(Q)/255;
        Q_YUV=ConvertRGBtoYUV(Q);
        Q_Y=Q_YUV(:,:,1);
        [hei, wid]=size(P);
        F_Y=FUSION_NSST_ABS_SPADCPCNN(P,Q_Y);  % Performing Image Fusion
        F_YUV=zeros(hei,wid,3);
        F_YUV(:,:,1)=F_Y;
        F_YUV(:,:,2)=Q_YUV(:,:,2);
        F_YUV(:,:,3)=Q_YUV(:,:,3);
        F=ConvertYUVtoRGB(F_YUV);
        F=uint8(F*255);
        toc
        figure, imshow(F)          
  else                       % For Medical Image Fusion where both the source images are gray-scale                       
        tic
        P=double(P)/255;
        Q=double(Q)/255;
        F=FUSION_NSST_ABS_SPADCPCNN(P,Q);   % Performing Image Fusion
        F=uint8(F*255);
        toc
        figure, imshow(F) 
  end
       
   

         

