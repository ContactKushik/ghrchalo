from django.contrib import admin
from .models import Route,Bus,Student,Routedetails_shift1,Routedetails_shift2,Subscribe,AdminVerification
from .models import ResetPassword

admin.site.register(ResetPassword)
admin.site.register(Bus)
admin.site.register(Student)
admin.site.register(Route)
admin.site.register(Routedetails_shift2)
admin.site.register(Routedetails_shift1)
admin.site.register(Subscribe)
admin.site.register(AdminVerification)
