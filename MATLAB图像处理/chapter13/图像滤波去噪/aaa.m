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

% Last Modified by GUIDE v2.5 11-Jul-2016 14:38:54

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
clc,clear,close all

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
[filename,pathname]=uigetfile({'*.bmp';'*.jpg';'*.tif'},'选择图片');
str=[pathname,filename];
im=imread(str);
axes(handles.axes1);
imshow(im)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im_noise
im_noise=imnoise(im,'salt & pepper',0.05);%加入椒盐噪声
axes(handles.axes2);
imshow(im_noise)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im_noise im_filter
n=size(size(im_noise));
if n(1,2)==2
    im_filter=medfilt2(im_noise,[3,2]);
else
    im_filter1=medfilt2(im_noise(:,:,1),[3,2]);
    im_filter2=medfilt2(im_noise(:,:,2),[3,2]);
    im_filter3=medfilt2(im_noise(:,:,3),[3,2]);
    im_filter=cat(3,im_filter1,im_filter2,im_filter3);
end
axes(handles.axes2);
imshow(im_filter)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im im_noise im_filter
[Path] = uigetdir('','保存增强后的图像'); % 修正后的图像路劲
imwrite(uint8(im_filter),strcat(Path,'\','pic_correct.bmp'),'bmp');
