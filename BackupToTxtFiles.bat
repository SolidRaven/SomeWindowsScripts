::Este .bat puede usarse con cualquier tipo de archivo si lo que se quiere es obtener los nombres de todos los archivos 
::de un fichero.

@echo off
goto :start

 ______     ______     ______     ______    
/\  ___\   /\  __ \   /\  __ \   /\  ___\   
\ \___  \  \ \  __ \  \ \  __ \  \ \  __\   
 \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\ 
  \/_____/   \/_/\/_/   \/_/\/_/   \/_____/ 
                                            


:start

title BackupToTxtFiles

color 0B

timeout 5 /nobreak

cd C:\Users\Carpeta\...

:: Esta linea solo lista los nombres de los archivos y los ordena alfabéticamente. /b es para formato simple. /o es para 
:: listar elementos en cierto orden. ':n' junto con el anterior es para el orden alfabético. 

dir/b/o:n > C:\Users\Carpeta\...archivo.txt

cd C:\Users\Carpeta2\...

dir/b/o:n > C:\Users\Carpeta\...archivo2.txt

exit