clear all; close all; clc;

%%% where full time staff work 7 hours and have one hour paid lunch.
%%% staff can't work more than 5 hours straight. This could not be solved with
%%% equalities, thus this is replaced with inequality


%using equalities
% f = [84 84 84 84 30 30 30 30 30]';
% intcon = 1:9;
% A = [-1 -1 -1 -1 0 0 0 0 0];
% b = -4;
% Aeq = [1 1 1 1 1 0 0 0 0
%        1 1 1 1 1 1 0 0 0
%        0 1 1 1 1 1 1 0 0
%        1 0 1 1 1 1 1 1 0
%        1 1 0 1 0 1 1 1 1
%        1 1 1 0 0 0 1 1 1
%        1 1 1 1 0 0 0 1 1
%        1 1 1 1 0 0 0 0 1];
% 
% beq = [6 5 7 8 8 7 5 6]';
% lb = zeros(9,1);
% ub = inf(9,1);


%using inequalities
f = [96 96 96 96 30 30 30 30 30]';
intcon = 1:9;
A = [-1 -1 -1 -1 -1 0 0 0 0
     -1 -1 -1 -1 -1 -1 0 0 0
     0 -1 -1 -1 -1 -1 -1 0 0
     -1 0 -1 -1 -1 -1 -1 -1 0
     -1 -1 0 -1 0 -1 -1 -1 -1
     -1 -1 -1 0 0 0 -1 -1 -1
     -1 -1 -1 -1 0 0 0 -1 -1
     -1 -1 -1 -1 0 0 0 0 -1
     -1 -1 -1 -1 0 0 0 0 0];

b = [-6 -5 -7 -8 -8 -7 -5 -6 -4]';
Aeq = zeros(1,9);
beq = 0;
lb = zeros(9,1);
ub = inf(9,1);

x = intlinprog(f, intcon, A, b, Aeq, beq, lb, ub)

total_hours_worked = transpose(x)*[7 7 7 7 4 4 4 4 4]'