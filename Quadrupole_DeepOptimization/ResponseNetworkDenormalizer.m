% =========================================================================
% UNIVERSIDADE FEDERAL DO PAR�
% INSTITUTO DE TECNOLOGIA
% ENGENHARIA EL�TRICA
% LABORAT�RIO DE NANOFOT�NICA E NANOELETR�NICA
%
% LUIZ HENRIQUE P. ASSUN��O
% =========================================================================





load MinMaxDataSetIn.mat MinDataSetIn MaxDataSetIn
load MinMaxDataSetOut.mat MinDataSetOut MaxDataSetOut


TargetNet = csvread('predictResponse.csv');



DenormalizedDataSetTargetNet = (TargetNet./1) .* (MaxDataSetIn-MinDataSetIn) + MinDataSetIn;


% Exportar DataSet de Entrada e Sa�da Normalizados
save DenormalizedDataSetTargetNet.mat DenormalizedDataSetTargetNet




% Resposta da Rede Desnormalizada
fprintf('\nA resposta da rede foi desnormalizada\n\n');


% Apagar vari�veis
clear variables