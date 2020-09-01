
[x,y]=meshgrid(-5:0.2:5);

initial_value=(1/sqrt(2*pi))*exp((-0.5)*0.3*(x.^2+y.^2));

x_index=x(1,:);

y_index=y(1,:);

surf(x,y,initial_value)
xlim([-5,5])
ylim([-5,5])
zlim([0,0.5])


t=50000;

dt=0.1;

h=0.2;

kappa=0.005;


for i=1:t

grid=initial_value(:,:,i);
	
temp=initial_value(:,:,i);

for j=2:size(x_index,2)-1

for k=2:size(y_index,2)-1

grid(j,k)=(1-((4*dt*kappa)/h^2))*temp(j,k)+dt*kappa*((temp(j,k-1)+temp(j-1,k)+temp(j+1,k)+temp(j,k+1))/h^2);

end

end

initial_value(:,:,i+1)=grid;

end




for i=1:250:50001
surf(x,y,initial_value(:,:,i));
xlim([-5,5])
ylim([-5,5])
zlim([0,0.5])
pause(0.10);
end




