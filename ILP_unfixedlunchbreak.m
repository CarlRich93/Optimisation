clear all; close all; clc;

%%% where FT staff can work a maximum of 5 hours straight. This could not be solved with
%%% equalities, thus this is replaced with inequality


%using equalities
% f = [84 84 84 84 84 84 84 84 84 84 30 30 30 30 30]';
% intcon = 1:15;
% A = [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 0 0 0 0 0];
% b = -4;
% Aeq = [1 1 1 1 1 0 0 0 0 0 1 0 0 0 0
%        0 1 1 1 1 1 1 1 1 1 1 1 0 0 0
%        1 0 1 1 1 0 1 1 1 1 1 1 1 0 0
%        1 1 0 1 1 1 0 1 1 1 1 1 1 1 0
%        1 1 1 0 1 1 1 0 1 1 0 1 1 1 1
%        1 1 1 1 0 1 1 1 0 1 0 0 1 1 1
%        1 1 1 1 1 1 1 1 1 0 0 0 0 1 1
%        0 0 0 0 0 1 1 1 1 1 0 0 0 0 1];
% 
% beq = [6 5 7 8 8 7 5 6]';
% lb = zeros(15,1);
% ub = inf(15,1);


%using inequalities
f = [84 84 84 84 84 84 84 84 84 84 30 30 30 30 30]';
intcon = 1:15;
A = [-1 -1 -1 -1 -1 0 0 0 0 0 -1 0 0 0 0
     0 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 0 0 0
     -1 0 -1 -1 -1 0 -1 -1 -1 -1 -1 -1 -1 0 0
     -1 -1 0 -1 -1 -1 0 -1 -1 -1 -1 -1 -1 -1 0
     -1 -1 -1 0 -1 -1 -1 0 -1 -1 0 -1 -1 -1 -1
     -1 -1 -1 -1 0 -1 -1 -1 0 -1 0 0 -1 -1 -1
     -1 -1 -1 -1 -1 -1 -1 -1 -1 0 0 0 0 -1 -1
     0 0 0 0 0 -1 -1 -1 -1 -1 0 0 0 0 -1
     -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 0 0 0 0 0];

b = [-6 -5 -7 -8 -8 -7 -5 -6 -4]';
Aeq = zeros(1,15);
beq = 0;
lb = zeros(15,1);
ub = inf(15,1);

x = intlinprog(f, intcon, A, b, Aeq, beq, lb, ub)

total_hours_worked = transpose(x)*[6 6 6 6 6 6 6 6 6 6 4 4 4 4 4]'