mri=uint8(zeros(128,128,1,6));
for frame=1:6
[mri(:,:,:,frame),map]=imread('mri.tif',frame); %��ÿһ֡�����ڴ���
end
montage(mri,map);
