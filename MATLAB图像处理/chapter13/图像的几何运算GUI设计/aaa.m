function varargout = aaa(varargin)
% AAA MATLAB code for aaa.fig
%      AAA, by itself, creates a new AAA or raises the existing
%      singleton*.
%
%      H = AAA returns the handle to a new AAA or the handle to
%      the existing singleton*.
%
%      AAA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AAA.M with the given input arguments.
%
%      AAA('Property','Value',...) creates a new AAA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before aaa_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to aaa_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help aaa

% Last Modified by GUIDE v2.5 11-Jul-2016 19:46:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @aaa_OpeningFcn, ...
                   'gui_OutputFcn',  @aaa_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before aaa is made visible.
function aaa_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to aaa (see VARARGIN)

% Choose default command line output for aaa
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes aaa wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = aaa_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
[filename,pathname]=uigetfile({'*.jpg';'*.bmp';'*.tif'},'选择图片');
str=[pathname,filename];
im=imread(str);
axes(handles.axes1);
imshow(im)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im1 = imcrop();
axes(handles.axes2);
imshow(im1)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im2 = im(end:-1:1,:,:);

axes(handles.axes2);
imshow(im2)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im3 = im(:,end:-1:1,:);

axes(handles.axes2);
imshow(im3)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im4 = im(end:-1:1,end:-1:1,:);

axes(handles.axes2);
imshow(im4)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
if size(im,3)==1
    im5 = medfilt2(im,[3,2]);
else
    im51=medfilt2(im(:,:,1),[3,2]);
    im52=medfilt2(im(:,:,2),[3,2]);
    im53=medfilt2(im(:,:,3),[3,2]);
    im5 = cat(3,im51,im52,im53);
end

axes(handles.axes2);
imshow(im5)

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
img = im;
img_1=img(:,:,1);  % R
img_2=img(:,:,2);  % G
img_3=img(:,:,3);  % B
Y=0.299*img_1+0.587*img_2+0.114*img_3;  % 白平衡系数
[m,n]=size(Y);
k=Y(1,1);
for i=1:m
    for j=1:n
        if Y(i,j)>=k    % 判断比较
            k=Y(i,j);
            k1=i;    % 保存角标
            k2=j;    % 保存角标
        end
    end
end
[m1,n1]=find(Y==k);
Rave=sum(sum(img_1));    % 求和
Rave=Rave/(m*n);         % 比例系数
Gave=sum(sum(img_2));    % 求和
Gave=Gave/(m*n);
Bave=sum(sum(img_3));    % 求和
Bave=Bave/(m*n);
Kave=(Rave+Gave+Bave)/3;   % 求均值
img_1=(Kave/Rave)*img_1;    % 重构R通道
img_2=(Kave/Gave)*img_2;    % 重构G通道
img_3=(Kave/Bave)*img_3;    % 重构B通道
imgysw=cat(3,img_1,img_2,img_3);

axes(handles.axes2);
imshow(imgysw)
