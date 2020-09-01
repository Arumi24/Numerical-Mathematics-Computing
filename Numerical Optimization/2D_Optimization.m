[X,Y] = meshgrid(-1000:100:1000);
Z=Func_2D(X,Y);

x0=999;
y0=-750;

mesh(X,Y,Z)

for i=1:5000
	
	xlim([-1000,1000])
	ylim([-1000,1000])
	zlim([0,1200000])
	hold on
	plot3(x0,y0,Func_2D(x0,y0),'r*')

	x0=x0-0.5*dFunc_2Ddx(x0,y0);
	y0=y0-0.5*dFunc_2Ddx(y0,x0);
	pause(0.5)

	disp(x0)
	disp(y0)

	disp("")
	if x0<0.1
		disp("Min Found")
		break
	end
end


clear;
clf;


[X,Y] = meshgrid(-1000:100:1000);
Z=Func_2D(X,Y);

x0=999;
y0=-750;

mesh(X,Y,Z)
xlim([-1000,1000])
ylim([-1000,1000])
zlim([-5,1200000])
initial=[x0,y0];
hessian=zeros(2,2);

hessian(1,1)=0.52;
hessian(2,2)=0.52;


hessian(1,2)=-0.48;
hessian(2,1)=-0.48;

hold on
plot3(initial(1),initial(2),Func_2D(initial(1),initial(2)),'r*')

for i=1:5000
	
	xlim([-1000,1000])
	ylim([-1000,1000])
	zlim([-5,1200000])
	
	
	

	initial=initial-0.1*mtimes(mtimes(inv(mtimes(hessian',hessian)),hessian'),[dFunc_2Ddx(initial(1),initial(2)),dFunc_2Ddy(initial(1),initial(2))]')';
	plot3(initial(1),initial(2),Func_2D(initial(1),initial(2)),'r*')
	pause(0.2)


	if initial(1)<0.1
		disp(initial(1))
		disp(initial(2))
		disp(Func_2D(initial(1),initial(2)))
		plot3(initial(1),initial(2),Func_2D(initial(1),initial(2)),'r*')
		disp("Min Found")
		break
	end
end