
/*******Identificar Data Duplicada************/
Select 
Campo1,
Campo2,
CampoN,
COUNT(*)
from MyTable 
group by 
Campo1,
Campo2,
CampoN
HAVING COUNT(*) > 1

/*******Bulk Insert************/


BULK INSERT tablaDestiono
FROM 'C:\Users\apineda\Documents\tableroDia.txt' /*Ruta*/
WITH ( FIELDTERMINATOR= '|', ROWTERMINATOR = '\n',FIRSTROW = 1)


/********************Caracteres Especiales**************/

DECLARE @Caracteres VARCHAR(255)
DECLARE @CORRIGE VARCHAR(255)
SET @Caracteres = 'ณพข;,.•ด>ฅ()<&\ก!?#:$%[_*{}+”"“,.กร'+'"'
BEGIN
WHILE @CORRIGE
LIKE '%['+@Caracteres+']%'
SET @CORRIGE = (SELECT  NombreCampo FROM  NombreTabla)
UPDATE NombreTabla
SET NombreCampo = REPLACE(NombreCampo,SUBSTRING(NombreCampo,PATINDEX('%['+@Caracteres+']%',NombreCampo),1),'')
WHERE NombreCampo LIKE '%['+@Caracteres+']%'