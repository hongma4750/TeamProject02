/**
 * 
 */





function goPage(a){
	
	if(a==1){
		location.href="member/regi.jsp";
	}else if(a==2){
		alert("실행?")
		location.href="../index.jsp";
		
	}else if(a==3){
		location.href="bbs/bbslist.jsp";
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