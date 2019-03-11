var flagPw = false;
var flagPhone = false;
var flagEmail = false;

function check(){
	var pw1 = document.getElementById("pw1");
	var pw2 = document.getElementById("pw2");
	var phone = document.getElementById("phone");
	var email = document.getElementById("email");
	
	if (pw1.value==null||pw1.value==""){
		console.log("a1");
		label = document.getElementById("maskPw1");
		label.innerHTML = "<strong style='color:red'>패스워드를 입력해주세요.</strong>";
		pw1.focus();
		return;
	}
	console.log("1");
	if (pw2.value==null||pw2.value==""){
		console.log("a2");
		label = document.getElementById("maskPw2");
		label.innerHTML = "<strong style='color:red'>패스워드를 재확인해주세요.</strong>";
		pw2.focus();
		return;
	}
	console.log("2");
	if (phone.value==null||phone.value==""){
		console.log("a3");
		label = document.getElementById("maskPhone");
		label.innerHTML = "<strong style='color:red'>연락처를 입력해주세요.</strong>";
		phone.focus();
		return;
	}
	console.log("3");
	if (email.value==null||email.value==""){
		console.log("a4");
		label = document.getElementById("maskEmail");
		label.innerHTML = "<strong style='color:red'>이메일을 입력해주세요.</strong>";
		email.focus();
		return;
	}
	console.log("4");
	if(flagPw==false){	//비번 확인 틀렸을때
		console.log("a5");
		label = document.getElementById("maskPw2");
		label.innerHTML = "<strong style='color:red'>패스워드를 재확인해주세요.</strong>";
		pw2.focus();
		return;
	}
	console.log("5");
	if(flagPhone==false){
		console.log("a6");
		label = document.getElementById("maskPhone");
		label.innerHTML = "<strong style='color:red'>연락처란을 다시 확인해주세요.</strong>";
		phone.focus();
		return;
	}
	console.log("6");
	if(flagPhone==false){
		console.log("a8");
		label = document.getElementById("maskEmail");
		label.innerHTML = "<strong style='color:red'>이메일란을 다시 확인해주세요.</strong>";
		email.focus();
		return;
	}
	
	//위에 다 통과&체크 완료 후 submit
		if(flagPw==true&&flagPhone==true&&flagEmail==true){
			
			console.log("ac");
			document.acct.submit();
		} else { console.log("back");return; }
}

function pwCheck(){//비밀번호 확인 체크
	console.log("a pwcheck");
	var pw1 = document.getElementById("pw1");
	var pw2 = document.getElementById("pw2");
	if(pw1.value == pw2.value) {
		label = document.getElementById("maskPw2");
		label.innerHTML = "<strong style='color:green'>비밀번호가 일치합니다.</strong>";
		flagPw = true;	//비번일치플래그 true로 해줌
	} else {
		label = document.getElementById("maskPw2");
		label.innerHTML = "<strong style='color:red'>비밀번호가 일치하지 않습니다.</strong>";
		flagPw = false;
	}
}

function phoneCheck(){
	console.log("a phonecheck");
	var phone = document.getElementById("phone");
	var ph = phone.value.split('-');
	var ck1 = /\d{2,3}/;
	var ck2 = /\d{3,4}/;
	
	if(ph[0].match(ck1)==null || ph[1].match(ck2)==null || ph[2].match(ck2)==null) {
		console.log("b1");
		label = document.getElementById("maskPhone");
		label.innerHTML = "<strong style='color:red'>전화번호 형식을 맞춰주세요.</strong>";
		flagPhone = false;
		phone.focus();		
	} else {
		console.log("b2");
		label = document.getElementById("maskPhone");
		label.innerHTML = "";
		flagPhone = true;
	}
}


function emailCheck(){
	console.log("a emailcheck");
	var email = document.getElementById("email");
	var ck = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	if(email.value.match(ck)!=null) {
		label = document.getElementById("maskEmail");
		label.innerHTML = "";
		flagEmail = true;	
	} else {
		label = document.getElementById("maskEmail");
		label.innerHTML = "<strong style='color:red'>이메일 형식을 맞춰주세요.</strong>";
		flagEmail = false;
	}
}

