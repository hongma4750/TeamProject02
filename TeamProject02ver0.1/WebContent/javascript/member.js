

function goPage(a){
	
	if(a==1){
		alert("회원가입");
		location.href="regi.jsp";

	}else if(a==2){
		alert("로그인");
		location.href="login.jsp";
	}else if(a==3){
		location.href="index.jsp";
	}else if(a==4){
		location.href="Calendar/Calendar.jsp";
	}else if(a==5){
		location.href="Calendar.jsp";
	}else if(a==6){
		location.href="logout.jsp";
	}else if(a==7){
		location.href="pds/pdslist.jsp";
	}else if(a==8){
		location.href="poll/pollmake.jsp";
	}else if(a==9){
		location.href="poll/polllist.jsp";
	}
}

function idDupchk(){
	if(document.joinmem.id.value.length<4){
		alert("ID를 최소 4자리 이상 입력하세요");
		document.joinmem.id.focus();
	}
	else{
		alert("ID 중복검사를 합니다");
		location.href="idDupChk.jsp";		//id 중복검사
	}
	return false;
}

function emailDupchk(){
	alert("emailDupchk");
	if(document.joinmem.email.value.length<4){
		alert("ID를 최소 4자리 이상 입력하세요");
		document.joinmem.id.focus();
		return false;
		location.href = "emailDupChk.jsp";
	}
}