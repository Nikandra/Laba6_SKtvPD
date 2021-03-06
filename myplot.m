
function varargout = myplot(varargin)
% MYPLOT MATLAB code for myplot.fig
%      MYPLOT, by itself, creates a new MYPLOT or raises the existing
%      singleton*.
%
%      H = MYPLOT returns the handle to a new MYPLOT or the handle to
%      the existing singleton*.
%
%      MYPLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYPLOT.M with the given input arguments.
%
%      MYPLOT('Property','Value',...) creates a new MYPLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myplot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myplot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myplot

% Last Modified by GUIDE v2.5 19-Nov-2016 22:24:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myplot_OpeningFcn, ...
                   'gui_OutputFcn',  @myplot_OutputFcn, ...
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


% --- Executes just before myplot is made visible.
function myplot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myplot (see VARARGIN)

% Choose default command line output for myplot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes myplot wait for user response (see UIRESUME)
% uiwait(handles.x2);


% --- Outputs from this function are returned to the command line.
function varargout = myplot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edtFunction_Callback(hObject, eventdata, handles)
% hObject    handle to edtFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtFunction as text
%        str2double(get(hObject,'String')) returns contents of edtFunction as a double


% --- Executes during object creation, after setting all properties.
% �������� ����� ������� ����� Left
uicontrol(handles.edtLeft)




function edtFunction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edtLeft_Callback(hObject, eventdata, handles)
% hObject    handle to edtLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtLeft as text
%        str2double(get(hObject,'String')) returns contents of edtLeft as a double


% --- Executes during object creation, after setting all properties.

% �������� ����� ������� ����� Right
uicontrol(handles.edtRight)




function edtLeft_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtLeft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtRight_Callback(hObject, eventdata, handles)
% hObject    handle to edtRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtRight as text
%        str2double(get(hObject,'String')) returns contents of edtRight as a double


% --- Executes during object creation, after setting all properties.


% ������ ������  Plot ���������
set(handles.btnPlot, 'Enable', 'on')
% �������� ����� ������ Plot
uicontrol(handles.btnPlot) 



function edtRight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnPlot.
function btnPlot_Callback(hObject, eventdata, handles)
% hObject    handle to btnPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ���������� ������ � �������� � ��������� ���������� fun
fun = get(handles.edtFunction, 'String');
% �������� ���������� ������� ����� Left, ����������� � ����� 
% � ������� � ���������� Left
Left = str2num(get(handles.edtLeft, 'String'))
% �������� ���������� ������� ����� Right, ����������� � ����� 
% � ������� � ���������� Right
Right = str2num(get(handles.edtRight, 'String'))
% �������� fplot  ��� ���������� ������� �������
fplot(fun, [Left Right])
% ������ ��������� ������ Clear
set(handles.btnClear , 'Enable', 'on')
% �������� ����� ������� ����� Function
uicontrol(handles.edtFunction) 


% --- Executes on button press in btnClear.
function btnClear_Callback(hObject, eventdata, handles)
% hObject    handle to btnClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ������� ����
cla
% ��������  �����������  �������� �����
set(handles.edtFunction,  'String',  '')
set(handles.edtLeft,  'String',   '')
set(handles.edtRight,  'String',   '')
% ������ ������ Plot � Clear  ������������
set(handles.btnClear,  'Enable',   'off')
set(handles.btnPlot,  'Enable',   'off')
% ��������  �����  ������� �����  Function
uicontrol(handles.edtFunction)


% --- Executes on button press in pendulum.
function pendulum_Callback(hObject, eventdata, handles)
% hObject    handle to pendulum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function MyFunction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MyFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function myplotgui
% �������� ������������ ���� � ���������� myplotgui � ��� ������� Figure 1 
hF = figure('Name', 'myplotgui', 'NumberTitle', 'off');
% �������� ���� 
hA = axes('Position', [0.1 0.2 0.8 0.7]); 
% �������� ������ � ������� �������� Callback �������� ��������� �� ���������� 
hBtnPlot = uicontrol('Style', 'pushbutton', ...      
    'Position', [20 20 120 30],...     
    'String', 'Plot',...     
    'Callback', @BtnPlotCallback); 
function BtnPlotCallback(src,evt) 
% ���������� ��������� ������� Callback ������ Plot 
surf(peaks(30)) 

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%[t,x]=ode45(@MyFunction,[0 tmax1],x0); % ��������� �������������� �������

myfun = get(handles.MyFunction, 'String');

tmax = str2num(get(handles.tmax, 'String'))
x1 = str2num(get(handles.x1, 'String'))
x2 = str2num(get(handles.x2, 'String'))
x3 = str2num(get(handles.x3, 'String'))

%[t,x]=ode45('pendulum_alex1',[0 tmax],[x1 x2 x3]);
[t,x]=ode45('myfun',[0 tmax],[x1 x2 x3]);

plot3(x(:,1),x(:,2),x(:,3),'b');


sub1 = subplot(1,1,1, 'Parent',handles.Panel1);
plot3(sub1,x(:,1),x(:,2),x(:,3),'b');







function tmax_Callback(hObject, eventdata, handles)
% hObject    handle to tmax1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tmax1 as text
%        str2double(get(hObject,'String')) returns contents of tmax1 as a double


% --- Executes during object creation, after setting all properties.
function tmax1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tmax1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x1_Callback(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1 as text
%        str2double(get(hObject,'String')) returns contents of x1 as a double


% --- Executes during object creation, after setting all properties.
function x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2_Callback(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x2 as text
%        str2double(get(hObject,'String')) returns contents of x2 as a double


% --- Executes during object creation, after setting all properties.
function x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x3_Callback(hObject, eventdata, handles)
% hObject    handle to x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x3 as text
%        str2double(get(hObject,'String')) returns contents of x3 as a double


% --- Executes during object creation, after setting all properties.
function x3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
