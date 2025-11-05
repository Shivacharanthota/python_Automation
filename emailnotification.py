import smtplib
from email.mime.text import MIMEText

smtp_server = 'smtp.gmail.com'
port = 587
sender_email = 'shivacharanthota007@gmail.com'
receiver_email = 'shiva523520@gmail.com'
CC_email = 'uttejpendem@gamil.com'
message = 'Hello, This is an automated message'

msg = MIMEText(message)
msg['subject'] = 'Automated Email'
msg['From'] = sender_email
msg['To'] = receiver_email
msg['CC'] = CC_email

with smtplib.SMTP(smtp_server, port) as server:
    server.starttls()

    password = input("Enter ypur gamil password and press enter: ")
    server.login(sender_email, password)

    server.sendmail(sender_email, [receiver_email], msg.as_string())