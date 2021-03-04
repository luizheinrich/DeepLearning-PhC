% =========================================================================
% UNIVERSIDADE FEDERAL DO PARÁ
% INSTITUTO DE TECNOLOGIA
% ENGENHARIA ELÉTRICA
% LABORATÓRIO DE NANOFOTÔNICA E NANOELETRÔNICA
%
% LUIZ HENRIQUE P. ASSUNÇÃO
% =========================================================================





load MinMaxDataSetIn.mat MinDataSetIn MaxDataSetIn
load MinMaxDataSetOut.mat MinDataSetOut MaxDataSetOut


TargetNet = csvread('predictResponse.csv');



DenormalizedDataSetTargetNet = (TargetNet./1) .* (MaxDataSetIn-MinDataSetIn) + MinDataSetIn;


% Exportar DataSet de Entrada e Saída Normalizados
save DenormalizedDataSetTargetNet.mat DenormalizedDataSetTargetNet




% Resposta da Rede Desnormalizada
fprintf('\nA resposta da rede foi desnormalizada\n\n');


% Apagar variáveis
clear variables