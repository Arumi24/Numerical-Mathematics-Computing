
X=linspace(-10000,10000,1000);
Y=Func_1D(X);

x0=9999;

plot(X,Y,'LineWidth',3)
for i=1:5000
	xlim([-10000,10000])
	ylim([0,10000000])
	hold on
	plot(x0,Func_1D(x0),'r*')

	x0=x0-0.2*dFunc_1Ddx(x0);
	pause(0.05)
	disp(x0)
	if x0<0.01
		disp("Min Found")
		break
	end
end



clear;
clf;

dxx=0.2

X=linspace(-10000,10000,1000);
Y=Func_1D(X);

x0=9999;

plot(X,Y,'LineWidth',3)

hold on
plot(x0,Func_1D(x0),'r*')
disp(x0)
for i=1:5000

	if x0<0.001
		disp("Min Found")
		break
	end

	xlim([-10000,10000])
	ylim([0,10000000])
	

	x0=x0-dFunc_1Ddx(x0)/dxx;
	disp(x0)
	plot(x0,Func_1D(x0),'r*')
	pause(0.05)

	
end




