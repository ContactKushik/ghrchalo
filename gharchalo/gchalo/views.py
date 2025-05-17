from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from .models import Route,Bus,Routedetails_shift1,Routedetails_shift2,Student,Subscribe,AdminVerification
from .models import ResetPassword
from django.db import connection
from.mails import student_verification_token,admin_verification_token,student_reset_password_email,admin_reset_password_email,send_whatsapp_alert
import uuid
from django.views.decorators.csrf import csrf_exempt
from twilio.twiml.messaging_response import MessagingResponse

@csrf_exempt
def home(request):
    with connection.cursor() as cursor:
        if request.user.is_authenticated:
            try:
                obj=Student.objects.get(stname=request.user)
                name=obj.name
                cursor.execute("select distinct stop from gchalo_routedetails_shift2")
                d=cursor.fetchall()
                cursor.execute("select distinct rno from gchalo_route")
                l=cursor.fetchall()
                data = {'name': name,'stops':d,'routes':l}
                return render(request,'index.html',data)

            except:
                cursor.execute("select distinct stop from gchalo_routedetails_shift2")
                d = cursor.fetchall()
                cursor.execute("select distinct rno from gchalo_route")
                l = cursor.fetchall()
                data = {'stops': d, 'routes': l}
                return render(request, 'index.html',data)
        else:
            cursor.execute("select distinct stop from gchalo_routedetails_shift2")
            d = cursor.fetchall()
            cursor.execute("select distinct rno from gchalo_route")
            l = cursor.fetchall()
            data = {'stops': d, 'routes': l}
            return render(request,'index.html',data)
def login_page(request):
    return render(request,'login.html')

def admin_signup_page(request):
    return render(request,'signup.html')

def student_signup_page(request):
    return render(request,'studentsignuppage.html')

def student_login_page(request):
    return render(request,'studentloginpage.html')

def admin_panel(request):
    if request.user.is_authenticated:
        try:
            obj=Student.objects.get(stname=request.user)
            return redirect('/gchalo/loginpage/')
        except:
            return render(request,'panel.html')
    else:
        return redirect('/gchalo/loginpage/')

@csrf_exempt
def login_user(request):
    id=request.POST.get("id")
    pwd=request.POST.get("password")
    try:
        user = User.objects.get(username=id)
        if (user.is_active == False):
            messages.error(request, "Access not granted!!!")
            return redirect("/gchalo/loginpage/")

        user= authenticate(request,username=id,password=pwd)
        if user is not None:
            login(request,user)
            return redirect("/gchalo/adminpanel/")
        else:
            messages.error(request, "Password is incorrect")
            return redirect("/gchalo/loginpage/")
    except:
        messages.error(request,id+ ' not Found')
        return redirect("/gchalo/loginpage/")
def logout_user(request):
    logout(request)
    return redirect("/gchalo/")

def subscribe_page(request):
    try:
        obj=Subscribe.objects.get(stname=request.user)
        messages.info(request,"Already Subscribed")
        messages.info(request,"To edit:")
        data={'contact':obj.contact,'rno':obj.rno,'shift':obj.shift,'tab':True}
        return render(request,"subscribepage.html",data)
    except:
        return render(request,"subscribepage.html")

def display_qr(request):
    return render(request,'displayqr.html')

@csrf_exempt

def subscribe(request):
    contact=request.POST.get("contact")
    rno=request.POST.get("rno")
    shift=request.POST.get("shift")
    try:
        obj=Subscribe.objects.get(stname=request.user)
        obj.contact=contact
        obj.rno=rno
        obj.shift=shift
        obj.save()
        messages.success(request, "Updated Successfully !!!")
        return redirect("/gchalo/")
        # return True
    except:
        obj=Subscribe.objects.create(stname=request.user,contact=contact,rno=rno,shift=shift)
        obj.save()
        messages.success(request,"Subscribed Successfully !!!")
        messages.success(request,"To get notified click on subscribe image to scan qr")
        # return redirect("http://wa.me/+14155238886?text=join%20properly-silk")
        # return redirect("/gchalo/subscribepage/")
        return render(request,'subscribepage.html')
        # return True

def unsubscribe(request):
    obj=Subscribe.objects.get(stname=request.user)
    obj.delete()
    messages.success(request,"Unsubscribed !!!")
    return redirect("/gchalo/")

@csrf_exempt
def admin_signup(request):
    username=request.POST.get("username")
    email=request.POST.get("email")
    pwd=request.POST.get("password")
    cnfpassword = request.POST.get("confirmpassword")

    if (pwd!=cnfpassword):
        messages.error(request,"Password and Confirm Pasword should Match!!!")
        return redirect("/gchalo/loginpage/")

    try:
        usname=User.objects.get(username=username)
        messages.error(request, username + ' named user already exist !!!')
        return redirect("/gchalo/loginpage/")
    except:
        user = User.objects.create_user(username=username,password=pwd,email=email)
        user.is_active=False
        user.save()
        obj=AdminVerification.objects.create(usname=user,verification_token=str(uuid.uuid4()))
        obj.save()
        admin_verification_token(obj.verification_token)
        messages.success(request, 'Registered Successfully')
        messages.success(request,"Kindly contact Admin for providing you access.")
        return redirect("/gchalo/loginpage/")

@csrf_exempt
def student_signup(request):
    name=request.POST.get("name")
    email = request.POST.get("email")
    college = request.POST.get("college")
    password = request.POST.get("password")
    cnfpassword = request.POST.get("confirmpassword")

    if (password !=cnfpassword):
        messages.error(request,"Password and Confirm Pasword should Match!!!")
        return redirect("/gchalo/studentloginpage/")

    try:
        usname=User.objects.get(username=email)
        messages.error(request, email + ' named user already exist !!!')
        return redirect("/gchalo/studentloginpage/")
    except:
        user = User.objects.create_user(username=email,password=password)
        user.is_active=False
        user.save()
        obj=Student.objects.create(stname=user,name=name,email=email,verification_token=str(uuid.uuid4()),college=college)
        student_verification_token(email,obj.verification_token)
        messages.success(request, 'Registered Successfully. Please check your email for verification!!!')

    return redirect("/gchalo/studentloginpage/")

@csrf_exempt

def student_login(request):
    email=request.POST.get("email")
    pwd=request.POST.get("password")
    try:
        user = User.objects.get(username=email)
        if (user.is_active == False):
            messages.error(request, "Email is Not Verified!!!")
            return redirect("/gchalo/studentloginpage/")
        user= authenticate(request,username=email,password=pwd)
        if user is not None:
            login(request,user)
            return redirect("/gchalo/")
        else:
            messages.error(request,"Password is incorrect")
            return redirect("/gchalo/studentloginpage/")
    except:
        messages.error(request,email+" not found!!!")
        return redirect("/gchalo/studentloginpage/")

def student_verify_email(request,token):
    try:
        obj=Student.objects.get(verification_token=token)
        obj.verification_token=""
        obj.save()
        usname=User.objects.get(username=obj.email)
        usname.is_active=True
        usname.save()
        messages.success(request,"Email Verified Successfully!!!")
        messages.success(request,"Kindly Log In")
        return redirect("/gchalo/studentloginpage/")

    except:
        return HttpResponse("Invalid Link")

def admin_verify_email(request,token):
    try:
        obj=AdminVerification.objects.get(verification_token=token)
        usname=User.objects.get(username=obj.usname)
        usname.is_active=True
        usname.save()
        obj.delete()
        return HttpResponse("Access granted to {}".format(usname.username))
    except:
        return HttpResponse("Invalid Link")

def portfolio_page(request):
    return render(request,'portfolio.html')

@csrf_exempt

def add_bus(request,rno,shift):
    bno=request.POST.get("bno")
    direction = request.POST.get("direction")
    obj=Bus.objects.create(bno=bno,rno=rno,towards=direction,shift=shift)
    obj.save()
    with connection.cursor() as cursor:
        cursor.execute("select*from gchalo_bus where towards='college' and rno={} and shift={}".format(rno,shift ))
        d = cursor.fetchall()
        cursor.execute("select*from gchalo_bus where towards='home' and rno={} and shift={}".format(rno,shift ))
        m = cursor.fetchall()
        data = {'tab': d, 'r_no': rno, 'tabs': m,'shift':shift}
        cursor.execute("select contact from gchalo_subscribe where rno={} and shift={}".format(rno, shift))
        d = cursor.fetchall()
        send_whatsapp_alert(
            f"Bus Added!!!\nBus No.: {bno} Towards: {direction} has been added to your subscribed route, Route No.: {rno} and Shift: {shift}",
            d)
        messages.success(request, "Bus added Successfully!!!")
        return render(request, 'bus.html', data)

@csrf_exempt
def add_route(request):
    rno=request.POST.get("rno")
    stpt=request.POST.get("stpt")
    ept=request.POST.get("ept")
    obj=Route.objects.create(rno=rno,stpt=stpt,ept=ept)
    obj.save()
    with connection.cursor() as cursor:
        cursor.execute("select*from gchalo_route")
        d = cursor.fetchall()
        data = {'tab': d}
        messages.success(request, "Added Successfully!!!")
        return render(request, 'route.html', data)

@csrf_exempt
def edit_route(request):
    rno=request.POST.get("rno")
    shift=request.POST.get("shift")
    # print(type(shift))
    with connection.cursor() as cursor:
        if (shift=='2'):
            cursor.execute("select*from gchalo_routedetails_shift2 where rno={} order by time asc;".format(rno,))
            d=cursor.fetchall()
            if (d==()):
                messages.error(request,"Route No. not found.")
                return redirect("/gchalo/adminpanel/")
            data={'tab':d,'r_no':rno,'shift':shift}
            return render(request,'editroute.html',data)

        elif (shift=='1'):
            cursor.execute("select*from gchalo_routedetails_shift1 where rno={} order by time asc;".format(rno, ))
            d = cursor.fetchall()
            if (d == ()):
                messages.error(request, "Route No. not found.")
                return redirect("/gchalo/adminpanel/")
            data = {'tab': d, 'r_no': rno, 'shift':shift}
            return render(request, 'editroute.html', data)

@csrf_exempt

def bus(request):
    rno=request.POST.get("rno")
    shift=request.POST.get("shift")
    with connection.cursor() as cursor:
        cursor.execute("select*from gchalo_bus where towards='college' and rno={} and shift={}".format(rno,shift))
        d=cursor.fetchall()
        # print(d)
        cursor.execute("select*from gchalo_bus where towards='home' and rno={} and shift={}".format(rno,shift))
        m=cursor.fetchall()
        data={'tab':d,'r_no':rno,'tabs':m,'shift':shift}
        return render(request,'bus.html',data)

def route(request):
    with connection.cursor() as cursor:
        cursor.execute("select*from gchalo_route")
        d=cursor.fetchall()
        if (d==()):
            messages.error(request,"No Routes Present!!!")
            return render(request,'route.html')
        data={'tab':d}
        return render(request,'route.html',data)

@csrf_exempt
def edit_stop(request,rno,shift):
    with connection.cursor() as cursor:
        id = request.POST.get("id")
        no = int(id)

        if(shift==2):
            if 'edit' in request.POST:
                cursor.execute("select*from gchalo_routedetails_shift2 where id={}".format(no,))
                d=cursor.fetchall()
                l=d[0]
                cursor.execute("select*from gchalo_routedetails_shift2 where rno={} order by time asc;".format(rno, ))
                d = cursor.fetchall()
                data = {'tab': d, 'r_no': rno,'record':l,'shift':shift}
                return render(request, 'editroute.html', data)
            elif 'delete' in request.POST:
                cursor.execute("select stop from gchalo_routedetails_shift2 where id={};".format(no, ))
                d=cursor.fetchall()
                l=d[0][0]
                cursor.execute("delete from gchalo_routedetails_shift2 where id={}".format(no,))
                cursor.execute("select*from gchalo_routedetails_shift2 where rno={} order by time asc;".format(rno, ))
                d = cursor.fetchall()
                data = {'tab': d, 'r_no': rno,'shift':shift}
                cursor.execute("select contact from gchalo_subscribe where rno={} and shift={}".format(rno,shift))
                d=cursor.fetchall()
                send_whatsapp_alert(f"Stop deleted!!!\nStop: {l} has been deleted from your subscribed route, Route No.: {rno} and Shift: {shift}",d)
                messages.success(request,"Deleted Successfully!!!")
                return render(request, 'editroute.html', data)

        elif(shift==1):
            if 'edit' in request.POST:
                cursor.execute("select*from gchalo_routedetails_shift1 where id={}".format(no,))
                d=cursor.fetchall()
                l=d[0]
                cursor.execute("select*from gchalo_routedetails_shift1 where rno={} order by time asc;".format(rno, ))
                d = cursor.fetchall()
                data = {'tab': d, 'r_no': rno,'record':l,'shift':shift}
                return render(request, 'editroute.html', data)
            elif 'delete' in request.POST:
                cursor.execute("select stop from gchalo_routedetails_shift1 where id={};".format(no, ))
                d = cursor.fetchall()
                l = d[0][0]
                cursor.execute("delete from gchalo_routedetails_shift1 where id={}".format(no,))
                cursor.execute("select*from gchalo_routedetails_shift1 where rno={} order by time asc;".format(rno, ))
                d = cursor.fetchall()
                data = {'tab': d, 'r_no': rno,'shift':shift}
                cursor.execute("select contact from gchalo_subscribe where rno={} and shift={}".format(rno, shift))
                d = cursor.fetchall()
                send_whatsapp_alert(
                    f"Stop deleted!!!\nStop: {l} has been deleted from your subscribed route, Route No.: {rno} and Shift: {shift}",
                    d)
                messages.success(request,"Deleted Successfully!!!")
                return render(request, 'editroute.html', data)

@csrf_exempt
def edit_bus(request,rno,shift):
    with connection.cursor() as cursor:
        id = request.POST.get("id")
        no = int(id)
        if 'edit' in request.POST:
            cursor.execute("select*from gchalo_bus where id={}".format(no,))
            d=cursor.fetchall()
            l=d[0]
            cursor.execute("select*from gchalo_bus where towards='college' and rno={} and shift={}".format(rno,shift ))
            d = cursor.fetchall()
            cursor.execute("select*from gchalo_bus where towards='home' and rno={} and shift={}".format(rno,shift ))
            m = cursor.fetchall()
            data = {'tab': d, 'r_no': rno, 'tabs': m,'record':l,'shift':shift}
            return render(request, 'bus.html', data)
        elif 'delete' in request.POST:
            cursor.execute("select bno,towards from gchalo_bus where id={}".format(no,))
            d=cursor.fetchall()
            l=d[0]
            cursor.execute("delete from gchalo_bus where id={}".format(no,))
            cursor.execute("select*from gchalo_bus where towards='college' and rno={} and shift={}".format(rno,shift ))
            d = cursor.fetchall()
            cursor.execute("select*from gchalo_bus where towards='home' and rno={} and shift={}".format(rno,shift ))
            m = cursor.fetchall()
            data = {'tab': d, 'r_no': rno, 'tabs': m,'shift':shift}
            cursor.execute("select contact from gchalo_subscribe where rno={} and shift={}".format(rno, shift))
            d = cursor.fetchall()
            send_whatsapp_alert(
                f"Bus Deleted!!!\nBus No.: {l[0]} Towards: {l[1]} has been deleted from your subscribed route, Route No.: {rno} and Shift: {shift}",
                d)
            messages.success(request,"Deleted Successfully!!!")
            return render(request, 'bus.html', data)

@csrf_exempt
def modify_route(request):
    with connection.cursor() as cursor:
        id = request.POST.get("rno")
        rno = int(id)
        if 'edit' in request.POST:
            cursor.execute("select*from gchalo_route where rno={}".format(rno,))
            d=cursor.fetchall()
            l=d[0]
            cursor.execute("select*from gchalo_route")
            d = cursor.fetchall()
            data = {'tab': d,'record':l}
            return render(request, 'route.html', data)
        elif 'delete' in request.POST:
            cursor.execute("delete from gchalo_route where rno={}".format(rno,))
            cursor.execute("select*from gchalo_route")
            d = cursor.fetchall()
            data = {'tab': d}
            messages.success(request,"Deleted Successfully!!!")
            return render(request, 'route.html', data)

@csrf_exempt
def update_stop(request,id,rno,shift):
    with connection.cursor() as cursor:
        stop=request.POST.get("stop")
        time=request.POST.get("time")
        if(shift==2):
            cursor.execute("select stop,time from gchalo_routedetails_shift2 where id={}".format(id,))
            d=cursor.fetchall()
            l=d[0]
            cursor.execute("update gchalo_routedetails_shift2 set stop='{}',time='{}' where id={}".format(stop,time,id))
            cursor.execute("select*from gchalo_routedetails_shift2 where rno={} order by time asc;".format(rno, ))
            d = cursor.fetchall()
            data = {'tab': d, 'r_no': rno, 'shift':shift}
            cursor.execute("select contact from gchalo_subscribe where rno={} and shift={}".format(rno, shift))
            d = cursor.fetchall()
            send_whatsapp_alert(
                f"Stop Updated !!!\nStop: {l[0]} to {stop} and Time: {l[1]} to {time} on your subscribed route, Route No.: {rno} and Shift: {shift}",
                d)
            messages.success(request, "Updated Successfully!!!")
            return render(request, 'editroute.html', data)
        elif (shift==1):
            cursor.execute("select stop,time from gchalo_routedetails_shift1 where id={}".format(id, ))
            d = cursor.fetchall()
            l = d[0]
            cursor.execute(
                "update gchalo_routedetails_shift1 set stop='{}',time='{}' where id={}".format(stop, time, id))
            cursor.execute("select*from gchalo_routedetails_shift1 where rno={} order by time asc;".format(rno, ))
            d = cursor.fetchall()
            data = {'tab': d, 'r_no': rno, 'shift': shift}
            messages.success(request, "Updated Successfully!!!")
            return render(request, 'editroute.html', data)

@csrf_exempt

def update_bus(request,id,rno,shift):
    with connection.cursor() as cursor:
        # rnum=request.POST.get("rno")
        towards=request.POST.get("towards")
        cursor.execute("select bno,towards from gchalo_bus where id={}".format(id,))
        d=cursor.fetchall()
        l=d[0]
        cursor.execute("update gchalo_bus set towards='{}' where id={}".format(towards,id))
        cursor.execute("select*from gchalo_bus where towards='college' and rno={} and shift={}".format(rno,shift ))
        d = cursor.fetchall()
        cursor.execute("select*from gchalo_bus where towards='home' and rno={} and shift={}".format(rno,shift ))
        m = cursor.fetchall()
        data = {'tab': d, 'r_no': rno, 'tabs': m,'shift':shift}
        cursor.execute("select contact from gchalo_subscribe where rno={} and shift={}".format(rno, shift))
        d = cursor.fetchall()
        send_whatsapp_alert(
            f"Bus details Updated!!!\nBus No.: {l[0]} has been updated from towards: {l[1]} to {towards} on your subscribed route, Route No.: {rno} and Shift: {shift}",
            d)
        messages.success(request, "Updated Successfully!!!")
        return render(request, 'bus.html', data)

@csrf_exempt
def update_route(request,rno):
    with connection.cursor() as cursor:
        stpt=request.POST.get("stpt")
        ept=request.POST.get("ept")
        cursor.execute("update gchalo_route set stpt='{}',ept='{}' where rno={}".format(stpt,ept,rno))
        cursor.execute("select*from gchalo_route")
        d = cursor.fetchall()
        data = {'tab': d}
        messages.success(request, "Updated Successfully!!!")
        return render(request, 'route.html', data)

@csrf_exempt
def add_stop(request,rno,shift):
    stop=request.POST.get("stop")
    time=request.POST.get("time")
    if(shift==2):
        obj=Routedetails_shift2.objects.create(rno=rno,stop=stop,time=time)
        obj.save()
        with connection.cursor() as cursor:
            cursor.execute("select*from gchalo_routedetails_shift2 where rno={} order by time asc;".format(rno, ))
            d = cursor.fetchall()
            data = {'tab': d, 'r_no': rno, 'shift':shift}
            cursor.execute("select contact from gchalo_subscribe where rno={} and shift={}".format(rno, shift))
            d = cursor.fetchall()
            send_whatsapp_alert(
                f"New Stop Added !!!\nStop: {stop} and Time: {time} has been added to your subscribed route, Route No.: {rno} and Shift: {shift}",
                d)
            messages.success(request, "Added Successfully!!!")
            return render(request, 'editroute.html', data)
    elif (shift==1):
        obj = Routedetails_shift1.objects.create(rno=rno, stop=stop, time=time)
        obj.save()
        with connection.cursor() as cursor:
            cursor.execute("select*from gchalo_routedetails_shift1 where rno={} order by time asc;".format(rno, ))
            d = cursor.fetchall()
            data = {'tab': d, 'r_no': rno, 'shift': shift}
            cursor.execute("select contact from gchalo_subscribe where rno={} and shift={}".format(rno, shift))
            d = cursor.fetchall()
            send_whatsapp_alert(
                f"New Stop Added !!!\nStop: {stop} and Time: {time} has been added to your subscribed route, Route No.: {rno} and Shift: {shift}",
                d)
            messages.success(request, "Added Successfully!!!")
            return render(request, 'editroute.html', data)

def display_route(request):
    with connection.cursor() as cursor:
        cursor.execute("select *from gchalo_route")
        d=cursor.fetchall()
        data={'tab':d}
        return render(request,'displayroute.html',data)

@csrf_exempt
def display_particular_route(request):
    rno=request.POST.get("rno")
    # no=int(rno)
    with connection.cursor() as cursor:
        cursor.execute("select*from gchalo_routedetails_shift1 where rno={}".format(rno,))
        d=cursor.fetchall()
        cursor.execute("select bno from gchalo_bus where rno={} and shift=1 and towards='Home'".format(rno,))
        x=cursor.fetchall()
        cursor.execute("select bno from gchalo_bus where rno={} and shift=1 and towards='College'".format(rno, ))
        y = cursor.fetchall()
        cursor.execute("select*from gchalo_routedetails_shift2 where rno={}".format(rno, ))
        l = cursor.fetchall()
        cursor.execute("select bno from gchalo_bus where rno={} and shift=2 and towards='Home'".format(rno, ))
        m = cursor.fetchall()
        cursor.execute("select bno from gchalo_bus where rno={} and shift=2 and towards='College'".format(rno, ))
        n = cursor.fetchall()
        cursor.execute("select distinct stop from gchalo_routedetails_shift2")
        stops=cursor.fetchall()
        cursor.execute("select distinct rno from gchalo_route")
        routes=cursor.fetchall()
        data={'tab':d, 'tabs':l,'m':m,'n':n,'x':x,'y':y,'stops':stops,'routes':routes}
        if (l==() and m==()):
            messages.error(request,'No routes found!!!')
            return redirect('/gchalo/')
        return render(request,'index.html',data)

@csrf_exempt
def search_stop(request):
    stop=request.POST.get("stop")
    with connection.cursor() as cursor:
        cursor.execute("select rno,stop,time from gchalo_routedetails_shift2 where stop like '%{}%'".format(stop,))
        d=cursor.fetchall()
        m=[]
        n=[]
        j=[]
        for i in d:
            if (i[0] not in j):
                j.append(i[0])
        for i in j:
            cursor.execute("select bno,rno from gchalo_bus where rno={} and shift=2 and towards='Home'".format(i,))
            k=cursor.fetchall()
            for z in k:
                m.append(z)
        for i in j:
            cursor.execute(
                "select bno,rno from gchalo_bus where rno={} and shift=2 and towards='College'".format(i, ))
            k = cursor.fetchall()
            for z in k:
                n.append(z)
        cursor.execute("select rno,stop,time from gchalo_routedetails_shift1 where stop like '%{}%'".format(stop, ))
        l = cursor.fetchall()
        x=[]
        y=[]
        j=[]
        for i in l:
            if (i[0] not in j):
                j.append(i[0])
        for i in j:
            cursor.execute("select bno,rno from gchalo_bus where rno={} and shift=1 and towards='Home'".format(i,))
            k=cursor.fetchall()
            for z in k:
                x.append(z)
        for i in j:
            cursor.execute("select bno,rno from gchalo_bus where rno={} and shift=1 and towards='College'".format(i,))
            k=cursor.fetchall()
            for z in k:
                y.append(z)
        if (d==() and l==()):
            messages.error(request,"No stops found!!!")
            return redirect("/gchalo/")
        data={'gets':d,'m':m,'get':l,'n':n,'x':x,'y':y}

    return render(request,'index.html',data)

def student_forgot_password(request):
    return render(request,'studentforgotpassword.html')

@csrf_exempt
def student_reset_password(request):
    email=request.POST.get("email")
    try:
        user=User.objects.get(username=email)
        obj = ResetPassword.objects.create(usname=user,reset_token=str(uuid.uuid4()))
        student_reset_password_email(email, obj.reset_token)
        messages.success(request,email+" Password Reset link is send to your registerd email. Please Check!!!")
        return redirect("/gchalo/studentforgotpasswordpage/")
    except:
        messages.error(request,email+ "not found!!!")
        return redirect("/gchalo/studentforgotpasswordpage/")

def student_reset_password_page(request,token):
    try:
        obj=ResetPassword.objects.get(reset_token=token)
        data={'usname':obj.usname}
        obj.delete()
        return render(request,'studentresetpasswordpage.html',data)
    except:
        return HttpResponse("Invalid Link")

@csrf_exempt
def student_password_reset(request,usname):
    password=request.POST.get("password")
    cnfpassword=request.POST.get("confirmpassword")

    if(password!=cnfpassword):
        data = {'usname':usname}
        messages.error(request,"Password and Confirm Password should match!!!")
        return render(request, 'studentresetpasswordpage.html', data)
    obj=User.objects.get(username=usname)
    obj.set_password(password)
    obj.save()
    messages.success(request,"Password reset Successfully!!!")
    return redirect("/gchalo/studentloginpage/")

def admin_forgot_password(request):
    return render(request,'adminforgotpassword.html')

@csrf_exempt
def admin_reset_password(request):
    username=request.POST.get("username")
    try:
        user=User.objects.get(username=username)
        obj = ResetPassword.objects.create(usname=user,reset_token=str(uuid.uuid4()))
        admin_reset_password_email(user.email, obj.reset_token)
        messages.success(request,username+" Password Reset link is send to your registerd email. Please Check!!!")
        return redirect("/gchalo/adminforgotpasswordpage/")
    except:
        messages.error(request,username+ "not found!!!")
        return redirect("/gchalo/adminforgotpasswordpage/")

def admin_reset_password_page(request,token):
    try:
        obj=ResetPassword.objects.get(reset_token=token)
        data={'usname':obj.usname}
        obj.delete()
        return render(request,'adminresetpasswordpage.html',data)
    except:
        return HttpResponse("Invalid Link")

@csrf_exempt
def admin_password_reset(request,usname):
    password=request.POST.get("password")
    cnfpassword=request.POST.get("confirmpassword")

    if(password!=cnfpassword):
        data = {'usname':usname}
        messages.error(request,"Password and Confirm Password should match!!!")
        return render(request, 'adminresetpasswordpage.html', data)
    obj=User.objects.get(username=usname)
    obj.set_password(password)
    obj.save()
    messages.success(request,"Password reset Successfully!!!")
    return redirect("/gchalo/loginpage/")

@csrf_exempt
def respond_message(request):
    user = request.POST.get('From')
    message = request.POST.get('Body')
    num=user[12:]
    if message.lower()=="myinfo":
        response = MessagingResponse()
        with connection.cursor() as cursor:
            cursor.execute("select rno,shift,stname_id from gchalo_subscribe where contact='{}'".format(num,))
            d=cursor.fetchall()
            if d==():
                response.message("You aren't subscribed yet !!!\nVisit GhrChalo website to subcribe.")
                return HttpResponse(str(response))
            l=d[0]
            rno=l[0]
            shift=l[1]
            stid=l[2]
            cursor.execute("select name from gchalo_student where stname_id={}".format(stid,))
            d=cursor.fetchall()
            l=d[0]
            name=l[0]
            response.message(f"Hello {name}\nYour subscribed Route No.: {rno} and Shift: {shift}.\nBuses on your Route are as following:-")
            cursor.execute("select bno,towards from gchalo_bus where rno={} and shift={}".format(rno,shift))
            d=cursor.fetchall()
            if d==():
                response.message("No buses is added on your subscribed route yet.")
                return HttpResponse(str(response))
            st=""
            for i in d:
                st+=f"Bus No.: {i[0]}, Towards: {i[1]}\n"
            response.message(st)
        return HttpResponse(str(response))
    else:
        response = MessagingResponse()
        with connection.cursor() as cursor:
            cursor.execute("select stname_id from gchalo_subscribe where contact='{}'".format(num, ))
            d = cursor.fetchall()
            if d == ():
                return HttpResponse("True")
            stid=d[0][0]
            cursor.execute("select name from gchalo_student where stname_id={}".format(stid, ))
            d = cursor.fetchall()
            l = d[0]
            name = l[0]
            response.message(f"Hello {name}\nTo get your subscribed route details, message *myinfo*.")
            return HttpResponse(str(response))
    return HttpResponse("nope")
def personalize_route(request):
    with connection.cursor() as cursor:
        try:
            obj=Subscribe.objects.get(stname=request.user)
            stobj=Student.objects.get(stname=request.user)
            name=stobj.name
            rno=obj.rno
            shift=obj.shift
            if (shift==1):
                cursor.execute("select stop,time from gchalo_routedetails_shift1 where rno={}".format(rno,))
                d=cursor.fetchall()
                cursor.execute("select bno,towards from gchalo_bus where rno={} and shift={}".format(rno,shift))
                l=cursor.fetchall()
                data={'name':name,'tab':d,'tabs':l,'rno':rno,'shift':shift}
                return render(request,'personalinfo.html',data)
            elif (shift==2):
                cursor.execute("select stop,time from gchalo_routedetails_shift2 where rno={}".format(rno, ))
                d = cursor.fetchall()
                cursor.execute("select bno,towards from gchalo_bus where rno={} and shift={}".format(rno, shift))
                l = cursor.fetchall()
                data = {'name': name, 'tab': d, 'tabs': l,'rno':rno,'shift':shift}
                return render(request,'personalinfo.html',data)
        except:
            messages.error(request,'Not subscribed yet!!!')
            return redirect('/gchalo/')