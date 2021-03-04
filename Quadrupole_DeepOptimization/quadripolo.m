function out = model
%
% quadripolo.m
%
% Model exported on Feb 15 2020, 00:12 by COMSOL 5.4.0.388.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath(['C:\COMSOLTestes\Quadripolo\Automa' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o com LiveLink for MATLAB']);

model.label('quadripolo.mph');

model.comments(['Circulador Tquad\n\n']);

model.param.set('a', '0.00112251[m]');
model.param.set('geff', '2.11');
model.param.set('mu0', '4*pi*1e-7[H/m]');
model.param.set('M0', '0.5[Wb/m^2]/mu0');
model.param.set('deltaHOe', '200[Oe]');
model.param.set('gamma', '1.855745e11[C/kg]');
model.param.set('freqdeltaH', '9.3e9[Hz]');
model.param.set('H0', '0.14e6[A/m]');
model.param.set('r1', '0.463');
model.param.set('x1', '7.7509705117886264');
model.param.set('r2', '0.10374');
model.param.set('x2', '9.492');
model.param.set('r3', '0.0593');
model.param.group.create('par2');
model.param('par2').set('YF', '-0.39154', 'Y Ferrite');
model.param('par2').set('RF', '0.22172', 'R Ferrite');
model.param('par2').set('YC', '0.40289', 'Y Cilindros Duplos Inferiores');
model.param('par2').set('XC', '3.5218', 'X Cilindros Duplos Inferiores');
model.param('par2').set('RC', '7.3105', 'R Cilindros Duplos Inferiores');
model.param('par2').set('YCS', '0.26564', 'Y Cilindro Superior');
model.param('par2').set('RCS', '3.2006', 'R Cilindro Superior');
model.param('par2').set('YCDS', '1.731', 'Y Cilindros Duplos Superiores');
model.param('par2').set('XCDS', '-0.013282', 'X Cilindros Duplos Superiores');
model.param('par2').set('RCDS', '0.02852', 'R Cilindros Duplos Superiores');
model.param('par2').set('YCDDS', '2.5424', 'Y');
model.param('par2').set('XCDDS', '-2.4317', 'X');
model.param('par2').set('RCDDS', '0.4549', 'R');
model.param('par2').set('YCDDI', '0', 'Y');
model.param('par2').set('XCDDI', '0', 'X');
model.param('par2').set('RCDDI', '0', 'R');
model.param('par2').set('YCDDI1', '0', 'Y Cilindros Duplos Sub Inferior');
model.param('par2').set('XCDDI1', '0', 'X Cilindros Duplos Sub Inferior');
model.param('par2').set('RCDDI1', '0', 'R Cilindros Duplos Sub Inferior');
model.param('par2').set('YCDDII1', '0', 'Y');
model.param('par2').set('XCDDII1', '0', 'X');
model.param('par2').set('RCDDII1', '0', 'R');
model.param('par2').set('YSSF', '0', 'Y');
model.param('par2').set('RSSF', '0', 'R');

model.component.create('mod1', false);

model.component('mod1').geom.create('geom1', 2);

model.component('mod1').label('Model 1');

model.component('mod1').defineLocalCoord(false);

model.component('mod1').mesh.create('mesh1');

model.component('mod1').geom('geom1').repairTolType('relative');
model.component('mod1').geom('geom1').create('c1', 'Circle');
model.component('mod1').geom('geom1').feature('c1').set('selresult', true);
model.component('mod1').geom('geom1').feature('c1').set('selresultshow', 'all');
model.component('mod1').geom('geom1').feature('c1').set('r', '0.2*a');
model.component('mod1').geom('geom1').create('arr1', 'Array');
model.component('mod1').geom('geom1').feature('arr1').set('selresult', true);
model.component('mod1').geom('geom1').feature('arr1').set('selresultshow', 'all');
model.component('mod1').geom('geom1').feature('arr1').set('fullsize', [11 17]);
model.component('mod1').geom('geom1').feature('arr1').set('displ', {'a' 'a'});
model.component('mod1').geom('geom1').feature('arr1').selection('input').set({'c1'});
model.component('mod1').geom('geom1').create('c2', 'Circle');
model.component('mod1').geom('geom1').feature('c2').set('selresult', true);
model.component('mod1').geom('geom1').feature('c2').set('selresultshow', 'all');
model.component('mod1').geom('geom1').feature('c2').set('pos', {'5*a' 'x1*a*(1+YF*0.01)'});
model.component('mod1').geom('geom1').feature('c2').set('r', 'r1*a*(1+RF*0.01)');
model.component('mod1').geom('geom1').create('c3', 'Circle');
model.component('mod1').geom('geom1').feature('c3').set('pos', {'5*a' 'x2*a*(1+YCS*0.01)'});
model.component('mod1').geom('geom1').feature('c3').set('r', 'r2*a*(1+RCS*0.01)');
model.component('mod1').geom('geom1').create('r1', 'Rectangle');
model.component('mod1').geom('geom1').feature('r1').set('selresult', true);
model.component('mod1').geom('geom1').feature('r1').set('selresultshow', 'all');
model.component('mod1').geom('geom1').feature('r1').set('pos', [0 0]);
model.component('mod1').geom('geom1').feature('r1').set('size', {'10*a' '13*a'});
model.component('mod1').geom('geom1').create('del2', 'Delete');
model.component('mod1').geom('geom1').feature('del2').selection('input').init;
model.component('mod1').geom('geom1').feature('del2').selection('input').set({'arr1(1,15)' 'arr1(1,16)' 'arr1(1,17)' 'arr1(1,9)' 'arr1(10,15)' 'arr1(10,16)' 'arr1(10,17)' 'arr1(10,9)' 'arr1(11,15)' 'arr1(11,16)'  ...
'arr1(11,17)' 'arr1(11,9)' 'arr1(2,15)' 'arr1(2,16)' 'arr1(2,17)' 'arr1(2,9)' 'arr1(3,15)' 'arr1(3,16)' 'arr1(3,17)' 'arr1(3,9)'  ...
'arr1(4,10)' 'arr1(4,15)' 'arr1(4,16)' 'arr1(4,17)' 'arr1(4,8)' 'arr1(4,9)' 'arr1(5,10)' 'arr1(5,15)' 'arr1(5,16)' 'arr1(5,17)'  ...
'arr1(5,6)' 'arr1(5,7)' 'arr1(5,8)' 'arr1(5,9)' 'arr1(6,1)' 'arr1(6,10)' 'arr1(6,11)' 'arr1(6,15)' 'arr1(6,16)' 'arr1(6,17)'  ...
'arr1(6,2)' 'arr1(6,3)' 'arr1(6,4)' 'arr1(6,5)' 'arr1(6,6)' 'arr1(6,7)' 'arr1(6,8)' 'arr1(6,9)' 'arr1(7,10)' 'arr1(7,15)'  ...
'arr1(7,16)' 'arr1(7,17)' 'arr1(7,6)' 'arr1(7,7)' 'arr1(7,8)' 'arr1(7,9)' 'arr1(8,10)' 'arr1(8,15)' 'arr1(8,16)' 'arr1(8,17)'  ...
'arr1(8,8)' 'arr1(8,9)' 'arr1(9,15)' 'arr1(9,16)' 'arr1(9,17)' 'arr1(9,9)'});
model.component('mod1').geom('geom1').create('uni1', 'Union');
model.component('mod1').geom('geom1').feature('uni1').set('selresult', true);
model.component('mod1').geom('geom1').feature('uni1').set('selresultshow', 'all');
model.component('mod1').geom('geom1').feature('uni1').selection('input').set({'arr1(1,1)' 'arr1(1,10)' 'arr1(1,11)' 'arr1(1,12)' 'arr1(1,13)' 'arr1(1,14)' 'arr1(1,2)' 'arr1(1,3)' 'arr1(1,4)' 'arr1(1,5)'  ...
'arr1(1,6)' 'arr1(1,7)' 'arr1(1,8)' 'arr1(10,1)' 'arr1(10,10)' 'arr1(10,11)' 'arr1(10,12)' 'arr1(10,13)' 'arr1(10,14)' 'arr1(10,2)'  ...
'arr1(10,3)' 'arr1(10,4)' 'arr1(10,5)' 'arr1(10,6)' 'arr1(10,7)' 'arr1(10,8)' 'arr1(11,1)' 'arr1(11,10)' 'arr1(11,11)' 'arr1(11,12)'  ...
'arr1(11,13)' 'arr1(11,14)' 'arr1(11,2)' 'arr1(11,3)' 'arr1(11,4)' 'arr1(11,5)' 'arr1(11,6)' 'arr1(11,7)' 'arr1(11,8)' 'arr1(2,1)'  ...
'arr1(2,10)' 'arr1(2,11)' 'arr1(2,12)' 'arr1(2,13)' 'arr1(2,14)' 'arr1(2,2)' 'arr1(2,3)' 'arr1(2,4)' 'arr1(2,5)' 'arr1(2,6)'  ...
'arr1(2,7)' 'arr1(2,8)' 'arr1(3,1)' 'arr1(3,10)' 'arr1(3,11)' 'arr1(3,12)' 'arr1(3,13)' 'arr1(3,14)' 'arr1(3,2)' 'arr1(3,3)'  ...
'arr1(3,4)' 'arr1(3,5)' 'arr1(3,6)' 'arr1(3,7)' 'arr1(3,8)' 'arr1(4,1)' 'arr1(4,11)' 'arr1(4,12)' 'arr1(4,13)' 'arr1(4,14)'  ...
'arr1(4,2)' 'arr1(4,3)' 'arr1(4,4)' 'arr1(4,5)' 'arr1(4,6)' 'arr1(4,7)' 'arr1(5,1)' 'arr1(5,11)' 'arr1(5,12)' 'arr1(5,13)'  ...
'arr1(5,14)' 'arr1(5,2)' 'arr1(5,3)' 'arr1(5,4)' 'arr1(5,5)' 'arr1(6,12)' 'arr1(6,13)' 'arr1(6,14)' 'arr1(7,1)' 'arr1(7,11)'  ...
'arr1(7,12)' 'arr1(7,13)' 'arr1(7,14)' 'arr1(7,2)' 'arr1(7,3)' 'arr1(7,4)' 'arr1(7,5)' 'arr1(8,1)' 'arr1(8,11)' 'arr1(8,12)'  ...
'arr1(8,13)' 'arr1(8,14)' 'arr1(8,2)' 'arr1(8,3)' 'arr1(8,4)' 'arr1(8,5)' 'arr1(8,6)' 'arr1(8,7)' 'arr1(9,1)' 'arr1(9,10)'  ...
'arr1(9,11)' 'arr1(9,12)' 'arr1(9,13)' 'arr1(9,14)' 'arr1(9,2)' 'arr1(9,3)' 'arr1(9,4)' 'arr1(9,5)' 'arr1(9,6)' 'arr1(9,7)'  ...
'arr1(9,8)'});
model.component('mod1').geom('geom1').create('co1', 'Compose');
model.component('mod1').geom('geom1').feature('co1').set('selresult', true);
model.component('mod1').geom('geom1').feature('co1').set('selresultshow', 'all');
model.component('mod1').geom('geom1').feature('co1').set('formula', 'r1*(uni1+c2+r1)');
model.component('mod1').geom('geom1').create('c4', 'Circle');
model.component('mod1').geom('geom1').feature('c4').set('pos', {'5*a*(1+XC*0.01)+(a)' '7*a*(1+YC*0.01)'});
model.component('mod1').geom('geom1').feature('c4').set('r', 'r3*a*(1+RC*0.01)');
model.component('mod1').geom('geom1').create('c5', 'Circle');
model.component('mod1').geom('geom1').feature('c5').set('pos', {'5*a*(1-XC*0.01)-(a)' '7*a*(1+YC*0.01)'});
model.component('mod1').geom('geom1').feature('c5').set('r', 'r3*a*(1+RC*0.01)');
model.component('mod1').geom('geom1').create('c6', 'Circle');
model.component('mod1').geom('geom1').feature('c6').set('pos', {'5*a*(1+XCDS*0.01)+(a)' '9*a*(1+YCDS*0.01)'});
model.component('mod1').geom('geom1').feature('c6').set('r', '0.2*a*(1+RCDS*0.01)');
model.component('mod1').geom('geom1').create('c7', 'Circle');
model.component('mod1').geom('geom1').feature('c7').set('pos', {'5*a*(1-XCDS*0.01)-(a)' '9*a*(1+YCDS*0.01)'});
model.component('mod1').geom('geom1').feature('c7').set('r', '0.2*a*(1+RCDS*0.01)');
model.component('mod1').geom('geom1').create('c8', 'Circle');
model.component('mod1').geom('geom1').feature('c8').set('pos', {'5*a*(1+XCDDS*0.01)+(2*a)' '9*a*(1+YCDDS*0.01)'});
model.component('mod1').geom('geom1').feature('c8').set('r', '0.2*a*(1+RCDDS*0.01)');
model.component('mod1').geom('geom1').create('c9', 'Circle');
model.component('mod1').geom('geom1').feature('c9').set('pos', {'5*a*(1-XCDDS*0.01)-(2*a)' '9*a*(1+YCDDS*0.01)'});
model.component('mod1').geom('geom1').feature('c9').set('r', '0.2*a*(1+RCDDS*0.01)');
model.component('mod1').geom('geom1').create('c10', 'Circle');
model.component('mod1').geom('geom1').feature('c10').set('pos', {'5*a*(1+XCDDI*0.01)+(2*a)' '7*a*(1+YCDDI*0.01)'});
model.component('mod1').geom('geom1').feature('c10').set('r', '0.2*a*(1+RCDDI*0.01)');
model.component('mod1').geom('geom1').create('c11', 'Circle');
model.component('mod1').geom('geom1').feature('c11').set('pos', {'5*a*(1-XCDDI*0.01)-(2*a)' '7*a*(1+YCDDI*0.01)'});
model.component('mod1').geom('geom1').feature('c11').set('r', '0.2*a*(1+RCDDI*0.01)');
model.component('mod1').geom('geom1').create('c12', 'Circle');
model.component('mod1').geom('geom1').feature('c12').set('pos', {'5*a*(1+XCDDI1*0.01)+(a)' '6*a*(1+YCDDI1*0.01)'});
model.component('mod1').geom('geom1').feature('c12').set('r', '0.2 *a*(1+RCDDI1*0.01)');
model.component('mod1').geom('geom1').create('c13', 'Circle');
model.component('mod1').geom('geom1').feature('c13').set('pos', {'5*a*(1-XCDDI1*0.01)-(a)' '6*a*(1+YCDDI1*0.01)'});
model.component('mod1').geom('geom1').feature('c13').set('r', '0.2 *a*(1+RCDDI1*0.01)');
model.component('mod1').geom('geom1').create('c15', 'Circle');
model.component('mod1').geom('geom1').feature('c15').label('Circle 14');
model.component('mod1').geom('geom1').feature('c15').set('pos', {'5*a*(1+XCDDII1*0.01)+(a)' '5*a*(1+YCDDII1*0.01)'});
model.component('mod1').geom('geom1').feature('c15').set('r', '0.2 *a*(1+RCDDII1*0.01)');
model.component('mod1').geom('geom1').create('c16', 'Circle');
model.component('mod1').geom('geom1').feature('c16').label('Circle 15');
model.component('mod1').geom('geom1').feature('c16').set('pos', {'5*a*(1-XCDDII1*0.01)-(a)' '5*a*(1+YCDDII1*0.01)'});
model.component('mod1').geom('geom1').feature('c16').set('r', '0.2 *a*(1+RCDDII1*0.01)');
model.component('mod1').geom('geom1').create('c14', 'Circle');
model.component('mod1').geom('geom1').feature('c14').label('Circle 16');
model.component('mod1').geom('geom1').feature('c14').set('pos', {'5*a' '10*a*(1+YSSF*0.01)'});
model.component('mod1').geom('geom1').feature('c14').set('r', '0.2*a*(1+RSSF*0.01)');
model.component('mod1').geom('geom1').feature('fin').set('repairtoltype', 'relative');
model.component('mod1').geom('geom1').run;
model.component('mod1').geom('geom1').run('fin');

model.variable.create('var1');
model.variable('var1').set('w', '2*pi*freq');
model.variable('var1').set('Xxy', '(i*wm*w)/((wi+i*w*alpha)^2-w^2)');
model.variable('var1').set('u', '1+Xxx');
model.variable('var1').set('k', 'i*Xxy');
model.variable('var1').set('alpha', '(deltaHOe*mu0*gamma)/(2*w)');
model.variable('var1').set('wm', 'mu0*gamma*M0');
model.variable('var1').set('wi', 'mu0*gamma*H0');
model.variable('var1').set('ku', 'k/u');
model.variable('var1').set('Xxx', '(wm*(wi+i*w*alpha))/((wi+i*w*alpha)^2-w^2)');

model.component('mod1').material.create('mat2', 'Common');
model.component('mod1').material.create('mat3', 'Common');
model.component('mod1').material.create('mat4', 'Common');
model.component('mod1').material.create('mat5', 'Common');
model.component('mod1').material('mat2').selection.set([89]);
model.component('mod1').material('mat4').selection.set([2 77 88 94 99 105 123]);
model.component('mod1').material('mat5').selection.set([1 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137]);

model.component('mod1').physics.create('ewfd', 'ElectromagneticWavesFrequencyDomain', 'geom1');
model.component('mod1').physics('ewfd').create('sctr1', 'Scattering', 1);
model.component('mod1').physics('ewfd').feature('sctr1').selection.set([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 82 83 84 85 86 87 88 89 90]);
model.component('mod1').physics('ewfd').create('port1', 'Port', 1);
model.component('mod1').physics('ewfd').feature('port1').selection.set([44]);
model.component('mod1').physics('ewfd').create('port2', 'Port', 1);
model.component('mod1').physics('ewfd').feature('port2').selection.set([17]);
model.component('mod1').physics('ewfd').create('port3', 'Port', 1);
model.component('mod1').physics('ewfd').feature('port3').selection.set([81]);

model.capeopen.label('Thermodynamics Package');

model.variable('var1').label('Variables 1a');

model.component('mod1').view('view1').axis.set('xmin', -0.002610593568533659);
model.component('mod1').view('view1').axis.set('xmax', 0.013835692778229713);
model.component('mod1').view('view1').axis.set('ymin', -7.296311669051647E-4);
model.component('mod1').view('view1').axis.set('ymax', 0.015322260558605194);

model.component('mod1').material('mat2').label('Ferrite');
model.component('mod1').material('mat2').propertyGroup('def').set('relpermittivity', {'12.9' '0' '0' '0' '12.9' '0' '0' '0' '12.9'});
model.component('mod1').material('mat2').propertyGroup('def').set('relpermeability', {'u' '-i*k' '0' 'i*k' 'u' '0' '0' '0' '1'});
model.component('mod1').material('mat2').propertyGroup('def').set('electricconductivity', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('mod1').material('mat3').propertyGroup('def').set('relpermittivity', {'8.9' '0' '0' '0' '8.9' '0' '0' '0' '8.9'});
model.component('mod1').material('mat3').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('mod1').material('mat3').propertyGroup('def').set('electricconductivity', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('mod1').material('mat4').label('Ar');
model.component('mod1').material('mat4').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('mod1').material('mat4').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('mod1').material('mat4').propertyGroup('def').set('electricconductivity', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('mod1').material('mat5').label('Dieletrico Si');
model.component('mod1').material('mat5').propertyGroup('def').set('relpermittivity', {'11.56' '0' '0' '0' '11.56' '0' '0' '0' '11.56'});
model.component('mod1').material('mat5').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('mod1').material('mat5').propertyGroup('def').set('electricconductivity', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});

model.component('mod1').physics('ewfd').prop('EquationForm').set('freq', '1[GHz]');
model.component('mod1').physics('ewfd').prop('EquationForm').set('modeFreq', '1[kHz]');
model.component('mod1').physics('ewfd').prop('BackgroundField').set('w0', 0);
model.component('mod1').physics('ewfd').prop('BackgroundField').set('Ebg', [0; 0; 0]);
model.component('mod1').physics('ewfd').prop('MeshControl').set('EnableMeshControl', false);
model.component('mod1').physics('ewfd').prop('MeshControl').set('SizeControlParameter', 'UserDefined');
model.component('mod1').physics('ewfd').feature('wee1').set('DisplacementFieldModel', 'RelativePermittivity');
model.component('mod1').physics('ewfd').feature('wee1').set('minput_strainreferencetemperature', 0);
model.component('mod1').physics('ewfd').feature('sctr1').set('IncidentField', 'EField');
model.component('mod1').physics('ewfd').feature('port1').set('Pin', 1);
model.component('mod1').physics('ewfd').feature('port1').set('PortType', 'Rectangular');
model.component('mod1').physics('ewfd').feature('port1').set('beta', '2*pi*freq/c_const');
model.component('mod1').physics('ewfd').feature('port1').set('E0', [0; 0; 1]);
model.component('mod1').physics('ewfd').feature('port2').set('Pin', 1);
model.component('mod1').physics('ewfd').feature('port2').set('PortType', 'Rectangular');
model.component('mod1').physics('ewfd').feature('port2').set('beta', '2*pi*freq/c_const');
model.component('mod1').physics('ewfd').feature('port2').set('E0', [0; 0; 1]);
model.component('mod1').physics('ewfd').feature('port3').set('Pin', 1);
model.component('mod1').physics('ewfd').feature('port3').set('PortType', 'Rectangular');
model.component('mod1').physics('ewfd').feature('port3').set('beta', '2*pi*freq/c_const');
model.component('mod1').physics('ewfd').feature('port3').set('E0', [0; 0; 1]);

model.study.create('std1');
model.study('std1').create('freq', 'Frequency');
model.study('std1').feature('freq').set('activate', {'ewfd' 'on'});

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.create('pg2', 'PlotGroup1D');
model.result.create('pg3', 'PlotGroup1D');
model.result.create('pg4', 'PlotGroup1D');
model.result.create('pg1', 'PlotGroup2D');
model.result('pg2').create('glob1', 'Global');
model.result('pg3').create('glob1', 'Global');
model.result('pg4').create('glob1', 'Global');
model.result('pg1').create('surf1', 'Surface');
model.result.export.create('plot1', 'Plot');
model.result.export.create('plot2', 'Plot');
model.result.export.create('plot3', 'Plot');
model.result.export.create('img1', 'Image1D');
model.result.export.create('img2', 'Image1D');
model.result.export.create('img3', 'Image1D');

model.study('std1').feature('freq').set('punit', 'Hz');
model.study('std1').feature('freq').set('plist', 'range(9.2e10,5.0e9/30,9.7e10)');
model.study('std1').feature('freq').set('preusesol', 'yes');
model.study('std1').feature('freq').set('discretization', {'ewfd' 'physics'});

model.sol('sol1').attach('std1');
model.sol('sol1').label('Solver 1');
model.sol('sol1').feature('v1').set('clistctrl', {'p1'});
model.sol('sol1').feature('v1').set('cname', {'freq'});
model.sol('sol1').feature('v1').set('clist', {'range(9.2e10,5.0e9/30,9.7e10)[Hz]'});
model.sol('sol1').feature('s1').set('stol', '0.0010');
model.sol('sol1').feature('s1').feature('dDef').set('ooc', false);
model.sol('sol1').feature('s1').feature('dDef').set('rhob', 400);
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'range(9.2e10,5.0e9/30,9.7e10)'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'yes');
model.sol('sol1').runAll;

model.result.dataset('dset1').label('Solution 1');
model.result('pg2').label('1D Plot Group 1');
model.result('pg2').set('titletype', 'manual');
model.result('pg2').set('title', 'Global: Modificar Titulo');
model.result('pg2').set('xlabel', 'Frequency (Hz)');
model.result('pg2').set('xlog', true);
model.result('pg2').set('legendpos', 'lowerright');
model.result('pg2').set('xlabelactive', false);
model.result('pg2').feature('glob1').set('expr', {'ewfd.S11dB' 'ewfd.S21dB' 'ewfd.S31dB'});
model.result('pg2').feature('glob1').set('unit', {'1' '1' '1'});
model.result('pg2').feature('glob1').set('descr', {'S-11' 'S-21' 'S-31'});
model.result('pg2').feature('glob1').set('xdata', 'expr');
model.result('pg2').feature('glob1').set('xdataexpr', 'ewfd.freq');
model.result('pg2').feature('glob1').set('xdataunit', 'Hz');
model.result('pg2').feature('glob1').set('xdatadescr', 'Frequency');
model.result('pg3').label('1D Plot Group 2');
model.result('pg3').set('titletype', 'manual');
model.result('pg3').set('title', 'Global: Modificar Titulo');
model.result('pg3').set('xlabel', 'Frequency (Hz)');
model.result('pg3').set('xlog', true);
model.result('pg3').set('legendpos', 'lowerright');
model.result('pg3').set('xlabelactive', false);
model.result('pg3').feature('glob1').set('expr', {'ewfd.S12dB' 'ewfd.S22dB' 'ewfd.S32dB'});
model.result('pg3').feature('glob1').set('unit', {'' '' ''});
model.result('pg3').feature('glob1').set('descr', {'S-12' 'S-22' 'S-32'});
model.result('pg3').feature('glob1').set('xdata', 'expr');
model.result('pg3').feature('glob1').set('xdataexpr', 'ewfd.freq');
model.result('pg3').feature('glob1').set('xdataunit', 'Hz');
model.result('pg3').feature('glob1').set('xdatadescr', 'Frequency');
model.result('pg4').label('1D Plot Group 3');
model.result('pg4').set('titletype', 'manual');
model.result('pg4').set('title', 'Global: Modificar Titulo');
model.result('pg4').set('xlabel', 'Frequency (Hz)');
model.result('pg4').set('xlog', true);
model.result('pg4').set('legendpos', 'lowerright');
model.result('pg4').set('xlabelactive', false);
model.result('pg4').feature('glob1').set('expr', {'ewfd.S13dB' 'ewfd.S23dB' 'ewfd.S33dB'});
model.result('pg4').feature('glob1').set('unit', {'' '' ''});
model.result('pg4').feature('glob1').set('descr', {'S-13' 'S-23' 'S-33'});
model.result('pg4').feature('glob1').set('xdata', 'expr');
model.result('pg4').feature('glob1').set('xdataexpr', 'ewfd.freq');
model.result('pg4').feature('glob1').set('xdataunit', 'Hz');
model.result('pg4').feature('glob1').set('xdatadescr', 'Frequency');
model.result('pg1').label('Electric Field (ewfd)');
model.result('pg1').set('looplevel', [21]);
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').set('showlegendsmaxmin', true);
model.result('pg1').feature('surf1').label('Surface');
model.result('pg1').feature('surf1').set('expr', 'ewfd.Ez');
model.result('pg1').feature('surf1').set('descr', 'Electric field, z component');
model.result('pg1').feature('surf1').set('colortable', 'WaveLight');
model.result('pg1').feature('surf1').set('colortablesym', true);
model.result('pg1').feature('surf1').set('smooth', 'internal');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result.export('plot1').set('filename', ['C:\Users\luizh\Desktop\Engenharia El' native2unicode(hex2dec({'00' 'e9'}), 'unicode') 'trica\Inicia' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o Cient' native2unicode(hex2dec({'00' 'ed'}), 'unicode') 'fica\Cristais Fot' native2unicode(hex2dec({'00' 'f4'}), 'unicode') 'nicos\Artigo Dipolo-Quadripolo\Simula' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o Quadripolo - Nova\05-Quadripolo-P1.txt']);
model.result.export('plot2').set('plotgroup', 'pg3');
model.result.export('plot2').set('filename', ['C:\Users\luizh\Desktop\Engenharia El' native2unicode(hex2dec({'00' 'e9'}), 'unicode') 'trica\Inicia' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o Cient' native2unicode(hex2dec({'00' 'ed'}), 'unicode') 'fica\Cristais Fot' native2unicode(hex2dec({'00' 'f4'}), 'unicode') 'nicos\Artigo Dipolo-Quadripolo\Simula' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o Quadripolo - Nova\05-Quadripolo-P2.txt']);
model.result.export('plot3').set('plotgroup', 'pg4');
model.result.export('plot3').set('filename', ['C:\Users\luizh\Desktop\Engenharia El' native2unicode(hex2dec({'00' 'e9'}), 'unicode') 'trica\Inicia' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o Cient' native2unicode(hex2dec({'00' 'ed'}), 'unicode') 'fica\Cristais Fot' native2unicode(hex2dec({'00' 'f4'}), 'unicode') 'nicos\Artigo Dipolo-Quadripolo\Simula' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o Quadripolo - Nova\05-Quadripolo-P3.txt']);
model.result.export('img1').set('pngfilename', ['C:\Users\luizh\Desktop\Engenharia El' native2unicode(hex2dec({'00' 'e9'}), 'unicode') 'trica\Inicia' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o Cient' native2unicode(hex2dec({'00' 'ed'}), 'unicode') 'fica\Cristais Fot' native2unicode(hex2dec({'00' 'f4'}), 'unicode') 'nicos\Artigo Dipolo-Quadripolo\Simula' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o Quadripolo - Nova\png porta 1.png']);
model.result.export('img1').set('printunit', 'px');
model.result.export('img1').set('webunit', 'px');
model.result.export('img1').set('printheight', '2000');
model.result.export('img1').set('webheight', '480');
model.result.export('img1').set('printwidth', '2000');
model.result.export('img1').set('webwidth', '640');
model.result.export('img1').set('printlockratio', 'off');
model.result.export('img1').set('weblockratio', 'off');
model.result.export('img1').set('printresolution', '300');
model.result.export('img1').set('webresolution', '96');
model.result.export('img1').set('size', 'manualweb');
model.result.export('img1').set('antialias', 'off');
model.result.export('img1').set('zoomextents', 'off');
model.result.export('img1').set('title', 'on');
model.result.export('img1').set('legend', 'on');
model.result.export('img1').set('logo', 'off');
model.result.export('img1').set('options', 'on');
model.result.export('img1').set('fontsize', '9');
model.result.export('img1').set('customcolor', [1 1 1]);
model.result.export('img1').set('background', 'color');
model.result.export('img1').set('axes', 'on');
model.result.export('img1').set('showgrid', 'on');
model.result.export('img1').set('qualitylevel', '92');
model.result.export('img1').set('qualityactive', 'off');
model.result.export('img1').set('imagetype', 'png');
model.result.export('img2').set('plotgroup', 'pg3');
model.result.export('img2').set('pngfilename', ['C:\Users\luizh\Desktop\Engenharia El' native2unicode(hex2dec({'00' 'e9'}), 'unicode') 'trica\Inicia' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o Cient' native2unicode(hex2dec({'00' 'ed'}), 'unicode') 'fica\Cristais Fot' native2unicode(hex2dec({'00' 'f4'}), 'unicode') 'nicos\Artigo Dipolo-Quadripolo\Simula' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o Quadripolo - Nova\png porta 2.png']);
model.result.export('img2').set('printunit', 'px');
model.result.export('img2').set('webunit', 'px');
model.result.export('img2').set('printheight', '2000');
model.result.export('img2').set('webheight', '480');
model.result.export('img2').set('printwidth', '2000');
model.result.export('img2').set('webwidth', '640');
model.result.export('img2').set('printlockratio', 'off');
model.result.export('img2').set('weblockratio', 'off');
model.result.export('img2').set('printresolution', '300');
model.result.export('img2').set('webresolution', '96');
model.result.export('img2').set('size', 'manualweb');
model.result.export('img2').set('antialias', 'off');
model.result.export('img2').set('zoomextents', 'off');
model.result.export('img2').set('title', 'on');
model.result.export('img2').set('legend', 'on');
model.result.export('img2').set('logo', 'off');
model.result.export('img2').set('options', 'on');
model.result.export('img2').set('fontsize', '9');
model.result.export('img2').set('customcolor', [1 1 1]);
model.result.export('img2').set('background', 'color');
model.result.export('img2').set('axes', 'on');
model.result.export('img2').set('showgrid', 'on');
model.result.export('img2').set('qualitylevel', '92');
model.result.export('img2').set('qualityactive', 'off');
model.result.export('img2').set('imagetype', 'png');
model.result.export('img3').set('plotgroup', 'pg4');
model.result.export('img3').set('pngfilename', ['C:\Users\luizh\Desktop\Engenharia El' native2unicode(hex2dec({'00' 'e9'}), 'unicode') 'trica\Inicia' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o Cient' native2unicode(hex2dec({'00' 'ed'}), 'unicode') 'fica\Cristais Fot' native2unicode(hex2dec({'00' 'f4'}), 'unicode') 'nicos\Artigo Dipolo-Quadripolo\Simula' native2unicode(hex2dec({'00' 'e7'}), 'unicode')  native2unicode(hex2dec({'00' 'e3'}), 'unicode') 'o Quadripolo - Nova\png porta 3.png']);
model.result.export('img3').set('printunit', 'px');
model.result.export('img3').set('webunit', 'px');
model.result.export('img3').set('printheight', '2000');
model.result.export('img3').set('webheight', '480');
model.result.export('img3').set('printwidth', '2000');
model.result.export('img3').set('webwidth', '640');
model.result.export('img3').set('printlockratio', 'off');
model.result.export('img3').set('weblockratio', 'off');
model.result.export('img3').set('printresolution', '300');
model.result.export('img3').set('webresolution', '96');
model.result.export('img3').set('size', 'manualweb');
model.result.export('img3').set('antialias', 'off');
model.result.export('img3').set('zoomextents', 'off');
model.result.export('img3').set('title', 'on');
model.result.export('img3').set('legend', 'on');
model.result.export('img3').set('logo', 'off');
model.result.export('img3').set('options', 'on');
model.result.export('img3').set('fontsize', '9');
model.result.export('img3').set('customcolor', [1 1 1]);
model.result.export('img3').set('background', 'color');
model.result.export('img3').set('axes', 'on');
model.result.export('img3').set('showgrid', 'on');
model.result.export('img3').set('qualitylevel', '92');
model.result.export('img3').set('qualityactive', 'off');
model.result.export('img3').set('imagetype', 'png');

out = model;
