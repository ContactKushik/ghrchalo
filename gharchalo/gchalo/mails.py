from django.conf import settings
from django.core.mail import send_mail
from twilio.rest import Client
from django.conf import settings
# from decouple import config
def student_verification_token(email,token):
    try:
        subject="Verify your Account"
        message= f'Click on the link to verify: http://127.0.0.1:8000/gchalo/studentverifyemail/{token}/'
        email_from=settings.EMAIL_HOST_USER
        recipient_list=[email,]
        send_mail(subject,message,email_from,recipient_list)

    except Exception as e:
        return False

    return True

def admin_verification_token(token):
    try:
        subject="Verify Admin Account"
        message= f'Click on the link to verify: http://127.0.0.1:8000/gchalo/adminverifyemail/{token}/'
        email_from=settings.EMAIL_HOST_USER
        recipient_list=['hamzasanwala31@gmail.com','kushiksahu51@gmail.com']
        send_mail(subject,message,email_from,recipient_list)

    except Exception as e:
        return False

    return True

def student_reset_password_email(email,token):
    try:
        subject="Reset Your Password"
        message= f'Click on the link to Reset Your Password: http://127.0.0.1:8000/gchalo/studentpasswordresetpage/{token}/'
        email_from=settings.EMAIL_HOST_USER
        recipient_list=[email,]
        send_mail(subject,message,email_from,recipient_list)

    except Exception as e:
        return False

    return True

def admin_reset_password_email(email,token):
    try:
        subject="Reset Your Password"
        message= f'Click on the link to Reset Your Password: http://127.0.0.1:8000/gchalo/adminpasswordresetpage/{token}/'
        email_from=settings.EMAIL_HOST_USER
        recipient_list=[email,]
        send_mail(subject,message,email_from,recipient_list)

    except Exception as e:
        return False

    return True

def send_whatsapp_alert(message_body,contacts):
    sid='AC28104bf9c1b7bfe1e01d0879850b07b9'
    authToken='0dc3321930e9677bb1e2326f13512d4a'
    client = Client(sid,authToken)
    for i in contacts:
        print(i[0])
        message = client.messages.create(
            body=message_body,
            from_='whatsapp:+14155238886',
            to=f'whatsapp:+91{i[0]}'
        )

    return True