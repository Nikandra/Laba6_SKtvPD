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

% Last Modified by GUIDE v2.5 19-Nov-2016 13:19:02

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
% uiwait(handles.figure1);


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
% передаем фокус области ввода Left
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

% передаем фокус области ввода Right
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


% делаем кнопку  Plot доступной
set(handles.btnPlot, 'Enable', 'on')
% передаем фокус кнопке Plot
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


% записываем строку с формулой в строковую переменную fun
fun = get(handles.edtFunction, 'String');
% получаем содержимое области ввода Left, преобразуем в число 
% и заносим в переменную Left
Left = str2num(get(handles.edtLeft, 'String'))
% получаем содержимое области ввода Right, преобразуем в число 
% и заносим в переменную Right
Right = str2num(get(handles.edtRight, 'String'))
% вызываем fplot  для построения графика функции
fplot(fun, [Left Right])
% делаем доступной кнопку Clear
set(handles.btnClear , 'Enable', 'on')
% передаем фокус области ввода Function
uicontrol(handles.edtFunction) 


% --- Executes on button press in btnClear.
function btnClear_Callback(hObject, eventdata, handles)
% hObject    handle to btnClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% очистка осей
cla
% удаление  содержимого  областей ввода
set(handles.edtFunction,  'String',  '')
set(handles.edtLeft,  'String',   '')
set(handles.edtRight,  'String',   '')
% делаем кнопки Plot и Clear  недоступными
set(handles.btnClear,  'Enable',   'off')
set(handles.btnPlot,  'Enable',   'off')
% передаем  фокус  области ввода  Function
uicontrol(handles.edtFunction)
