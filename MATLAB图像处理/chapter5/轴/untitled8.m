function varargout = untitled8(varargin)
% UNTITLED8 MATLAB code for untitled8.fig
%      UNTITLED8, by itself, creates a new UNTITLED8 or raises the existing
%      singleton*.
%
%      H = UNTITLED8 returns the handle to a new UNTITLED8 or the handle to
%      the existing singleton*.
%
%      UNTITLED8('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED8.M with the given input arguments.
%
%      UNTITLED8('Property','Value',...) creates a new UNTITLED8 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled8_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled8_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled8

% Last Modified by GUIDE v2.5 12-Jul-2016 17:05:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled8_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled8_OutputFcn, ...
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


% --- Executes just before untitled8 is made visible.
function untitled8_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled8 (see VARARGIN)

% Choose default command line output for untitled8
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled8 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled8_OutputFcn(hObject, eventdata, handles) 
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
warning off
im = imread('11.jpg');
axes(handles.axes1)
imshow(im)
