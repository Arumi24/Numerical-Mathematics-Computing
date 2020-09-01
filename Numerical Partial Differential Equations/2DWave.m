
[x,y]=meshgrid(-10:0.2:10);

initial_value=((1/sqrt(2*pi))*exp((-0.5)*0.3*((x).^2+(y).^2)));




x_index=x(1,:);

y_index=y(1,:);





surf(x,y,initial_value)

xlim([-10,10])
ylim([-10,10])
zlim([-0.4,0.4])

t=5000;

dt=0.2;

h=0.2;

c=0.5;



initial_value(:,:,2)=initial_value(:,:,1);



for i=3:t

temp=initial_value(:,:,i-1);
	
temp1=initial_value(:,:,i-1);
temp2=initial_value(:,:,i-2);

for j=2:size(x_index,2)-1

for k=2:size(y_index,2)-1

	temp(j,k)=0;

	temp(j,k)=(-temp2(j,k))+2*temp1(j,k)+c^2*(temp1(j+1,k)+temp1(j-1,k)+temp1(j,k+1)+temp1(j,k-1)-4*temp1(j,k));
end

end


initial_value(:,:,i)=temp;

end




for i=1:t
disp(i)
surf(x,y,initial_value(:,:,i));
xlim([-10,10])
ylim([-10,10])
zlim([-0.4,0.4])
pause(0.01);
end



_________________________________________




[x,y]=meshgrid(-2:0.2:2);

initial_value=x.*exp(-x.^2 - y.^2);




x_index=x(1,:);

y_index=y(1,:);





surf(x,y,initial_value)

xlim([-2,2])
ylim([-2,2])
zlim([-0.5,0.5])
pause(1);
t=5000;

dt=0.2;

h=0.2;

c=0.5;



initial_value(:,:,2)=initial_value(:,:,1);



for i=3:t

temp=initial_value(:,:,i-1);
	
temp1=initial_value(:,:,i-1);
temp2=initial_value(:,:,i-2);

for j=2:size(x_index,2)-1

for k=2:size(y_index,2)-1

	temp(j,k)=0;

	temp(j,k)=(-temp2(j,k))+2*temp1(j,k)+c^2*(temp1(j+1,k)+temp1(j-1,k)+temp1(j,k+1)+temp1(j,k-1)-4*temp1(j,k));
end

end


initial_value(:,:,i)=temp;

end




for i=1:t
disp(i)
surf(x,y,initial_value(:,:,i));
xlim([-2,2])
ylim([-2,2])
zlim([-0.5,0.5])
pause(0.01);
end


_________________________________________



[x,y]=meshgrid(-2:0.2:2);

initial_value=x.*exp(-x.^2 - y.^2);

x_index=x(1,:);

y_index=y(1,:);





surf(x,y,initial_value)
pause(1);

t=5000;

dt=0.2;

h=0.2;

c=1;





grid=initial_value(:,:,1);
	
temp=initial_value(:,:,1);

for j=2:size(x_index,2)-1

for k=2:size(y_index,2)-1

	grid(j,k)=temp(j,k)-0.5*c^2*(temp(j+1,k)+temp(j-1,k)+temp(j,k+1)+temp(j,k-1)-4*temp(j,k));
end

end

initial_value(:,:,2)=grid;










for i=3:t

temp=initial_value(:,:,i-1);
	
temp1=initial_value(:,:,i-1);
temp2=initial_value(:,:,i-2);

for j=2:size(x_index,2)-1

for k=2:size(y_index,2)-1

	temp(j,k)=0;

	temp(j,k)=(-temp2(j,k))+2*temp1(j,k)+c^2*(temp1(j+1,k)+temp1(j-1,k)-2*temp1(j,k));
end

end


initial_value(:,:,i)=temp;

end




for i=1:t
disp(i)
surf(x,y,initial_value(:,:,i));
xlim([-2,2])
ylim([-2,2])
zlim([-0.5,0.5])
pause(0.1);
end
