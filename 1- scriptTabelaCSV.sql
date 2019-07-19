create schema if not EXISTS enade;

drop table 	IF EXISTS enade.enade;
create table enade.enade(
	id serial NOT NULL,
	--#Instituicao e Curso
	NU_ANO integer,				CO_IES integer,			
	CO_CATEGAD integer,			CO_ORGACAD integer,			
	CO_GRUPO integer,			CO_CURSO integer,
	CO_MODALIDADE integer,		CO_MUNIC_CURSO integer,	
	CO_UF_CURSO integer,		CO_REGIAO_CURSO integer,	

	--#Aluno
	NU_IDADE integer,			TP_SEXO varchar,			ANO_FIM_EM integer,			
	ANO_IN_GRAD integer,		CO_TURNO_GRADUACAO integer,	TP_INSCRICAO_ADM integer,	
	TP_INSCRICAO integer,		

	--#Avaliacao parte Objetiva
	NU_ITEM_OFG integer,		NU_ITEM_OFG_Z integer,		
	NU_ITEM_OFG_X integer,		NU_ITEM_OFG_N integer,
	NU_ITEM_OCE integer,		NU_ITEM_OCE_Z integer,		
	NU_ITEM_OCE_X integer,		NU_ITEM_OCE_N integer,

	--#Vetor Notas
	DS_VT_GAB_OFG_ORIG varchar,	DS_VT_GAB_OFG_FIN varchar,	
	DS_VT_GAB_OCE_ORIG varchar,	DS_VT_GAB_OCE_FIN varchar,	
	DS_VT_ESC_OFG varchar,		DS_VT_ACE_OFG varchar,		
	DS_VT_ESC_OCE varchar,	    DS_VT_ACE_OCE varchar,	 

	--#Presenca
	TP_PRES integer,	   		TP_PR_GER integer,
	TP_PR_OB_FG integer,		TP_PR_DI_FG integer,
	TP_PR_OB_CE integer,	   	TP_PR_DI_CE integer,	    
	TP_SFG_D1 integer,			TP_SFG_D2 integer,	   		
	TP_SCE_D1 integer,	   		TP_SCE_D2 integer,	   		
	TP_SCE_D3 integer,			

	--#Notas
	NT_GER varchar,				NT_FG varchar,				
	NT_OBJ_FG varchar,	 		NT_DIS_FG varchar,	 		
	NT_FG_D1 varchar,			NT_FG_D1_PT varchar,	   
	NT_FG_D1_CT varchar,		NT_FG_D2 varchar,			
	NT_FG_D2_PT varchar,	  	NT_FG_D2_CT varchar,	   	
	NT_CE varchar,	   			NT_OBJ_CE varchar,	
	NT_DIS_CE varchar,			NT_CE_D1 varchar,	   		
	NT_CE_D2 varchar,	   		NT_CE_D3 varchar,			

	--#question Percepcao Prova
	CO_RS_I1 varchar,			CO_RS_I2 varchar,
	CO_RS_I3 varchar,			CO_RS_I4 varchar,			
	CO_RS_I5 varchar,	   		CO_RS_I6 varchar,	  		
	CO_RS_I7 varchar,		 	CO_RS_I8 varchar,
	CO_RS_I9 varchar,			

	--#Questionario Estudante
	QE_I01 varchar,		QE_I02 varchar,	 	QE_I03 varchar,		
	QE_I04 varchar,		QE_I05 varchar, 	QE_I06 varchar,	 
	QE_I07 varchar,		QE_I08 varchar,	 	QE_I09 varchar,		
	QE_I10 varchar,		QE_I11 varchar,		QE_I12 varchar,
	QE_I13 varchar,		QE_I14 varchar,		QE_I15 varchar,		
	QE_I16 varchar,		QE_I17 varchar,		QE_I18 varchar,
	QE_I19 varchar,		QE_I20 varchar,		QE_I21 varchar,		
	QE_I22 varchar,		QE_I23 varchar,		QE_I24 varchar,	
	QE_I25 varchar,		QE_I26 varchar,		QE_I27 varchar,		
	QE_I28 varchar,		QE_I29 varchar,		QE_I30 varchar,	
	QE_I31 varchar,		QE_I32 varchar,		QE_I33 varchar,
	QE_I34 varchar,		QE_I35 varchar,		QE_I36 varchar,
	QE_I37 varchar,		QE_I38 varchar,		QE_I39 varchar,
	QE_I40 varchar,		QE_I41 varchar,		QE_I42 varchar,
	QE_I43 varchar,		QE_I44 varchar,		QE_I45 varchar,
	QE_I46 varchar,		QE_I47 varchar,		QE_I48 varchar,
	QE_I49 varchar,		QE_I50 varchar,		QE_I51 varchar,
	QE_I52 varchar,		QE_I53 varchar,		QE_I54 varchar,
	QE_I55 varchar,		QE_I56 varchar,		QE_I57 varchar,
	QE_I58 varchar,		QE_I59 varchar,		QE_I60 varchar,
	QE_I61 varchar,		QE_I62 varchar,		QE_I63 varchar,
	QE_I64 varchar,		QE_I65 varchar,		QE_I66 varchar,
	QE_I67 varchar,		QE_I68 varchar,		QE_I69 varchar,
	QE_I70 varchar,		QE_I71 varchar,		QE_I72 varchar,
	QE_I73 varchar,		QE_I74 varchar,		QE_I75 varchar,
	QE_I76 varchar,		QE_I77 varchar,		QE_I78 varchar,
	QE_I79 varchar,		QE_I80 varchar,		QE_I81 varchar
);

COPY enade.enade(NU_ANO,CO_IES,CO_CATEGAD,CO_ORGACAD,CO_GRUPO,CO_CURSO,CO_MODALIDADE,CO_MUNIC_CURSO,CO_UF_CURSO,CO_REGIAO_CURSO,NU_IDADE,TP_SEXO,ANO_FIM_EM,ANO_IN_GRAD,CO_TURNO_GRADUACAO,TP_INSCRICAO_ADM,TP_INSCRICAO,NU_ITEM_OFG,NU_ITEM_OFG_Z,NU_ITEM_OFG_X,NU_ITEM_OFG_N,NU_ITEM_OCE,NU_ITEM_OCE_Z,NU_ITEM_OCE_X,NU_ITEM_OCE_N,DS_VT_GAB_OFG_ORIG,DS_VT_GAB_OFG_FIN,DS_VT_GAB_OCE_ORIG,DS_VT_GAB_OCE_FIN,DS_VT_ESC_OFG,DS_VT_ACE_OFG,DS_VT_ESC_OCE,DS_VT_ACE_OCE,TP_PRES,TP_PR_GER,TP_PR_OB_FG,TP_PR_DI_FG,TP_PR_OB_CE,TP_PR_DI_CE,TP_SFG_D1,TP_SFG_D2,TP_SCE_D1,TP_SCE_D2,TP_SCE_D3,NT_GER,NT_FG,NT_OBJ_FG,NT_DIS_FG,NT_FG_D1,NT_FG_D1_PT,NT_FG_D1_CT,NT_FG_D2,NT_FG_D2_PT,NT_FG_D2_CT,NT_CE,NT_OBJ_CE,NT_DIS_CE,NT_CE_D1,NT_CE_D2,NT_CE_D3,CO_RS_I1,CO_RS_I2,CO_RS_I3,CO_RS_I4,CO_RS_I5,CO_RS_I6,CO_RS_I7,CO_RS_I8,CO_RS_I9,QE_I01,QE_I02,QE_I03,QE_I04,QE_I05,QE_I06,QE_I07,QE_I08,QE_I09,QE_I10,QE_I11,QE_I12,QE_I13,QE_I14,QE_I15,QE_I16,QE_I17,QE_I18,QE_I19,QE_I20,QE_I21,QE_I22,QE_I23,QE_I24,QE_I25,QE_I26,QE_I27,QE_I28,QE_I29,QE_I30,QE_I31,QE_I32,QE_I33,QE_I34,QE_I35,QE_I36,QE_I37,QE_I38,QE_I39,QE_I40,QE_I41,QE_I42,QE_I43,QE_I44,QE_I45,QE_I46,QE_I47,QE_I48,QE_I49,QE_I50,QE_I51,QE_I52,QE_I53,QE_I54,QE_I55,QE_I56,QE_I57,QE_I58,QE_I59,QE_I60,QE_I61,QE_I62,QE_I63,QE_I64,QE_I65,QE_I66,QE_I67,QE_I68,QE_I69,QE_I70,QE_I71,QE_I72,QE_I73,QE_I74,QE_I75,QE_I76,QE_I77,QE_I78,QE_I79,QE_I80,QE_I81) 
FROM '/home/tuchinski/Documentos/UTFPR/LabBancoDados/apsFinal/microdados_Enade_2017_portal_2018.10.09/MICRODADOS_ENADE_2017.txt' DELIMITER ';' CSV HEADER;
