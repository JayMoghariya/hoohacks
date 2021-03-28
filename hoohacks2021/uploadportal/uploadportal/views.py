from django.shortcuts import render
import pyrebase
"Have to add firebase credential here"

# Create your views here.
config = {
    'apiKey': "AIzaSyB4xWvvNkSZ6Gs03nHr4doFacnFKsauDRA",
    'authDomain': "interactive-learning-62f0b.firebaseapp.com",
    'projectId': "interactive-learning-62f0b",
    'storageBucket': "interactive-learning-62f0b.appspot.com",
    'messagingSenderId': "552467435850",
    'databaseURL' : "",
    'appId': "1:552467435850:web:352afa9f2de04d39e471b3",
    'measurementId': "G-QKM63Z2SN7"
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