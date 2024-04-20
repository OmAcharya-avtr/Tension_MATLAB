function data = get_to_point(serialport)
  % get_to_point takes an open serial port object
  % and returns a vector with the three values
  % clear the buffer
  %fopen(serialport);
  if (get(serialport,'BytesAvailable'))
      junk=fread(serialport,get(serialport,'BytesAvailable'));
  end
  data=0;
  junk=fread(serialport);
  fgetl(serialport);
  while(length(data) ~= 3)
    line=fgetl(serialport);
    if (isempty(strfind(line,'?')))
      %data=[sscanf(line,'%f,%f,%f')];
      temp=textscan(line,'%f,%f,%f');
      data=[temp{1} temp{2} temp{3}];
    end
  end
  
%  fclose(serialport);
end

