

```txt
# -*- coding: utf8 -*-
'''
Sends one email with attachment to each student on a list

Prepare a data file (plain text) with the format:
file1, email1, text1
file2, email2, text2
file3, email3, text3
...

Overwrite the configuration vars below and run this script.
email1 will receive an email with file1 attached, and text1
will replace the format chars %s inside the generic body text
(see example below).
'''

import smtplib
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.encoders import encode_base64
from getpass import getpass

#####################################
############ Datos ##################

my_email = 'your_email@server'
#You can use special chars (é,ñ...) in the body and subject
#The body has a field %s, to be replaced by the the third
#field in the data file
subject='Your assignment corrected'
body ='''Please find your corrected assignment attached.

Your grade is: %s
'''

#path to attached files (ends in /)
attachments_prefix = 'path/to/sws_files/'
#data file
data_file = 'path/to/data.txt'

############# Servidor ##################

smtpserver = 'your.smtp.server'
smtpport = 465
AUTHREQUIRED = 1 # if you need to use SMTP AUTH set to 1
smtpuser = 'you_username_here'  # for SMTP AUTH, set SMTP username here
#password is entered at prompt, for increased security.

##########################################
##########################################

#Abrir el fichero de datos
fich=open(data_file)
data=fich.read()
fich.close()

#conectar al servidor
smtppass = getpass('email password, please:')
server = smtplib.SMTP_SSL(smtpserver, smtpport)
print server.ehlo()

if AUTHREQUIRED:
    print server.login(smtpuser, smtppass)

for linea in data.splitlines():
    linea = linea.replace(' ','')
    try:
        ruta,email,nota = linea.split(',')
    except:
        continue
    print
    print ruta,email,nota

    #MIME multipart message
    msg = MIMEMultipart()
    msg['Subject'] = subject
    msg['To'] = email
    msg['From'] = my_email
    part2 = MIMEText(body%nota, 'plain', 'utf8')
    msg.attach(part2)

    #Attachment
    if ruta:
        file = attachments_prefix + ruta
        part = MIMEBase('application', "octet-stream")
        part.set_payload(open(file,"rb").read())
        part.add_header('Content-Disposition', 'attachment; filename="%s"' % ruta)
        encode_base64(part)
        msg.attach(part)
    
    #Send email
    try:
        smtpresult = server.sendmail(my_email, email, msg.as_string())
        print 'ok'
    except:
        print 'Error sending message to: %s'%email   

server.close()


```