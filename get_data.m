function [ data ] = get_data( ~ )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fclose(instrfind);
serialport = serial(['COM11']);
set(serialport,'BaudRate',250000);
 fopen(serialport);
if (get(serialport,'BytesAvailable'))
    fread(serialport,get(serialport,'BytesAvailable'));
end
% while (get(serialport,'BytesAvailable') == 0)
%     disp(sprintf('Waiting for data...'))
%     pause(.5)
% end
data=0;
while(length(data) ~= 3)
  line=fgetl(serialport);
  data=[sscanf(line,'%f,%f,%f')];
end
data

end

