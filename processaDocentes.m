function P = processaDocentes
% Processa os docentes efetivos dos departamentos e armazena em uma tabela.

%% Definições gerais
docentes = "data/Docentes.csv";

%% Configuração da importação
opts = detectImportOptions(docentes);
varNames = {'Nome', 'Email', 'Departamento', 'Carreira'};
varTypes = {'string', 'string', 'string', 'string'};
opts.SelectedVariableNames = varNames;
opts.VariableTypes = varTypes;
P = readtable(docentes, opts);

%% Remove colunas irrelevantes
P.Email = [];

%% Ordenar os professores
P.Departamento = categorical(P.Departamento);
P.Carreira = categorical(P.Carreira);
P = sortrows(P, {'Departamento', 'Nome'});

end
