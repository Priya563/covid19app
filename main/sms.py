from core import settings
from twilio.rest import Client
def sendSms():
    message_to_broadcast = ("ALERT: You have been in contact with a covid19 infected person"
                        "\nIf you are feeling ill, or have any COVID symptoms, please do a health check at your nearby health care centres")
    client = Client('AC24565ba335e322034e4bb8de6539146f', '3f30854f46f986adff502145d611911d')
    client.messages.create(to='+918667446075',
                            from_='+19896629724',
                            body=message_to_broadcast)