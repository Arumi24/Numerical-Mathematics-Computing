function [ dudt ] = ddt_heat( t,u )
%DDT_HEAT Summary of this function goes here
%   Detailed explanation goes here

global k A b

dudt= k*(A*u+b);

end

