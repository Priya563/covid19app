

import smtplib
from email.message import EmailMessage


def send_mail(m,name):
    #Setting mail contents
    msg=EmailMessage()
    msg['subject']='Covid 19'
    msg['From']='Covid_19'
    msg['To']=m
    msg.set_content(f'[Notification for close contact with someone who tested positive for COVID]'
                    f'\nWe have been alerted that you were in contact with {name} who has been diagnosed with COVID 19.'
                    f'We are following Centers for Disease Control and Prevention (CDC) recommendations to help ensure that the person diagnosed with or suspected to have COVID-19 follows instructions for isolation and remains away from others until they can safely return to their Home. '
                    f' \nIf you develop any COVID-19 symptoms, please:'
                    f'\n1.Contact nearby healthcare provider immediately.'
                    f'\n2.Follow testing and isolation instructions'
                    f'\n3.Notify  if tested positive for COVID-19.'
                    
    
                    f'\nSincerely,'
                    f'\nAdmin.')

        #logging to the SMTP server
    with smtplib.SMTP(host='smtp.gmail.com', port=587) as server:
        server.starttls()
        server.login('223003087@sastra.ac.in','farveen2002')
            #sending the mail
        server.send_message(msg)
        print("mail sent")
        server.quit()

