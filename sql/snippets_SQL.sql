
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

/********************INSERT**************/


INSERT INTO NombreNuevaTabla
SELECT 
Campos....
FROM TablaOrigen


/********************Convertir fecha como ID (20190101)**************/


(SELECT CONVERT(VARCHAR(10), fecha, 112))





/********************UNPIVOT**************/
Select 
Campo1,/*Campos que se mantienen como estaticos*/
CAmpoN../*Campos que se mantienen como estaticos*/
Fecha/*Nombre de Campo Donde Almacenaremos las Fecha 'Este Campo No existe en la Tabla'*/
Valor /*Nombre de Campo Donde Almacenaremos los Valores 'Este Campo No existe en la Tabla'*/
Into Bi_Compe_Conso_Gral_Mdellin_UNP /*Tabla a donde llevaremos los datos*/
from Bi_Compe_Conso_Gral_Mdellin
UNPIVOT
(
Valor /*Nombre del campo donde se almacenaran los valores 'Lo creamos en el Select'*/
FOR
Fecha IN /*Este es el campo que se creo para almacenar las fecha*/
(
/*Nombre de los encabezados de Columnas que vamos a Trasponer*/
[02 01 2019],
[08 01 2019],
[08 01 2019]...
)
)AS p