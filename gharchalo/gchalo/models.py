from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class ResetPassword(models.Model):
    usname=models.ForeignKey(User,on_delete=models.CASCADE)
    reset_token=models.CharField(max_length=200)
class AdminVerification(models.Model):
    usname=models.ForeignKey(User,on_delete=models.CASCADE)
    verification_token=models.CharField(max_length=255)
class Student(models.Model):
    stname= models.ForeignKey(User, on_delete=models.CASCADE)
    name=models.CharField(max_length=50)
    email=models.EmailField(primary_key=True)
    college=models.CharField(max_length=10)
    verification_token=models.CharField(max_length=255)

    def __str__(self):
        return self.name
class Subscribe(models.Model):
    stname=models.ForeignKey(User,on_delete=models.CASCADE)
    contact=models.CharField(max_length=10)
    rno=models.IntegerField()
    shift=models.IntegerField()

class Route(models.Model):
    rno=models.IntegerField(primary_key=True)
    stpt=models.CharField(max_length=50)
    ept=models.CharField(max_length=50)

    # def __str__(self):
        # return self.(str(rno))

class Bus(models.Model):
    bno=models.IntegerField()
    rno=models.IntegerField()
    towards=models.CharField(max_length=20)
    shift=models.IntegerField()

class Routedetails_shift1(models.Model):
    rno=models.IntegerField()
    stop=models.CharField(max_length=50)
    time=models.CharField(max_length=8)

class Routedetails_shift2(models.Model):
    rno=models.IntegerField()
    stop=models.CharField(max_length=50)
    time=models.CharField(max_length=8)
