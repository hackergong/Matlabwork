clear all;
X = uint8([ 254 12 76; 46 226 106]);
Y = uint8([ 200 56 56; 56 56 56 ]);
Z1 = imsubtract(X,Y)                  %ͼ�����
Z2 = imabsdiff(X,Y)                  %ȡ����ֵ
