

:: Para ejecuar el script debes estar en la carpeta donde lo guardaste.
:: Uso en terminal. C:\Users\User\Carpeta...\...> SendBackup.bat "Cuenta de Outlook" "Contraseña de la cuenta" "Ruta del archivo adjunto 1" "Ruta del archivo adjunto 2"
:: Las rutas de los archivos adjuntos deben ser las rutas completas.
:: Para añadir más archivos adjuntos y más destinatarios, añada las variables que necesite y las referencias a las mismas (en donde sea requerido).

@ECHO OFF

SET Account=%~1
SET Password=%~2
SET Attachment=%~3
SET Attachment2=%~4

CALL :PowerShell
CD /D "%PowerShellDir%"
Powershell -ExecutionPolicy Bypass -Command "& '%PSScript%' '%Account%' '%Password%' '%Attachment%' '%Attachment2%'"
EXIT

:PowerShell
SET PowerShellDir=C:\Windows\System32\WindowsPowerShell\v1.0
SET PSScript=%temp%\~tmpSendeMail.ps1
IF EXIST "%PSScript%" DEL /Q /F "%PSScript%"

ECHO $Username      = $args[0]>> "%PSScript%"
ECHO $EmailPassword = $args[1]>> "%PSScript%" 
ECHO $Attachment    = $args[2]>> "%PSScript%"
ECHO $Attachment2    = $args[3]>> "%PSScript%"
ECHO                          >> "%PSScript%"
ECHO $Username    = $Username                 >> "%PSScript%"

:: En la variable EmailTo va el correo del destinatario.

ECHO $EmailTo     = "E-Mail" >> "%PSScript%"

:: Debido a que el objeto 'System.Net.Mail.MailMessage' solo acepta direcciones de correo válidas, la variable EmailFrom debe ser el correo
:: del remitente.     

ECHO $EmailFrom   = "E-Mail" >> "%PSScript%"

:: La variable Subject es el asunto.

ECHO $Subject     = "Subject"           >> "%PSScript%"

:: La variable Body es el cuerpo del texto.

ECHO $Body        = "Text"              >> "%PSScript%"

:: La variable SMTPServer es el servicio de correo a usar. 

ECHO $SMTPServer  = "smtp.outlook.com"          >> "%PSScript%"
ECHO $SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom, $EmailTo, $Subject, $Body) >> "%PSScript%"
ECHO $Attachment  = New-Object System.Net.Mail.Attachment($Attachment)                            >> "%PSScript%"
ECHO $Attachment2  = New-Object System.Net.Mail.Attachment($Attachment2)                            >> "%PSScript%"
ECHO $SMTPMessage.Attachments.Add($Attachment)                                                    >> "%PSScript%"
ECHO $SMTPMessage.Attachments.Add($Attachment2)                                                    >> "%PSScript%"
ECHO $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)                               >> "%PSScript%"
ECHO $SMTPClient.EnableSsl = $true                                                                >> "%PSScript%"
ECHO $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($Username, $EmailPassword) >> "%PSScript%"
ECHO $SMTPClient.Send($SMTPMessage)                                                               >> "%PSScript%"
GOTO :EOF



