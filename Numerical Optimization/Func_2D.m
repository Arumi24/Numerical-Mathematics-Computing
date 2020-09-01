function [ Z ] = func( X,Y )
%FUNC Summary of this function goes here
%   Detailed explanation goes here

Z=0.24*(2*X.^2+Y.^2)-0.48*X.*Y;
end

