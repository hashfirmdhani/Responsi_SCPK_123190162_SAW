function varargout = ResponsiSAW_123190162_HashfiRamadhani(varargin)
% RESPONSISAW_123190162_HASHFIRAMADHANI MATLAB code for ResponsiSAW_123190162_HashfiRamadhani.fig
%      RESPONSISAW_123190162_HASHFIRAMADHANI, by itself, creates a new RESPONSISAW_123190162_HASHFIRAMADHANI or raises the existing
%      singleton*.
%
%      H = RESPONSISAW_123190162_HASHFIRAMADHANI returns the handle to a new RESPONSISAW_123190162_HASHFIRAMADHANI or the handle to
%      the existing singleton*.
%
%      RESPONSISAW_123190162_HASHFIRAMADHANI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPONSISAW_123190162_HASHFIRAMADHANI.M with the given input arguments.
%
%      RESPONSISAW_123190162_HASHFIRAMADHANI('Property','Value',...) creates a new RESPONSISAW_123190162_HASHFIRAMADHANI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ResponsiSAW_123190162_HashfiRamadhani_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ResponsiSAW_123190162_HashfiRamadhani_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ResponsiSAW_123190162_HashfiRamadhani

% Last Modified by GUIDE v2.5 26-Jun-2021 12:31:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ResponsiSAW_123190162_HashfiRamadhani_OpeningFcn, ...
                   'gui_OutputFcn',  @ResponsiSAW_123190162_HashfiRamadhani_OutputFcn, ...
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


% --- Executes just before ResponsiSAW_123190162_HashfiRamadhani is made visible.
function ResponsiSAW_123190162_HashfiRamadhani_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ResponsiSAW_123190162_HashfiRamadhani (see VARARGIN)

% Choose default command line output for ResponsiSAW_123190162_HashfiRamadhani
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ResponsiSAW_123190162_HashfiRamadhani wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ResponsiSAW_123190162_HashfiRamadhani_OutputFcn(hObject, eventdata, handles) 
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
opts = detectImportOptions('DATA_RUMAH.xlsx');
opts.SelectedVariableNames = {'NO','HARGA','LB','LT','KT','KM','GRS'};
%pilih data dari .xlsx untuk kolom NO, HARGA, LB, LT, KT, KM, GRS
data = readmatrix('DATA_RUMAH.xlsx', opts);
set(handles.uitable1,'data',data); %menampilkan data ke uitable1

x=data(:,2:7); 
no = data(:,1); %matriks no yang berisi data kolom 1 (No Rumah)
k=[0,1,1,1,1,1]; %atribut tiap-tiap kriteria
w=[0.3,0.2,0.23,0.1,0.07,0.1]; %Nilai bobot tiap kriteria 
[m n]=size (x); 
R=zeros (m,n); 
Y=zeros (m,n);
for j=1:n,
    if k(j)==1,
        R(:,j)=x(:,j)./max(x(:,j));
    else
        R(:,j)=min(x(:,j))./x(:,j);
    end;
end;
for i=1:m,
    V(i)= sum(w.*R(i,:))
    hasil(i) = [V(i)]; %menyimpan hasil perhitungan ke variabel hasil
end;

r = reshape(hasil,[1010,1]); %menukar baris dan kolom
a = [no r]; %matriks a = gabungan matriks no dan r
p = sortrows(a, 2, 'descend') 
%mengurutkan matriks a menggunakan kolom 2 secara descending

set(handles.uitable2, 'data', p(1:20,:)); 


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
