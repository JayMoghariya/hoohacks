from django.shortcuts import render
from firebase import Firebase
import pyrebase
"Have to add firebase credential here"

# Create your views here.
config = {
    'apiKey': "xxxxx",
    'authDomain': "xxxx",
    'projectId': "xxx",
    'storageBucket': "xxxx",
    'messagingSenderId': "xxxx",
    'databaseURL' : "xxxx",
    'appId': "xxx",
    'measurementId': "xxxxx"
  };
firebase=pyrebase.initialize_app(config)
database=firebase.database()
authe = firebase.auth()
  
def signIn(request):
    return render(request,"Sign_in.html")
  
def postsignIn(request):
    email=request.POST.get('email')
    pas_exp=request.POST.get('pass')
    try:
        # if there is no error then signin the user with given email and password
        user=authe.sign_in_with_email_and_password(email,pas_exp)
    except:
        message="Your credentials are wrong please try again!!"
        return render(request,"Sign_in.html",{"message":message})
    session_id=user['idToken']
    request.session['uid']=str(session_id)
    return render(request,"welcome.html",{"email":email})
  
def Signout(request):
    try:
        del request.session['uid']
    except:
        pass
    return render(request,"Sign_in.html")
  
def signUp(request):

    return render(request,"Sign_up.html")
  
def welcome(request):
    return render(request,"welcome.html")

def postsignUp(request):
     email = request.POST.get('email')
     passs = request.POST.get('pass')
     name = request.POST.get('name')
     try:
        # creating a user with the given email and password
        user=authe.create_user_with_email_and_password(email,passs)
        uid = user['localId']
        idtoken = request.session['uid']
        data={"status":"1","name":name}
        database.child("users").child(uid).child("details").set(data)
        print(uid)
        return render(request,"Sign_in.html")
     except:
        message112="Something went wrong try again!"
        return render(request, "Sign_up.html",{"message":message112})
     return render(request,"Sign_in.html")

def create(request):
    return render(request,'create.html')

def post_create(request):
    import time
    from datetime import datetime, timezone
    import pytz
    time_zone= pytz.timezone('Asia/Kolkata')
    time_now= datetime.now(timezone.utc).astimezone(time_zone)
    millis = int(time.mktime(time_now.timetuple()))
    print("mili"+str(millis))

    teacher_id=request.POST.get('teacher_id')
    lecture_id=request.POST.get('lecture_id')
    question_id=request.POST.get('question_id')
    difficulty_level=request.POST.get('difficulty_level')
    question_statement=request.POST.get('question_statement')
    option_a=request.POST.get('option_a')
    option_b=request.POST.get('option_b')
    option_c=request.POST.get('option_c')
    option_d=request.POST.get('option_d')
    option_correct=request.POST.get('option_correct')
    expected_time=request.POST.get('expected_time')

    
    idtoken= request.session['uid']
    a= authe.get_account_info(idtoken)
    a = a['users']
    a = a[0]
    a = a['localId']
    print("info"+str(a))
    data1 = {
        'teacher_id' :teacher_id,
        'lecture_id' :lecture_id,
        'question_id':question_id,
        'difficulty_level':difficulty_level,
        'question_statement':question_statement,
        'option_a':option_a,
        'option_b':option_b,
        'option_c':option_c,
        'option_d':option_d,
        'option_correct':option_correct,
        'expected_time':expected_time
    }

    database.child('users').child('postinfo').child(teacher_id+"_"+lecture_id+"_"+question_id).set(data1)
    # name101= database.child('users').child(a).child('details').child('teacher_id').get().val()
    return render(request,'welcome.html')
    # return render(request,'welcome.html',{'e': name101})

