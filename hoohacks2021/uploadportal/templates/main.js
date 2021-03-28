const inputs = document.querySelectorAll(".input");


function addcl(){
	let parent = this.parentNode.parentNode;
	parent.classList.add("focus");
}

function remcl(){
	let parent = this.parentNode.parentNode;
	if(this.value == ""){
		parent.classList.remove("focus");
	}
}


inputs.forEach(input => {
	input.addEventListener("focus", addcl);
	input.addEventListener("blur", remcl);
});

var firebaseConfig = {
    apiKey: "AIzaSyCxkVXvWgLDwj0KKE75G1ij6FbounLyzeQ",
    authDomain: "eduquix.firebaseapp.com",
    databaseURL: "https://eduquix.firebaseio.com",
    projectId: "eduquix",
    storageBucket: "eduquix.appspot.com",
    messagingSenderId: "832543363823",
    appId: "1:832543363823:web:bbc9fd8f4936496d91c11a",
    measurementId: "G-7YSCXJRJ13"
  };
  const auth = auth.firebase();
  
  function signUp(){
	  var email = document.getElementById("email");
	  var password = document.getElementById("password");
	  
	  const promise = auth.createUserWithEmailAndPassword(email.value, password.value);
	  promise.catch(e=> alert(e.message));
	  
	  alert("Signned In Successfully!")
  }