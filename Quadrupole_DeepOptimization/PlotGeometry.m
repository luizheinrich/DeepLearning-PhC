% =========================================================================
% UNIVERSIDADE FEDERAL DO PARÁ
% INSTITUTO DE TECNOLOGIA
% ENGENHARIA ELÉTRICA
% LABORATÓRIO DE NANOFOTÔNICA E NANOELETRÔNICA
%
% LUIZ HENRIQUE P. ASSUNÇÃO
% =========================================================================



% -------------------------------------------------------------------------
% Nome do Modelo
    Modelo = 'quadripolo.mph';

% Escolha a Geração
    Geracao = 1;

% Escolha o Loop
    Loop = 483;
% -------------------------------------------------------------------------



% Importar para o MATLAB as funções do COMSOL
import com.comsol.model.*
import com.comsol.model.util.*



L = Loop;
G = Geracao;

    
    nomePasta = sprintf('geracao_%d',G);
    pastaCorrente = strrep(pwd,'\','\\');



    
    % Carregar parâmetros
nomeDirPar = sprintf('%s\\%s\\S-Parameter (ewfd) - Geração %d - Loop %d - Parâmetros de Simulação.txt',pastaCorrente,nomePasta,G,L);
LOADParameters = readtable(nomeDirPar, 'HeaderLines', 11);
A2 = LOADParameters{:,2};




A1 = {'YF' 'RF' 'YC' 'XC' 'RC' 'YCS' 'RCS' 'YCDS' 'XCDS' 'RCDS' 'YCDDS'...
      'XCDDS' 'RCDDS' 'YCDDI' 'XCDDI' 'RCDDI' 'YCDDI1' 'XCDDI1' 'RCDDI1'...
      'YCDDII1' 'XCDDII1' 'RCDDII1' 'YSSF' 'RSSF'};
  
  
A2 = num2str(A2,'%.15f');
A2 = {A2(1,1:18), A2(2,1:18), A2(3,1:18), A2(4,1:18), A2(5,1:18), A2(6,1:18)...
A2(7,1:18), A2(8,1:18), A2(9,1:18), A2(10,1:18), A2(11,1:18), A2(12,1:18)...
A2(13,1:18), A2(14,1:18), A2(15,1:18), A2(16,1:18), A2(17,1:18), A2(18,1:18)...
A2(19,1:18), A2(20,1:18), A2(21,1:18), A2(22,1:18), A2(23,1:18), A2(24,1:18)};  
  

  
% Carregar modelo do Comsol
model = mphload('quadripolo.mph');



% Parâmetros a serem alterados a cada loop
for setPar = 1:length(A1)
    
model.param('par2').set(A1{setPar}, A2{setPar});

end



% Plotar geometria
mphgeom(model);


% Remove todos os objetos de modelos do COMSOL armazenados no COMSOL SERVER
ModelUtil.clear


% Apagar variáveis
clear variables

