:: Sincroniza el tiempo (hora y fecha) de la computadora con el servidor de Windows

@echo off
goto :start


 ______     ______     ______     ______    
/\  ___\   /\  __ \   /\  __ \   /\  ___\   
\ \___  \  \ \  __ \  \ \  __ \  \ \  __\   
 \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\ 
  \/_____/   \/_/\/_/   \/_/\/_/   \/_____/ 
                                            


:start
w32tm /query /peers
sc config w32time start= auto
w32tm /config /syncfromflags:manual /manualpeerlist:"time.windows.com"
w32tm /config /reliable:yes
net stop w32time
net start w32time
w32tm /resync /nowait