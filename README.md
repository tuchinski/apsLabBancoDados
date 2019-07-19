## **ENADE 2017**

Este repósitório contém os scripts SQL para adicionar os dados do ENADE 2017 em um banco de dados POSGRESQL, além do modelo relacional, no formato .mwb, que pode ser aberto no MYSQL WORKBENCH:

# Execução dos Scripts
1. **scriptTabelaCSV.sql**

Neste script, criamos uma tabela única, com o nome 'enade', contendo todos os campos do arquivo .txt

Para que o script funcione é necessário editar a última linha, informando o caminho do arquivo txt contendo os dados do ENADE. 
Exemplo:
 `FROM '/home/tuchinski/Documentos/MICRODADOS_ENADE_2017.txt' DELIMITER ';' CSV HEADER;`
 Depois de executado o comando, a tabela será criada e devidamente preenchida.
 
 2. **scriptCriaTabelas.sql**
 Esse script cria todas as tabelas definidas no modelo relacional, insere os dados nas tabelas correnspondentes. Os inserts são realizados por meio de selects na tabela 'enade'.

# Execução dos scripts
1. **Execute o script scriptTabelaCSV.sql, modificando a ultima linha para o caminho do arquivo TXT**
2. **Execute o script scriptCriaTabelas.sql, para criar e preencher as tabelas**

Download dos dados e dicionário de Variáveis [aqui].

[aqui]:http://download.inep.gov.br/microdados/Enade_Microdados/microdados_Enade_2017_portal_2018.10.09.zip