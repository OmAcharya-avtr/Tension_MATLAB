function varargout = TO_Data_Logger(varargin)
% TO_DATA_LOGGER MATLAB code for TO_Data_Logger.fig
%      TO_DATA_LOGGER, by itself, creates a new TO_DATA_LOGGER or raises the existing
%      singleton*.
%
%      H = TO_DATA_LOGGER returns the handle to a new TO_DATA_LOGGER or the handle to
%      the existing singleton*.
%
%      TO_DATA_LOGGER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TO_DATA_LOGGER.M with the given input arguments.
%
%      TO_DATA_LOGGER('Property','Value',...) creates a new TO_DATA_LOGGER or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TO_Data_Logger_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TO_Data_Logger_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TO_Data_Logger

% Last Modified by GUIDE v2.5 17-Jul-2019 12:19:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TO_Data_Logger_OpeningFcn, ...
                   'gui_OutputFcn',  @TO_Data_Logger_OutputFcn, ...
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

% --- Executes just before TO_Data_Logger is made visible.
function TO_Data_Logger_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TO_Data_Logger (see VARARGIN)

% Choose default command line output for TO_Data_Logger
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes TO_Data_Logger wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TO_Data_Logger_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function edit_load_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_load_Callback(hObject, eventdata, handles)
% hObject    handle to edit_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_load as text
%        str2double(get(hObject,'String')) returns contents of edit_load as a double




% --- Executes during object creation, after setting all properties.
function edit_strain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_strain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_strain_Callback(hObject, eventdata, handles)
% hObject    handle to edit_strain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_strain as text
%        str2double(get(hObject,'String')) returns contents of edit_strain as a double

if isnan(volume)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new edit_strain value

guidata(hObject,handles)

% --- Executes on button press in button_Clear_Graph.
function button_Clear_Graph_Callback(hObject, eventdata, handles)
% hObject    handle to button_Clear_Graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.plotX=0;
handles.plotY=0;
handles.np_plot=0;
cla(handles.axes1);
guidata(handles.figure1, handles);


% --- Executes on button press in button_write_data.
function button_write_data_Callback(hObject, eventdata, handles)
% hObject    handle to button_write_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
test=0;
data_to_log=handles.logXYZ;
fname=get(handles.edit6,'String');
save(fname,'data_to_log','-ascii');


% --- Executes on button press in button_clear_log.
function button_clear_log_Callback(hObject, eventdata, handles)
% hObject    handle to button_clear_log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.logXYZ=[0 0 0 0 0 0];
handles.np_log=0;
guidata(handles.figure1, handles);



% --- Executes when selected object changed in unitgroup.
function unitgroup_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in unitgroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the button_write_data flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to button_write_data the data.
%old version
% % % % set(handles.axes1,'ylim',[0 60000]);
% % % % ylabel(handles.axes1,'Load (lbf)');
% % % % set(handles.axes1,'xlim',[0 1]);
% % % % xlabel(handles.axes1,'Displacement (in)');
% % % % handles.plotX=0;
% % % % handles.plotY=0;
% % % % handles.np_plot=0;
% % % % handles.logXYZ=[0 0 0 0 0 0];
% % % % handles.np_log=0;
% % % % 
% % % % %Open Serial Port
% % % % out=instrfind;
% % % % temp=get(out);
% % % % if (isfield(temp,'Type')== 0)
% % % % serialport = serial(['COM11']);
% % % % set(serialport,'BaudRate',250000);
% % % % fopen(serialport);
% % % % end
% % % % 
% % % % 
% % % % % Update handles structure
% % % % guidata(handles.figure1, handles);
% New Version
set(handles.axes1,'ylim',[0 60000]);
ylabel(handles.axes1,'Load (lbf)');
set(handles.axes1,'xlim',[0 1]);
xlabel(handles.axes1,'Displacement (in)');
handles.plotX=0;
handles.plotY=0;
handles.np_plot=0;
handles.logXYZ=[0 0 0 0 0 0];
handles.np_log=0;
handles.i_first_plot_point=1; %initialize variable so it will collect two points before plotting.
handles.is_logging=0; %flag to indicate when logging begins

%Open Serial Port
out=instrfind;
temp=get(out);
if (isfield(temp,'Type')== 0)
serialport = serial(['COM11']);
set(serialport,'BaudRate',250000);
fopen(serialport);
end


% Update handles structure
guidata(handles.figure1, handles);


function edit_disp_Callback(hObject, eventdata, handles)
% hObject    handle to edit_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_disp as text
%        str2double(get(hObject,'String')) returns contents of edit_disp as a double


% --- Executes during object creation, after setting all properties.
function edit_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in run_button.
function run_button_Callback(hObject, eventdata, handles)
% hObject    handle to run_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%This should be the main controlling function
%I/O Initialization
%old version
% % % fclose(instrfind);
% % %     serialport = serial(['COM11']);
% % %     set(serialport,'BaudRate',250000);
% % %     fopen(serialport);
% % % i_counter=0;
% % % np_to_plot=handles.np_plot;
% % % x_to_plot=handles.plotX;
% % % y_to_plot=handles.plotY;
% % % np_to_log=handles.np_log;
% % % data_to_log=handles.logXYZ;
% % % x_low=0;
% % % y_low=0;
% % % while(get(hObject,'Value'))
% % %     
% % %     
% % %     
% % % 
% % % 
% % %     i_counter=i_counter+1;
% % %     temp1=get(handles.radio_strain_source,'Value'); %flag for x-axis data source
% % %     temp2=get(handles.radio_function_generator,'Value'); %flag for function generator or TO
% % %     x_limit=str2num(get(handles.edit_x_limit,'String'));
% % %     y_limit=str2num(get(handles.edit_y_limit,'String'));
% % %     
% % %     
% % %     
% % %     
% % %     if(temp2 == 1) %use function generator
% % %         current_y=sin(2*pi()*i_counter/10);
% % %         current_x=i_counter;
% % %         set(handles.edit_load,'String',num2str(current_y));
% % %         set(handles.edit_disp,'String',num2str(current_x));
% % %         x_limit=max(50,current_x);
% % %         y_limit=1;
% % %         y_low=-1;
% % %     else %use TO Output
% % % %         if (get(serialport,'BytesAvailable'))
% % % %             fread(serialport,get(serialport,'BytesAvailable'));
% % % %         end
% % % %         data=0;
% % % %         while(length(data) ~= 3)
% % % %         line=fgetl(serialport);
% % % %         data=[sscanf(line,'%f,%f,%f')];
% % % %         end
% % % 
% % %         a=get_to_point(serialport);
% % %         %[current_Load current_Strain current_Disp]=get_to_point(serialport);
% % %         current_Load=a(1);
% % %         current_Strain=a(2);
% % %         current_Disp=a(3);
% % %         current_y=current_Load;
% % %         if(temp1 == 1) %use strain data
% % %             current_x=current_Strain;
% % %         else
% % %             current_x=current_Disp;
% % %         end
% % %         set(handles.edit_load,'String',num2str(current_Load));
% % %         set(handles.edit_disp,'String',num2str(current_Disp));
% % %         set(handles.edit_strain,'String',num2str(current_Strain));
% % %         
% % %     end
% % %     
% % %     if(get(handles.Plot_button,'Value')) %plot the vector
% % %         np_to_plot=np_to_plot+1;
% % %         x_to_plot(np_to_plot)=current_x;
% % %         y_to_plot(np_to_plot)=current_y;
% % %         plot(handles.axes1,x_to_plot,y_to_plot)
% % %         set(handles.axes1,'xlim',[x_low x_limit]);
% % %         set(handles.axes1,'ylim',[y_low y_limit]);
% % %     end
% % %     
% % %     if(get(handles.Log_button,'Value')) %log the points
% % %         np_to_log=np_to_log+1;
% % %         cur_time=clock;
% % %         hour=cur_time(4);
% % %         min=cur_time(5);
% % %         sec=cur_time(6);
% % %         if(temp2 == 1) %function generator points
% % %             data_to_log(np_to_log,:)=[hour min sec current_x current_y 0];
% % %         else %TO output points
% % %             data_to_log(np_to_log,:)=[hour min sec current_Disp current_Load 0];
% % %         end
% % %     end
% % %     
% % %     pause(0.1);
% % % end
% % % 
% % % handles.np_plot=np_to_plot;
% % % handles.plotX=x_to_plot;
% % % handles.plo   tY=y_to_plot;
% % % handles.np_log=np_to_log;
% % % handles.logXYZ=data_to_log;
% % % guidata(handles.figure1, handles);
% % % fclose(instrfind);
%New version
fclose(instrfind);
    serialport = serial(['COM11']);
    set(serialport,'BaudRate',250000);
    fopen(serialport);
i_counter=0;
np_to_plot=handles.np_plot;
x_to_plot=handles.plotX;
y_to_plot=handles.plotY;
np_to_log=handles.np_log;
data_to_log=handles.logXYZ;
x_low=0;
y_low=0;
while(get(hObject,'Value'))
    
    
    


    i_counter=i_counter+1;
    temp1=get(handles.radio_strain_source,'Value'); %flag for x-axis data source
    temp2=get(handles.radio_function_generator,'Value'); %flag for function generator or TO
    x_limit=str2num(get(handles.edit_x_limit,'String'));
    y_limit=str2num(get(handles.edit_y_limit,'String'));
    
    
    
    
    if(temp2 == 1) %use function generator
        current_y=sin(2*pi()*i_counter/10);
        current_x=i_counter;
        set(handles.edit_load,'String',num2str(current_y));
        set(handles.edit_disp,'String',num2str(current_x));
        x_limit=max(50,current_x);
        y_limit=1;
        y_low=-1;
    else %use TO Output
%         if (get(serialport,'BytesAvailable'))
%             fread(serialport,get(serialport,'BytesAvailable'));
%         end
%         data=0;
%         while(length(data) ~= 3)
%         line=fgetl(serialport);
%         data=[sscanf(line,'%f,%f,%f')];
%         end

        a=get_to_point(serialport);
        %[current_Load current_Strain current_Disp]=get_to_point(serialport);
        current_Load=a(1);
        current_Strain=a(2);
        current_Disp=a(3);
        current_y=current_Load;
        if(temp1 == 1) %use strain data
            current_x=current_Strain;
        else
            current_x=current_Disp;
        end
        set(handles.edit_load,'String',num2str(current_Load));
        set(handles.edit_disp,'String',num2str(current_Disp));
        set(handles.edit_strain,'String',num2str(current_Strain));
        
    end
    
    if(get(handles.Plot_button,'Value')) %plot the vector
        if (handles.i_first_plot_point == 1) %First time plot was requested, so need to cycle through
            x_0=current_x;
            y_0=current_y;
            handles.i_first_plot_point=0;
        else
            x_1=current_x;
            y_1=current_y;
            axes(handles.axes1);
            line([x_0 x_1], [y_0 y_1]);
            x_0=x_1;
            y_0=y_1;
%             np_to_plot=np_to_plot+1;
%         x_to_plot(np_to_plot)=current_x;
%         y_to_plot(np_to_plot)=current_y;
%         plot(handles.axes1,x_to_plot,y_to_plot)
        end
        
        set(handles.axes1,'xlim',[x_low x_limit]);
        set(handles.axes1,'ylim',[y_low y_limit]);
    end
    
    if(get(handles.Log_button,'Value')) %log the points
        %np_to_log=np_to_log+1;
        if (handles.is_logging == 0)
            handles.is_logging=1;
            fname=get(handles.edit6,'String')
            FID=fopen(fname,'a');
        end
        cur_time=clock;
        hour=cur_time(4);
        min=cur_time(5);
        sec=cur_time(6);
        if(temp2 == 1) %function generator points
             fprintf(FID,'%6u %6u %6u %6.2f %6.2f %6u\r\n',[hour min sec current_x current_y 0]);
        else %TO output points
             fprintf(FID,'%6u %6u %6u %6.4f %6.4f %6.4f %6u\r\n',[hour min sec current_Strain current_Disp current_Load 0]);
%             data_to_log(np_to_log,:)=[hour min sec current_Disp current_Load 0];
%         end
        end
    else
        if (handles.is_logging==1)
            handles.is_logging=0;
            fclose(FID);
        end
    end
    
    pause(0.1);
end


handles.is_logging=0;

handles.np_plot=np_to_plot;
handles.plotX=x_to_plot;
handles.plotY=y_to_plot;
handles.np_log=np_to_log;
handles.logXYZ=data_to_log;
guidata(handles.figure1, handles);
fclose(instrfind);

% Hint: get(hObject,'Value') returns toggle state of run_button


% --- Executes on button press in Plot_button.
function Plot_button_Callback(hObject, eventdata, handles)
% hObject    handle to Plot_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Plot_button


% --- Executes on button press in Log_button.
function Log_button_Callback(hObject, eventdata, handles)
% hObject    handle to Log_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')
    handles.Log_Status=1;
else
    handles.Log_Status=0;
end
    
guidata(handles.figure1, handles);
% Hint: get(hObject,'Value') returns toggle state of Log_button




% --- Executes on button press in radio_disp_source.
function radio_disp_source_Callback(hObject, eventdata, handles)
% hObject    handle to radio_disp_source (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value')) %using TO Output, scale x-axis 
    if(get(handles.radio_TO_output,'Value'))
        x_limit=str2num(get(handles.edit_x_limit,'String'));
        set(handles.axes1,'xlim',[0 x_limit]);
        xlabel(handles.axes1,'Disp. (in)');
    end
end
% Hint: get(hObject,'Value') returns toggle state of radio_disp_source


% --- Executes on button press in radio_strain_source.
function radio_strain_source_Callback(hObject, eventdata, handles)
% hObject    handle to radio_strain_source (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value')) %using TO Output, scale x-axis 
     if(get(handles.radio_TO_output,'Value'))
        x_limit=str2num(get(handles.edit_x_limit,'String'));
        set(handles.axes1,'xlim',[0 x_limit]);
        xlabel(handles.axes1,'Strain (%)');
     end
end
% Hint: get(hObject,'Value') returns toggle state of radio_strain_source


% --- Executes on button press in radio_function_generator.
function radio_function_generator_Callback(hObject, eventdata, handles)
% hObject    handle to radio_function_generator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_function_generator
if (get(hObject,'Value')) %using function generator, scale x-axis to 50
    set(handles.axes1,'xlim',[0 50]);
    xlabel(handles.axes1,'Function Generator Count');
    ylabel(handles.axes1,'Function Generator Ouput');
    set(handles.axes1,'ylim',[-1 1]);
end


% --- Executes on button press in radio_TO_output.
function radio_TO_output_Callback(hObject, eventdata, handles)
% hObject    handle to radio_TO_output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_TO_output
if (get(hObject,'Value')) %using TO Output, scale x-axis 
    x_limit=str2num(get(handles.edit_x_limit,'String'));
    set(handles.axes1,'xlim',[0 x_limit]);
    y_limit=str2num(get(handles.edit_y_limit,'String'));
    set(handles.axes1,'ylim',[0 y_limit]);
    ylabel(handles.axes1,'Load (lbf)');
    if(get(handles.radio_strain_source,'Value')) %using strain value
        xlabel(handles.axes1,'Strain (%)');
    else
        xlabel(handles.axes1,'Disp. (in)');
    end
    
end


function edit_x_limit_Callback(hObject, eventdata, handles)
% hObject    handle to edit_x_limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x_limit = str2double(get(hObject, 'String'));
if isnan(x_limit)
    set(hObject, 'String', 1.0);
    errordlg('Input must be a number','Error');
    return;
end
set(handles.axes1,'xlim',[0 x_limit]);
% Hints: get(hObject,'String') returns contents of edit_x_limit as text
%        str2double(get(hObject,'String')) returns contents of edit_x_limit as a double


% --- Executes during object creation, after setting all properties.
function edit_x_limit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_x_limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_y_limit_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y_limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y_limit = str2double(get(hObject, 'String'));
if isnan(y_limit)
    set(hObject, 'String', 60000);
    errordlg('Input must be a number','Error');
    return;
end
set(handles.axes1,'ylim',[0 y_limit]);
% Hints: get(hObject,'String') returns contents of edit_y_limit as text
%        str2double(get(hObject,'String')) returns contents of edit_y_limit as a double


% --- Executes during object creation, after setting all properties.
function edit_y_limit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y_limit (see GCBO)
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


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
