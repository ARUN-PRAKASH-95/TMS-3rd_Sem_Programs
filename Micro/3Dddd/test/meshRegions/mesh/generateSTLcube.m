% This file is part of MODEL, the Mechanics Of Defect Evolution Library.
%
% Copyright (C) 2011 by Giacomo Po <gpo@ucla.edu>.
% model is distributed without any warranty under the
% GNU General Public License (GPL) v2 <http://www.gnu.org/licenses/>.


clc
close all
clear all

modelDir='../../../';
addpath([modelDir 'matlab/']);

%% Define output file name
meshID=1;
filename='cube'; % this creates file cube.stl

%% Size and position of the cube
L=1000; % the side length of the cube, in units of Burgers vector

% coordinates of the 8 vertices of the cube.
% The base of the cube is at z=0. The cube is centered in x and y
v0=[0 0 0]*L%-[1 1 0]*L/2;
v1=[1 0 0]*L%-[1 1 0]*L/2;
v2=[1 1 0]*L%-[1 1 0]*L/2;
v3=[0 1 0]*L%-[1 1 0]*L/2;
v4=[0 0 1]*L%-[1 1 0]*L/2;
v5=[1 0 1]*L%-[1 1 0]*L/2;
v6=[1 1 1]*L%-[1 1 0]*L/2;
v7=[0 1 1]*L%-[1 1 0]*L/2;

% Create 12 facets by splitting each face of the cube in two triangles
Facets={};
Facets=addFacet(Facets,v0,v3,v1);
Facets=addFacet(Facets,v1,v3,v2);

Facets=addFacet(Facets,v4,v5,v7);
Facets=addFacet(Facets,v5,v6,v7);

Facets=addFacet(Facets,v0,v1,v5);
Facets=addFacet(Facets,v0,v5,v4);

Facets=addFacet(Facets,v0,v7,v3);
Facets=addFacet(Facets,v0,v4,v7);

Facets=addFacet(Facets,v3,v7,v2);
Facets=addFacet(Facets,v7,v6,v2);

Facets=addFacet(Facets,v1,v2,v6);
Facets=addFacet(Facets,v1,v6,v5);

%% plot facets
figure(1)
clf
plotFacets(Facets)
grid on

%% write stl file
writeSTL(Facets,filename)

%% Run Tetgen 
averageElementVolume=100000;
system([modelDir 'scripts/tetgenSTL.sh ' filename ' ' num2str(averageElementVolume)]);

%% Create T and N files and clean tetgent output
system([modelDir 'scripts/tetgen2TN.sh ' filename ' ' num2str(meshID)]);

