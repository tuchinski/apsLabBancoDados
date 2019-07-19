-- -----------------------------------------------------
-- Table catAdmininstrativa
-- -----------------------------------------------------
create table if not exists enade.catAdmininstrativa (
  CO_CATEGAD INT NOT NULL,
  DESCRICAO VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (CO_CATEGAD))
;

insert into enade.catAdmininstrativa (CO_CATEGAD,  DESCRICAO ) values 
(1, 'Publica Federal'),
(2, 'Publica Estadual'),
(3, 'Publica Municipal'),
(4, 'Privada com fins lucrativos'),
(5, 'Privada sem fins lucrativos'),
(7, 'Especial');

-- -----------------------------------------------------
-- Table orgAcademica
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.orgAcademica (
  CO_ORGACAD INT NOT NULL,
  DESCRICAO VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (CO_ORGACAD))
;

insert into enade.orgAcademica (CO_ORGACAD, DESCRICAO) values
(10019, 'Centro Federal de Educação Tecnológica'),
(10020, 'Centro Universitário'),
(10022, 'Faculdade'),
(10026, 'Instituto Federal de Educação, Ciência e Tecnologia'),
(10028, 'Universidade');
-- -----------------------------------------------------
-- Table instituicao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.instituicao (
  CO_IES INT NOT NULL,
  categoria_CO_CATEGAD INT NOT NULL,
  orgAcademica_CO_ORGACAD INT NOT NULL,
  PRIMARY KEY (CO_IES),
    FOREIGN KEY (categoria_CO_CATEGAD)
    REFERENCES enade.catAdmininstrativa (CO_CATEGAD)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (orgAcademica_CO_ORGACAD)
    REFERENCES enade.orgAcademica (CO_ORGACAD)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

insert into enade.instituicao(co_ies, categoria_co_categad, orgacademica_co_orgacad)
select DISTINCT co_ies, co_categad, co_orgacad from enade.enade;

-- -----------------------------------------------------
-- Table regiao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.regiao (
  CO_REGIAO INT NOT NULL,
  NOME_REGIAO VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (CO_REGIAO))
;

insert into enade.regiao (CO_REGIAO, NOME_REGIAO) values
(1,'Norte'),
(2,'Nordeste'),
(3,'Sudeste'),
(4,'Sul'),
(5, 'Centro-Oeste');


-- -----------------------------------------------------
-- Table uf_curso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.uf_curso (
  CO_UF_CURSO INT NOT NULL,
  NOME VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (CO_UF_CURSO))
;


insert into enade.uf_curso  (CO_UF_CURSO, NOME) values
(11,'Rondônia (RO)'),      (12, 'Acre (AC)'),         (13, 'Amazonas (AM)'),                            
(14, 'Roraima (RR)'),      (15, 'Pará (PA)'),         (16, 'Amapa (AP)'),                                    
(17, 'Tocantins (TO)'),    (21, 'Maranhão (MA)'),       (22, 'Piauí (PI)'),                                           
(23, 'Ceará (CE)'),      (24, 'Rio Grande do Norte (RN)'),  (25, 'Paraíba (PB)'),                                     
(26, 'Pernambuco (PE)'),   (27, 'Alagoas (AL)'),        (28, 'Sergipe (SE)'),
(29, 'Bahia (BA)'),        (31, 'Minas gerais (MG)'),         (32, 'Espírito santo (ES)'),
(33, 'Rio de janeiro (RJ)'), (35, 'São paulo (SP)'),        (41, 'Paraná (PR)'),
(42, 'Santa catarina (SC)'), (43, 'Rio grande do sul (RS)'),  (50, 'Mato grosso do sul (MS)'),
(51, 'Mato grosso (MT)'),    (52, 'Goiás (GO)'),          (53, 'Distrito federal (DF)');


-- -----------------------------------------------------
-- Table municipio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.municipio (
  CO_MUNIC_CURSO INT NOT NULL,
  NOME VARCHAR(60) NULL DEFAULT NULL,
  regiao_CO_REGIAO INT NOT NULL,
  uf_curso_CO_UF_CURSO INT NOT NULL,
  PRIMARY KEY (CO_MUNIC_CURSO),
    FOREIGN KEY (regiao_CO_REGIAO)
    REFERENCES enade.regiao (CO_REGIAO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (uf_curso_CO_UF_CURSO)
    REFERENCES enade.uf_curso (CO_UF_CURSO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

insert into enade.municipio(co_munic_curso, regiao_co_regiao, uf_curso_co_uf_curso)
select DISTINCT co_munic_curso, co_regiao_curso, co_uf_curso from enade.enade;
-- -----------------------------------------------------
-- Table grupo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.grupo (
  CO_GRUPO INT NOT NULL,
  AREA VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (CO_GRUPO))
;


insert into enade.grupo (CO_GRUPO, AREA) values 

('21', 'Arquitetura e Urbanismo'),
('72', 'Tecnologia em Análise e Desenvolvimento de Sistemas'),
('76', 'Tecnologia em Gestão da Produção Industrial'),
('79', 'Tecnologia em Redes de Computadores'),
('701', 'Matemática (Bacharelado)'),
('702', 'Matemática (Licenciatura)'),
('903', 'Letras-Português (Bacharelado)'),
('904', 'Letras-Português (Licenciatura)'),
('905', 'Letras-Português e Inglês (Licenciatura)'),
('906', 'Letras-Português e Espanhol (Licenciatura)'),
('1401', 'Física (Bacharelado)'),
('1402', 'Física (Licenciatura)'),
('1501', 'Química (Bacharelado)'),
('1502', 'Química (Licenciatura)'),
('1601', 'Ciências Biológicas (Bacharelado)'),
('1602', 'Ciências Biológicas (Licenciatura)'),
('2001', 'Pedagogia (Licenciatura)'),
('2401', 'História (Bacharelado)'),
('2402', 'História (Licenciatura)'),
('2501', 'Artes Visuais (Licenciatura)'),
('3001', 'Geografia (Bacharelado)'),
('3002', 'Geografia (Licenciatura)'),
('3201', 'Filosofia (Bacharelado)'),
('3202', 'Filosofia (Licenciatura)'),
('3502', 'Educação Física (Licenciatura) '),
('4003', 'Engenharia Da Computação'),
('4004', 'Ciência Da Computação (Bacharelado)'),
('4005', 'Ciência Da Computação (Licenciatura)'),
('4006', 'Sistemas De Informação'),
('4301', 'Música (Licenciatura)'),
('5401', 'Ciências Sociais (Bacharelado)'),
('5402', 'Ciências Sociais (Licenciatura)'),
('5710', 'Engenharia Civil'),
('5806', 'Engenharia Elétrica'),
('5814', 'Engenharia de Controle e Automação'),
('5902', 'Engenharia Mecânica'),
('6002', 'Engenharia de Alimentos'),
('6008', 'Engenharia Química'),
('6208', 'Engenharia de Produção'),
('6306', 'Engenharia'),
('6307', 'Engenharia Ambiental'),
('6405', 'Engenharia Florestal'),
('6407', 'Letras - Inglês'),
('6409', 'Tecnologia em Gestão da Tecnologia da Informação');



-- -----------------------------------------------------
-- Table modalidade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.modalidade (
  CO_MODALIDADE INT NOT NULL,
  TIPO VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (CO_MODALIDADE))
;

insert into enade.modalidade (CO_MODALIDADE, TIPO) values
  (0, 'EaD'), 
  (1, 'Presencial');

-- -----------------------------------------------------
-- Table curso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.curso (
  CO_CURSO INT NOT NULL,
  CO_GRUPO INT NOT NULL,
  modalidade_CO_MODALIDADE INT NOT NULL,
  PRIMARY KEY (CO_CURSO),
    FOREIGN KEY (CO_GRUPO)
    REFERENCES enade.grupo (CO_GRUPO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (modalidade_CO_MODALIDADE)
    REFERENCES enade.modalidade (CO_MODALIDADE)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

insert into enade.curso(co_curso, co_grupo,modalidade_co_modalidade)
select DISTINCT co_curso, co_grupo,co_modalidade from enade.enade;



-- -----------------------------------------------------
-- Table curso_has_municipio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.curso_has_municipio (
  curso_CO_CURSO INT NOT NULL,
  municipio_CO_MUNIC_CURSO INT NOT NULL,
  PRIMARY KEY (curso_CO_CURSO, municipio_CO_MUNIC_CURSO),
    FOREIGN KEY (curso_CO_CURSO)
    REFERENCES enade.curso (CO_CURSO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (municipio_CO_MUNIC_CURSO)
    REFERENCES enade.municipio (CO_MUNIC_CURSO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

insert into enade.curso_has_municipio(curso_CO_CURSO,municipio_CO_MUNIC_CURSO)
select DISTINCT CO_CURSO, CO_MUNIC_CURSO from enade.enade;




-- -----------------------------------------------------
-- Table instituicao_has_curso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.instituicao_has_curso (
  instituicao_COD_IES INT NOT NULL,
  curso_COD_CURSO INT NOT NULL,
  PRIMARY KEY (instituicao_COD_IES, curso_COD_CURSO),
    FOREIGN KEY (instituicao_COD_IES)
    REFERENCES enade.instituicao (CO_IES)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (curso_COD_CURSO)
    REFERENCES enade.curso (CO_CURSO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

insert into enade.instituicao_has_curso(instituicao_cod_ies, curso_cod_curso)
select DISTINCT co_ies, co_curso from enade.enade;






-- -----------------------------------------------------
-- Table estudante
-- ---------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.estudante (
  COD_ESTUDANTE INT NOT NULL,
  NU_ANO INT NULL,
  NU_IDADE INT NULL DEFAULT NULL,
  TP_SEXO CHAR NULL DEFAULT NULL,
  ANO_FIM_EM INT NULL DEFAULT NULL,
  ANO_IN_GRAD INT NULL DEFAULT NULL,
  CO_TURNO_GRADUACAO INT DEFAULT NULL,
  TP_INSCRICAO_ADM INT NULL DEFAULT NULL,
  TP_INSCRICAO INT NULL DEFAULT NULL,
  instituicao_has_curso_instituicao_COD_IES INT NOT NULL,
  instituicao_has_curso_curso_COD_CURSO INT NOT NULL,
  PRIMARY KEY (COD_ESTUDANTE),
    FOREIGN KEY (instituicao_has_curso_instituicao_COD_IES , instituicao_has_curso_curso_COD_CURSO)
    REFERENCES enade.instituicao_has_curso (instituicao_COD_IES , curso_COD_CURSO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

insert into enade.estudante (COD_ESTUDANTE,nu_ano, nu_idade, tp_sexo, ano_fim_em, ano_in_grad, co_turno_graduacao,tp_inscricao_adm, tp_inscricao, 
            instituicao_has_curso_curso_cod_curso, instituicao_has_curso_instituicao_cod_ies)

select  id,nu_ano, nu_idade, tp_sexo, ano_fim_em, ano_in_grad, co_turno_graduacao, tp_inscricao_adm, tp_inscricao, 
             co_curso, co_ies   from enade.enade
;


-- -----------------------------------------------------
-- Table notas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.notas (
  estudante_COD_ESTUDANTE INT NOT NULL,
  NT_GER VARCHAR(60) NULL DEFAULT NULL,
  NT_FG VARCHAR(60) NULL DEFAULT NULL,
  NT_OBJ_FG VARCHAR(60) NULL DEFAULT NULL,
  NT_DIS_FG VARCHAR(60) NULL DEFAULT NULL,
  NT_FG_D1 VARCHAR(60) NULL DEFAULT NULL,
  NT_FG_D1_PT VARCHAR(60) NULL DEFAULT NULL,
  NT_FG_D1_CT VARCHAR(60) NULL DEFAULT NULL,
  NT_FG_D2 VARCHAR(60) NULL DEFAULT NULL,
  NT_FG_D2_PT VARCHAR(60) NULL DEFAULT NULL,
  NT_FG_D2_CT VARCHAR(60) NULL DEFAULT NULL,
  NT_CE VARCHAR(60) NULL DEFAULT NULL,
  NT_OBJ_CE VARCHAR(60) NULL DEFAULT NULL,
  NT_DIS_CE VARCHAR(60) NULL DEFAULT NULL,
  NT_CE_D1 VARCHAR(60) NULL DEFAULT NULL,
  NT_CE_D2 VARCHAR(60) NULL DEFAULT NULL,
  NT_CE_D3 VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (estudante_COD_ESTUDANTE),
    FOREIGN KEY (estudante_COD_ESTUDANTE)
    REFERENCES enade.estudante (COD_ESTUDANTE)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

INSERT into enade.notas (
   estudante_COD_ESTUDANTE,  NT_GER,  NT_FG,  NT_OBJ_FG, NT_DIS_FG,  NT_FG_D1,
    NT_FG_D1_PT,  NT_FG_D1_CT,  NT_FG_D2, NT_FG_D2_PT, NT_FG_D2_CT,  NT_CE,
   NT_OBJ_CE,  NT_DIS_CE,  NT_CE_D1,  NT_CE_D2,  NT_CE_D3)

select id, NT_GER,  NT_FG,  NT_OBJ_FG, NT_DIS_FG,  NT_FG_D1,
   NT_FG_D1_PT,  NT_FG_D1_CT,  NT_FG_D2, NT_FG_D2_PT, NT_FG_D2_CT,  NT_CE,
   NT_OBJ_CE,  NT_DIS_CE,  NT_CE_D1,  NT_CE_D2,  NT_CE_D3 from enade.enade;


-- -----------------------------------------------------
-- Table vetor_notas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.vetor_notas (
  estudante_COD_ESTUDANTE INT NOT NULL,
  DS_VT_GAB_OFG_ORIG VARCHAR NULL DEFAULT NULL,
  DS_VT_GAB_OFG_FIN VARCHAR NULL DEFAULT NULL,
  DS_VT_GAB_OCE_ORIG VARCHAR NULL DEFAULT NULL,
  DS_VT_GAB_OCE_FIN VARCHAR NULL DEFAULT NULL,
  DS_VT_ESC_OFG VARCHAR NULL DEFAULT NULL,
  DS_VT_ACE_OFG VARCHAR NULL DEFAULT NULL,
  DS_VT_ESC_OCE VARCHAR NULL DEFAULT NULL,
  DS_VT_ACE_OCE VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (estudante_COD_ESTUDANTE),
    FOREIGN KEY (estudante_COD_ESTUDANTE)
    REFERENCES enade.estudante (COD_ESTUDANTE)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
insert into enade.vetor_notas(estudante_COD_ESTUDANTE, DS_VT_GAB_OFG_ORIG, DS_VT_GAB_OFG_FIN,
 DS_VT_GAB_OCE_ORIG, DS_VT_GAB_OCE_FIN, DS_VT_ESC_OFG, DS_VT_ACE_OFG, DS_VT_ESC_OCE,
 DS_VT_ACE_OCE)

select id, DS_VT_GAB_OFG_ORIG, DS_VT_GAB_OFG_FIN,
 DS_VT_GAB_OCE_ORIG, DS_VT_GAB_OCE_FIN, DS_VT_ESC_OFG, DS_VT_ACE_OFG, DS_VT_ESC_OCE,
 DS_VT_ACE_OCE from enade.enade;



-- -----------------------------------------------------
-- Table avaliacao_parte_objetiva
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.avaliacao_parte_objetiva (
  estudante_COD_ESTUDANTE INT NOT NULL,
  NU_ITEM_OFG INT NULL DEFAULT NULL,
  NU_ITEM_OFG_Z INT NULL DEFAULT NULL,
  NU_ITEM_OFG_X INT NULL DEFAULT NULL,
  NU_ITEM_OFG_N INT NULL DEFAULT NULL,
  NU_ITEM_OCE INT NULL DEFAULT NULL,
  NU_ITEM_OCE_Z INT NULL DEFAULT NULL,
  NU_ITEM_OCE_X INT NULL DEFAULT NULL,
  NU_ITEM_OCE_N INT NULL DEFAULT NULL,
  PRIMARY KEY (estudante_COD_ESTUDANTE),
    FOREIGN KEY (estudante_COD_ESTUDANTE)
    REFERENCES enade.estudante (COD_ESTUDANTE)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

insert into enade.avaliacao_parte_objetiva (estudante_COD_ESTUDANTE, NU_ITEM_OFG,
  NU_ITEM_OFG_Z,  NU_ITEM_OFG_X,  NU_ITEM_OFG_N,  NU_ITEM_OCE,  NU_ITEM_OCE_Z,
  NU_ITEM_OCE_X,  NU_ITEM_OCE_N )

select id,  NU_ITEM_OFG,
  NU_ITEM_OFG_Z,  NU_ITEM_OFG_X,  NU_ITEM_OFG_N,  NU_ITEM_OCE,  NU_ITEM_OCE_Z,
  NU_ITEM_OCE_X,  NU_ITEM_OCE_N from enade.enade;





-- -----------------------------------------------------
-- Table presenca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.presenca (
  estudante_COD_ESTUDANTE INT NOT NULL,
  TP_PRES INT NULL DEFAULT NULL,
  TP_PR_GER INT NULL DEFAULT NULL,
  TP_PR_OB_FG INT NULL DEFAULT NULL,
  TP_PR_DI_FG INT NULL DEFAULT NULL,
  TP_PR_OB_CE INT NULL DEFAULT NULL,
  TP_PR_DI_CE INT NULL DEFAULT NULL,
  PRIMARY KEY (estudante_COD_ESTUDANTE),
    FOREIGN KEY (estudante_COD_ESTUDANTE)
    REFERENCES enade.estudante (COD_ESTUDANTE)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

insert into enade.presenca (estudante_COD_ESTUDANTE, TP_PRES , TP_PR_GER,
  TP_PR_OB_FG,  TP_PR_DI_FG,  TP_PR_OB_CE,  TP_PR_DI_CE )

select id,  TP_PRES , TP_PR_GER,
  TP_PR_OB_FG,  TP_PR_DI_FG,  TP_PR_OB_CE,  TP_PR_DI_CE from enade.enade;


-- -----------------------------------------------------
-- Table situacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.situacao (
  estudante_COD_ESTUDANTE INT NOT NULL,
  TP_SFG_D1 INT NULL DEFAULT NULL,
  TP_SFG_D2 INT NULL DEFAULT NULL,
  TP_SCE_D1 INT NULL DEFAULT NULL,
  TP_SCE_D2 INT NULL DEFAULT NULL,
  TP_SCE_D3 INT NULL DEFAULT NULL,
  PRIMARY KEY (estudante_COD_ESTUDANTE),
    FOREIGN KEY (estudante_COD_ESTUDANTE)
    REFERENCES enade.estudante (COD_ESTUDANTE)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

insert into enade.situacao (estudante_COD_ESTUDANTE,  TP_SFG_D1 ,
  TP_SFG_D2,  TP_SCE_D1,  TP_SCE_D2,  TP_SCE_D3)

select id,  TP_SFG_D1 ,
  TP_SFG_D2,  TP_SCE_D1,  TP_SCE_D2,  TP_SCE_D3 from enade.enade;

-- -----------------------------------------------------
-- Table quest_percep_prova
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.quest_percep_prova (
  estudante_COD_ESTUDANTE INT NOT NULL,
  CO_RS_I1 VARCHAR(60) NULL DEFAULT NULL,
  CO_RS_I2 VARCHAR(60) NULL DEFAULT NULL,
  CO_RS_I3 VARCHAR(60) NULL DEFAULT NULL,
  CO_RS_I4 VARCHAR(60) NULL DEFAULT NULL,
  CO_RS_I5 VARCHAR(60) NULL DEFAULT NULL,
  CO_RS_I6 VARCHAR(60) NULL DEFAULT NULL,
  CO_RS_I7 VARCHAR(60) NULL DEFAULT NULL,
  CO_RS_I8 VARCHAR(60) NULL DEFAULT NULL,
  CO_RS_I9 VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (estudante_COD_ESTUDANTE),
    FOREIGN KEY (estudante_COD_ESTUDANTE)
    REFERENCES enade.estudante (COD_ESTUDANTE)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;



insert into enade.quest_percep_prova (estudante_COD_ESTUDANTE,  CO_RS_I1,
  CO_RS_I2,  CO_RS_I3,  CO_RS_I4,  CO_RS_I5,  CO_RS_I6,  CO_RS_I7,
  CO_RS_I8,  CO_RS_I9 )

select id,  CO_RS_I1,
  CO_RS_I2,  CO_RS_I3,  CO_RS_I4,  CO_RS_I5,  CO_RS_I6,  CO_RS_I7,
  CO_RS_I8,  CO_RS_I9 from enade.enade;

-- -----------------------------------------------------
-- Table questionario_estudante
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS enade.questionario_estudante (
  estudante_COD_ESTUDANTE INT NOT NULL,
  QE_I01 VARCHAR NULL DEFAULT NULL,
  QE_I02 VARCHAR NULL DEFAULT NULL,
  QE_I03 VARCHAR NULL DEFAULT NULL,
  QE_I04 VARCHAR NULL DEFAULT NULL,
  QE_I05 VARCHAR NULL DEFAULT NULL,
  QE_I06 VARCHAR NULL DEFAULT NULL,
  QE_I07 VARCHAR NULL DEFAULT NULL,
  QE_I08 VARCHAR NULL DEFAULT NULL,
  QE_I09 VARCHAR NULL DEFAULT NULL,
  QE_I10 VARCHAR NULL DEFAULT NULL,
  QE_I11 VARCHAR NULL DEFAULT NULL,
  QE_I12 VARCHAR NULL DEFAULT NULL,
  QE_I13 VARCHAR NULL DEFAULT NULL,
  QE_I14 VARCHAR NULL DEFAULT NULL,
  QE_I15 VARCHAR NULL DEFAULT NULL,
  QE_I16 VARCHAR NULL DEFAULT NULL,
  QE_I17 VARCHAR NULL DEFAULT NULL,
  QE_I18 VARCHAR NULL DEFAULT NULL,
  QE_I19 VARCHAR NULL DEFAULT NULL,
  QE_I20 VARCHAR NULL DEFAULT NULL,
  QE_I21 VARCHAR NULL DEFAULT NULL,
  QE_I22 VARCHAR NULL DEFAULT NULL,
  QE_I23 VARCHAR NULL DEFAULT NULL,
  QE_I24 VARCHAR NULL DEFAULT NULL,
  QE_I25 VARCHAR NULL DEFAULT NULL,
  QE_I26 VARCHAR NULL DEFAULT NULL,
  QE_I27 VARCHAR NULL DEFAULT NULL,
  QE_I28 VARCHAR NULL DEFAULT NULL,
  QE_I29 VARCHAR NULL DEFAULT NULL,
  QE_I30 VARCHAR NULL DEFAULT NULL,
  QE_I31 VARCHAR NULL DEFAULT NULL,
  QE_I32 VARCHAR NULL DEFAULT NULL,
  QE_I33 VARCHAR NULL DEFAULT NULL,
  QE_I34 VARCHAR NULL DEFAULT NULL,
  QE_I35 VARCHAR NULL DEFAULT NULL,
  QE_I36 VARCHAR NULL DEFAULT NULL,
  QE_I37 VARCHAR NULL DEFAULT NULL,
  QE_I38 VARCHAR NULL DEFAULT NULL,
  QE_I39 VARCHAR NULL DEFAULT NULL,
  QE_I40 VARCHAR NULL DEFAULT NULL,
  QE_I41 VARCHAR NULL DEFAULT NULL,
  QE_I42 VARCHAR NULL DEFAULT NULL,
  QE_I43 VARCHAR NULL DEFAULT NULL,
  QE_I44 VARCHAR NULL DEFAULT NULL,
  QE_I45 VARCHAR NULL DEFAULT NULL,
  QE_I46 VARCHAR NULL DEFAULT NULL,
  QE_I47 VARCHAR NULL DEFAULT NULL,
  QE_I48 VARCHAR NULL DEFAULT NULL,
  QE_I49 VARCHAR NULL DEFAULT NULL,
  QE_I50 VARCHAR NULL DEFAULT NULL,
  QE_I51 VARCHAR NULL DEFAULT NULL,
  QE_I52 VARCHAR NULL DEFAULT NULL,
  QE_I53 VARCHAR NULL DEFAULT NULL,
  QE_I54 VARCHAR NULL DEFAULT NULL,
  QE_I55 VARCHAR NULL DEFAULT NULL,
  QE_I56 VARCHAR NULL DEFAULT NULL,
  QE_I57 VARCHAR NULL DEFAULT NULL,
  QE_I58 VARCHAR NULL DEFAULT NULL,
  QE_I59 VARCHAR NULL DEFAULT NULL,
  QE_I60 VARCHAR NULL DEFAULT NULL,
  QE_I61 VARCHAR NULL DEFAULT NULL,
  QE_I62 VARCHAR NULL DEFAULT NULL,
  QE_I63 VARCHAR NULL DEFAULT NULL,
  QE_I64 VARCHAR NULL DEFAULT NULL,
  QE_I65 VARCHAR NULL DEFAULT NULL,
  QE_I66 VARCHAR NULL DEFAULT NULL,
  QE_I67 VARCHAR NULL DEFAULT NULL,
  QE_I68 VARCHAR NULL DEFAULT NULL,
  QE_I69 VARCHAR NULL DEFAULT NULL,
  QE_I70 VARCHAR NULL DEFAULT NULL,
  QE_I71 VARCHAR NULL DEFAULT NULL,
  QE_I72 VARCHAR NULL DEFAULT NULL,
  QE_I73 VARCHAR NULL DEFAULT NULL,
  QE_I74 VARCHAR NULL DEFAULT NULL,
  QE_I75 VARCHAR NULL DEFAULT NULL,
  QE_I76 VARCHAR NULL DEFAULT NULL,
  QE_I77 VARCHAR NULL DEFAULT NULL,
  QE_I78 VARCHAR NULL DEFAULT NULL,
  QE_I79 VARCHAR NULL DEFAULT NULL,
  QE_I80 VARCHAR NULL DEFAULT NULL,
  QE_I81 VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (estudante_COD_ESTUDANTE),
    FOREIGN KEY (estudante_COD_ESTUDANTE)
    REFERENCES enade.estudante (COD_ESTUDANTE)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

insert into enade.questionario_estudante (estudante_COD_ESTUDANTE,  
  QE_I01,  QE_I02,  QE_I03,  QE_I04,  QE_I05,  QE_I06,  QE_I07,
  QE_I08,  QE_I09,  QE_I10,  QE_I11,  QE_I12,  QE_I13,  QE_I14,  QE_I15,
  QE_I16,  QE_I17,  QE_I18,  QE_I19,  QE_I20,  QE_I21,  QE_I22,  QE_I23,
  QE_I24,  QE_I25,  QE_I26,  QE_I27,  QE_I28,  QE_I29,  QE_I30,  QE_I31,
  QE_I32,  QE_I33,  QE_I34,  QE_I35,  QE_I36,  QE_I37,  QE_I38,  QE_I39,
  QE_I40,  QE_I41,  QE_I42,  QE_I43,  QE_I44,  QE_I45,  QE_I46,  QE_I47,
  QE_I48,  QE_I49,  QE_I50,  QE_I51,  QE_I52,  QE_I53,  QE_I54,  QE_I55,
  QE_I56,  QE_I57,  QE_I58,  QE_I59,  QE_I60,  QE_I61,  QE_I62,  QE_I63,
  QE_I64,  QE_I65,  QE_I66,  QE_I67,  QE_I68,  QE_I69,  QE_I70,  QE_I71,
  QE_I72,  QE_I73,  QE_I74,  QE_I75,  QE_I76,  QE_I77,  QE_I78,  QE_I79,
  QE_I80,  QE_I81 )

select id,  QE_I01,  QE_I02,  QE_I03,  QE_I04,  QE_I05,  QE_I06,  QE_I07,
  QE_I08,  QE_I09,  QE_I10,  QE_I11,  QE_I12,  QE_I13,  QE_I14,  QE_I15,
  QE_I16,  QE_I17,  QE_I18,  QE_I19,  QE_I20,  QE_I21,  QE_I22,  QE_I23,
  QE_I24,  QE_I25,  QE_I26,  QE_I27,  QE_I28,  QE_I29,  QE_I30,  QE_I31,
  QE_I32,  QE_I33,  QE_I34,  QE_I35,  QE_I36,  QE_I37,  QE_I38,  QE_I39,
  QE_I40,  QE_I41,  QE_I42,  QE_I43,  QE_I44,  QE_I45,  QE_I46,  QE_I47,
  QE_I48,  QE_I49,  QE_I50,  QE_I51,  QE_I52,  QE_I53,  QE_I54,  QE_I55,
  QE_I56,  QE_I57,  QE_I58,  QE_I59,  QE_I60,  QE_I61,  QE_I62,  QE_I63,
  QE_I64,  QE_I65,  QE_I66,  QE_I67,  QE_I68,  QE_I69,  QE_I70,  QE_I71,
  QE_I72,  QE_I73,  QE_I74,  QE_I75,  QE_I76,  QE_I77,  QE_I78,  QE_I79,
  QE_I80,  QE_I81  from enade.enade;

/*
select *
from estudante as e, situacao as s
where   e.instituicao_has_curso_instituicao_COD_IES = 588 and
  e.instituicao_has_curso_curso_COD_CURSO = 1164656
  and e.cod_estudante = s.estudante_cod_estudante*/