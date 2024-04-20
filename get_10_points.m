
fclose(instrfind);
serialport = serial(['COM11']);
set(serialport,'BaudRate',250000);
 fopen(serialport);
A=zeros(maxp,3)';
for i=1:maxp
    i
  A(:,i)=get_to_point(serialport);
  pause(.5);
end
% for i=1:1.
%     for j=1:3
%         B(i,j)=A{i}(j);
%     end
% end
fclose(serialport);
figure(1)
for i=1:3
  subplot(3,1,i)
  plot(A(i,:))
end