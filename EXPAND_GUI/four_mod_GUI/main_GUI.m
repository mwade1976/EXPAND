function varargout = main_GUI(varargin)
% MAIN_GUI MATLAB code for main_GUI.fig
%      MAIN_GUI, by itself, creates a new MAIN_GUI or raises the existing
%      singleton*.
%
%      H = MAIN_GUI returns the handle to a new MAIN_GUI or the handle to
%      the existing singleton*.
%
%      MAIN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_GUI.M with the given input arguments.
%
%      MAIN_GUI('Property','Value',...) creates a new MAIN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_GUI

% Last Modified by GUIDE v2.5 09-Jul-2015 13:48:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @main_GUI_OutputFcn, ...
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


% --- Executes just before main_GUI is made visible.
function main_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_GUI (see VARARGIN)

%reset the plots
axes(handles.solutionplot);
cla reset
axes(handles.trajectoryplot);
cla reset

xlabel(handles.solutionplot,'Time (days)')
ylabel(handles.solutionplot,'Concentration (kgCOD m^{-3})')

xlabel(handles.trajectoryplot,'X_p')
ylabel(handles.trajectoryplot,'X_H')

%reset all of the values
    set(handles.growthmenu,'Value',1);
    set(handles.kmp_in,'String',13);
    set(handles.yp_in,'String',0.04);
    set(handles.kdecp_in,'String',0.02);
    set(handles.kmh_in,'String',35);
    set(handles.yh_in,'String',0.06);
    set(handles.kdech_in,'String',0.02);
    set(handles.spin_in,'String',5);
    set(handles.kih_in,'String',0.0000035);
    set(handles.ksp_in,'String',0.3);
    set(handles.ksh_in,'String',0.000025);
    set(handles.ksxp_in,'String',3);
    set(handles.ksxh_in,'String',2);
    set(handles.d_in,'String',0.1);
    set(handles.time_in,'String',1000);
    set(handles.sp_init,'String',0.1);
    set(handles.xp_init,'String',0.1);
    set(handles.sh_init,'String',0.1);
    set(handles.xh_init,'String',0.1);
    set(handles.fixed_points_sp,'String','-');
    set(handles.fixed_points_xp,'String','-');
    set(handles.fixed_points_sh,'String','-');
    set(handles.fixed_points_xh,'String','-');
    set(handles.fixed_points_stability,'String','-');
    
% Choose default command line output for main_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function xp_init_Callback(hObject, eventdata, handles)
% hObject    handle to xp_init (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xp_init as text
Xp_init=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function xp_init_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xp_init (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xh_init_Callback(hObject, eventdata, handles)
% hObject    handle to xh0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xh0 as text
XH_init=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function xh_init_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xh0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sp_init_Callback(hObject, eventdata, handles)
% hObject    handle to sp_init (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sp_init as text
Sp_init=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function sp_init_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sp_init (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sh_init_Callback(hObject, eventdata, handles)
% hObject    handle to sh_init (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sh_init as text
SH_init=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function sh_init_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sh_init (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in growthmenu.
function growthmenu_Callback(hObject, eventdata, handles)
% hObject    handle to growthmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

contents = cellstr(get(hObject,'String'));
fun_choice=contents{get(hObject,'Value')};

% --- Executes during object creation, after setting all properties.
function growthmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to growthmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function kmp_in_Callback(hObject, eventdata, handles)
% hObject    handle to kmp_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kmp_in as text
kmp1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function kmp_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kmp_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yp_in_Callback(hObject, eventdata, handles)
% hObject    handle to yp_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yp_in as text
Yp1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function yp_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yp_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kdecp_in_Callback(hObject, eventdata, handles)
% hObject    handle to kdecp_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kdecp_in as text
kdecp1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function kdecp_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kdecp_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kmh_in_Callback(hObject, eventdata, handles)
% hObject    handle to kmh_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kmh_in as text
kmH1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function kmh_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kmh_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yh_in_Callback(hObject, eventdata, handles)
% hObject    handle to yh_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yh_in as text
YH1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function yh_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yh_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kdech_in_Callback(hObject, eventdata, handles)
% hObject    handle to kdech_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kdech_in as text
kdecH1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function kdech_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kdech_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kih_in_Callback(hObject, eventdata, handles)
% hObject    handle to kih_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kih_in as text
KIH1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function kih_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kih_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ksp_in_Callback(hObject, eventdata, handles)
% hObject    handle to ksp_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ksp_in as text
Ksp1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function ksp_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ksp_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ksh_in_Callback(hObject, eventdata, handles)
% hObject    handle to ksh_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ksh_in as text
ksH1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function ksh_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ksh_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ksxp_in_Callback(hObject, eventdata, handles)
% hObject    handle to ksxp_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ksxp_in as text
Ksxp1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function ksxp_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ksxp_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ksxh_in_Callback(hObject, eventdata, handles)
% hObject    handle to ksxh_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ksxh_in as text
KsxH1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function ksxh_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ksxh_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_in_Callback(hObject, eventdata, handles)
% hObject    handle to d_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d_in as text
D1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function d_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function spin_in_Callback(hObject, eventdata, handles)
% hObject    handle to spin_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of spin_in as text
Spin1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function spin_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to spin_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function time_in_Callback(hObject, eventdata, handles)
% hObject    handle to time_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time_in as text
time1=str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function time_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in sp_check.
function sp_check_Callback(hObject, eventdata, handles)
% hObject    handle to sp_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sp_check=get(hObject,'Value');


% --- Executes on button press in xp_check.
function xp_check_Callback(hObject, eventdata, handles)
% hObject    handle to xp_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

xp_check=get(hObject,'Value');


% --- Executes on button press in sh_check.
function sh_check_Callback(hObject, eventdata, handles)
% hObject    handle to sh_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sh_check=get(hObject,'Value');


% --- Executes on button press in xh_check.
function xh_check_Callback(hObject, eventdata, handles)
% hObject    handle to xh_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

xh_check=get(hObject,'Value');


% --- Executes on button press in overlay.
function overlay_Callback(hObject, eventdata, handles)
% hObject    handle to overlay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

multi=get(hObject,'Value');


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get user input
fun_choice=get(handles.growthmenu,'Value');

kmp1 = str2double(get(handles.kmp_in,'String'));
        if kmp1<0
            set(handles.kmp_in,'String',13);
            kmp1 = str2double(get(handles.kmp_in,'String'));
            msgbox('The value entered for kmp(>0) was not valid so the default value was reset','Error','error')
        else
        end
Yp1 = str2double(get(handles.yp_in,'String'));
        if Yp1<0
            set(handles.yp_in,'String',0.04);
            Yp1 = str2double(get(handles.yp_in,'String'));
            msgbox('The value entered for Yp1(>0) was not valid so the default value was reset','Error','error')
        else
        end
kdecp1 = str2double(get(handles.kdecp_in,'String'));
        if kdecp1<0 || kdecp1>1
            set(handles.kdecp_in,'String',0.02);
            kdecp1 = str2double(get(handles.kdecp_in,'String'));
            msgbox('The value entered for (0<)kdecp(<1) was not valid so the default value was reset','Error','error')
        else
        end
kmH1 = str2double(get(handles.kmh_in,'String'));
        if kmH1<0
            set(handles.kmh_in,'String',35);
            kmH1 = str2double(get(handles.kmh_in,'String'));
            msgbox('The value entered for kmH(>0) was not valid so the default value was reset','Error','error')
        else
        end
YH1 = str2double(get(handles.yh_in,'String'));
        if YH1<0
            set(handles.yh_in,'String',0.06);
            YH1 = str2double(get(handles.yh_in,'String'));
            msgbox('The value entered for YH(>0) was not valid so the default value was reset','Error','error')
        else
        end
kdecH1 = str2double(get(handles.kdech_in,'String'));
        if kdecH1<0 || kdecH1>1
            set(handles.kdech_in,'String',0.02);
            kdecH1 = str2double(get(handles.kdech_in,'String'));
            msgbox('The value entered for (0<)kdecH(<1) was not valid so the default value was reset','Error','error')
        else
        end
Spin1 = str2double(get(handles.spin_in,'String'));
        if Spin1<0
            set(handles.spin_in,'String',5);
            Spin1 = str2double(get(handles.spin_in,'String'));
            msgbox('The value entered for Sp_in(>0) was not valid so the default value was reset','Error','error')
        else
        end
KIH1 = str2double(get(handles.kih_in,'String'));
        if KIH1<0
            set(handles.kih_in,'String',0.0000035);
            KIH1 = str2double(get(handles.kih_in,'String'));
            msgbox('The value entered for KIH(>0) was not valid so the default value was reset','Error','error')
        else
        end
Ksp1 = str2double(get(handles.ksp_in,'String'));
        if Ksp1<0
            set(handles.ksp_in,'String',0.3);
            Ksp1 = str2double(get(handles.ksp_in,'String'));
            msgbox('The value entered for Ksp(>0) was not valid so the default value was reset','Error','error')
        else
        end
KsH1 = str2double(get(handles.ksh_in,'String'));
        if KsH1<0
            set(handles.ksh_in,'String',0.000025);
            KsH1 = str2double(get(handles.ksh_in,'String'));
            msgbox('The value entered for KsH(>0) was not valid so the default value was reset','Error','error')
        else
        end
Ksxp1 = str2double(get(handles.ksxp_in,'String'));
        if Ksxp1<0
            set(handles.ksxp_in,'String',3);
            Ksxp1 = str2double(get(handles.ksxp_in,'String'));
            msgbox('The value entered for Ksxp was not valid so the default value was reset','Error','error')
        else
        end
KsxH1 = str2double(get(handles.ksxh_in,'String'));
        if KsxH1<0
            set(handles.ksxh_in,'String',2);
            KsxH1 = str2double(get(handles.ksxh_in,'String'));
            msgbox('The value entered for KsxH was not valid so the default value was reset','Error','error')
        else
        end
D1 = str2double(get(handles.d_in,'String'));
        if D1<0
            set(handles.d_in,'String',0.1);
            D1 = str2double(get(handles.d_in,'String'));
            msgbox('The value entered for dilution(>0) was not valid so the default value was reset','Error','error')
        else
        end
time1 = str2double(get(handles.time_in,'String'));
        if time1<0
            set(handles.time_in,'String',1000);
            time1 = str2double(get(handles.time_in,'String'));
            msgbox('The value entered for time(>0) was not valid so the default value was reset','Error','error')
        else
        end

Sp_init=str2double(get(handles.sp_init,'String'));
        if Sp_init<0
            set(handles.sp_init,'String',0.1);
            Sp_init=str2double(get(handles.sp_init,'String'));
            msgbox('The value entered for Sp_init was not valid so the default values were reset','Error','error')
        else
        end
Xp_init=str2double(get(handles.xp_init,'String'));
        if Xp_init<0
            set(handles.xp_init,'String',0.1);
            Xp_init=str2double(get(handles.xp_init,'String'));
            msgbox('The value entered for Xp_init was not valid so the default values were reset','Error','error')
        else
        end
SH_init=str2double(get(handles.sh_init,'String'));
        if SH_init<0
            set(handles.sh_init,'String',0.1);
            SH_init=str2double(get(handles.sh_init,'String'));
            msgbox('The value entered for SH_init was not valid so the default values were reset','Error','error')
        else
        end
XH_init=str2double(get(handles.xh_init,'String'));
        if XH_init<0
            set(handles.xh_init,'String',0.1);
            XH_init=str2double(get(handles.xh_init,'String'));
            msgbox('The value entered for XH_init was not valid so the default values were reset','Error','error')
        else
        end
        
sp_check=get(handles.sp_check,'Value');
xp_check=get(handles.xp_check,'Value');
sh_check=get(handles.sh_check,'Value');
xh_check=get(handles.xh_check,'Value');
        
        
run_script_gui;


% --- Executes on button press in basin.
function basin_Callback(hObject, eventdata, handles)
% hObject    handle to basin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
basin_of_attraction_gui


function fixed_points_Callback(hObject, eventdata, handles)
% hObject    handle to fixed_points_sp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fixed_points_sp as text
%        str2double(get(hObject,'String')) returns contents of fixed_points_sp as a double


% --- Executes during object creation, after setting all properties.
function fixed_points_sp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fixed_points_sp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf)
 main_GUI


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf)


% --- Executes on button press in reset_values.
function reset_values_Callback(hObject, eventdata, handles)
% hObject    handle to reset_values (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%reset all of the values
    set(handles.kmp_in,'String',13);
    set(handles.yp_in,'String',0.04);
    set(handles.kdecp_in,'String',0.02);
    set(handles.kmh_in,'String',35);
    set(handles.yh_in,'String',0.06);
    set(handles.kdech_in,'String',0.02);
    set(handles.spin_in,'String',5);
    set(handles.kih_in,'String',0.0000035);
    set(handles.ksp_in,'String',0.3);
    set(handles.ksh_in,'String',0.000025);
    set(handles.ksxp_in,'String',3);
    set(handles.ksxh_in,'String',2);
    set(handles.d_in,'String',0.1);
    set(handles.time_in,'String',1000);
    set(handles.sp_init,'String',0.1);
    set(handles.xp_init,'String',0.1);
    set(handles.sh_init,'String',0.1);
    set(handles.xh_init,'String',0.1);
