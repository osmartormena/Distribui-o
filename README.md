# Distribuição
Mapa de carga horária dos Departamentos Acadêmicos da UTFPR-CM para
disposição de novas vagas de reposição e/ou concurso.

## Dados
Uma planilha de docentes efetivos por departamento é mantida pela
DIRGRAD-CM. As matrizes curriculares foram copiadas do Sistema Acadêmico e
consolidadas em uma única planilha. Para os fins deste trabalho, foram
utilizadas apenas as matrizes novas.

## Funções
A função *processaObrigatorias.m* produz uma tabela com todas as
disciplinas obrigatórias, de todas as matrizes. Disciplinas que figuram em
mais de uma matriz foram agrupadas.

A função *processaOptativas.m* produz uma tabela com todas as disciplinas
optativas, de todas as matrizes. Disciplinas que figuram em mais de uma
matriz foram agrupadas.

A função *processaDocentes.m* produz uma tabela com todos os docentes
efetivos do campus, incluindo sua lotação e carreira (EBTT ou MS).

## Script
O script *main.m* chama as funções supracitadas. Filtra optativas de uma
matriz que são obrigatórias em outra, para que não sejam contabilizadas em
duplicidade. Ao final, produz uma planilha com três abas: Obrigatórias;
Optativas; e Docentes; no formato XLSX para posterior preenchimento e
análise.
