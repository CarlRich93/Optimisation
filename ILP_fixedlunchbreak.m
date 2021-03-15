clear all; close all; clc;

%%% where lunch break is taken exactly in the middle of the shift the
%%% problem cannot be solved with equalities being used
%%% however, when the equalities are changed to inequalities, a solution
%%% can be found

%using equalities
% f = [84 84 30 30 30 30 30]';
% intcon = 1:7;
% A = [-1 -1 0 0 0 0 0];
% b = -4;
% Aeq = [1 0 1 0 0 0 0
%        1 1 1 1 0 0 0
%        1 1 1 1 1 0 0
%        0 1 1 1 1 1 0
%        1 0 0 1 1 1 1
%        1 1 0 0 1 1 1
%        1 1 0 0 0 1 1
%        0 1 0 0 0 0 1];
% 
%    beq = [6 5 7 8 8 7 5 6]';
% lb = zeros(7,1);
% ub = inf(7,1);

%replacing equalities with inequalities
f = [84 84 30 30 30 30 30]';
intcon = 1:7;
A = [-1 0 -1 0 0 0 0
     -1 -1 -1 -1 0 0 0
     -1 -1 -1 -1 -1 0 0
      0 -1 -1 -1 -1 -1 0
     -1 0 0 -1 -1 -1 -1
     -1 -1 0 0 -1 -1 -1
     -1 -1 0 0 0 -1 -1
      0 -1 0 0 0 0 -1
     -1 -1 0 0 0 0 0];

b = [-6 -5 -7 -8 -8 -7 -5 -6 -4]';
Aeq = zeros(1,7);
beq = 0;
lb = zeros(7,1);
ub = inf(7,1);

x = intlinprog(f, intcon, A, b, Aeq, beq, lb, ub)

total_hours_worked = transpose(x)*[6 6 4 4 4 4 4]'