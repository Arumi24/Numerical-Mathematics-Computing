N=1000;
x= linspace(0,1,N+1);
dx= x(2)-x(1);

u=exp(-(x-0.5).^2/0.1^2);

u0=u(2:end-1);


global k A b

A=eye(N-1);
A=A*(-2/dx^2);
A=A+1/dx^2 * diag(ones(N-2,1),-1);
A=A+1/dx^2 * diag(ones(N-2,1),1);


b=zeros(N-1,1);

k=0.01;

[t,u]=ode45(@ddt_heat,[0,1],u0);

t=x(2:end-1);

test=u(1,:);
for i=1:250:size(u,1)
y=u(i,:);
surf([t(:) t(:)], [y(:) y(:)], [test(:) test(:)], ...  % Reshape and replicate data
'FaceColor', 'none', ...    % Don't bother filling faces with color
'EdgeColor', 'interp', ...  % Use interpolated color for edges
'LineWidth', 3);            % Make a thicker line
view(2);   % Default 2-D view
colorbar;
xlim([0,1])
ylim([0,1])
pause(0.00001)
end