
x=linspace(0,2*pi,100);
g=sin(x)



plot(x,g)


________________________________________________________________________________________________________________________

x=linspace(-4,4,100);
g=(1/sqrt(2*pi))*exp((-0.5)*x.^2);
plot(x,g)
ylim([-1,1])

c=1;



time_step=g(:,:,1);

temp=g(:,:,1);

for j=2:size(x,2)-1

time_step(j)=temp(j)-0.5*c^2*(temp(j+1)-2*temp(j)+temp(j-1));

end

g(:,:,2)=time_step;


t=1000

for i=3:t

	time_step=g(:,:,i-1);


	temp_1=g(:,:,i-1);
	temp_2=g(:,:,i-2);

	for j=2:size(x,2)-1

		time_step(j)=-temp_2(j)+2*temp_1(j)+c^2*(temp_1(j+1)-2*temp_1(j)+temp_1(j-1));

	g(:,:,i)=time_step;

	end
end

		





test=g(:,:,1);

for i=1:5:t
	y=g(:,:,i);
surf([x(:) x(:)], [y(:) y(:)], [x(:) x(:)], ...  % Reshape and replicate data
'FaceColor', 'none', ...    % Don't bother filling faces with color
'EdgeColor', 'interp', ...  % Use interpolated color for edges
'LineWidth', 3);            % Make a thicker line
view(2);   % Default 2-D view
colorbar;

ylim([-1,1])
pause(0.001)

end



for i=1:t

	plot(x,g(:,:,i))
	ylim([-1,1])
	disp(i)
	pause(0.1)

end