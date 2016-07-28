<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sist.movie.TheaterDTO"%>
<%@page import="sist.movie.TheaterDAO"%>
<%@page import="sist.movie.MovieDAO"%>
<%@page import="sist.movie.MovieDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="sist.co.Member.MemberDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reserve</title>
<style type="text/css">
table {
	border-collapse: collapse;
	border: 1px solid black;	
}
th,td{
	border: 1px solid black;
}
</style>
</head>
<body>
<%
Object ologin = session.getAttribute("login");
MemberDTO mem = null;
if(ologin==null){
	System.out.println("session empty");
}else{
	mem = (MemberDTO)ologin;
}

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);
System.out.println("seq = " + seq);		// 여기서 받은 seq는 selected가됨



%>
<%-- ajax?? 그때그때 select값을 반영해서 select문 바껴야함 --%>

<table>
	<tr>
		<th>영화제목</th>
		<th>상영관</th>
		<th>달력</th>
		<th>포스터</th>
	</tr>
	<tr>
		<td width="100px">
			<select size="10" name="mv_title_selec">	
				<%
				MovieDAO mdao = MovieDAO.getInstance();
				List<MovieDTO> mlist = new ArrayList<MovieDTO>();
				mlist = mdao.getOnMovieList();
				
				for(int i = 0; i < mlist.size(); i++){ %>
					<option <%
						if(seq==mlist.get(i).getMv_seq()){	%>
							selected="selected"
					<%	} %> value="<%=mlist.get(i).getMv_seq()%>"><%=mlist.get(i).getMv_title() %></option>
			<%	} %>
			</select>
		</td>
		<td>
			<select size="10" name="th_name_selec">
			<%	TheaterDAO thdao = new TheaterDAO();
				List<TheaterDTO> thlist = new ArrayList<TheaterDTO>();
				thlist = thdao.getTheaterList(seq);
				String th_name_duple[] = new String[thlist.size()];	// 해당영화 상영을 명동 1관, 2관 혹은 1관 1회 2회일 경우, 명동이 두번 나오기떄문에, 한번만 나오도록함
				for(int i = 0; i < th_name_duple.length; i++){		// 초기화. 초기화안시키면 null이라 다음 for문에서 오류남
					th_name_duple[i] = "";
				}
				for(int i = 0; i < thlist.size(); i++){ 
					for(int j = 0; j < i; j++){
						if(!th_name_duple[j].equals(thlist.get(i).getTh_name())){%>
							<option value="<%=thlist.get(i).getTh_name() %>"><%=thlist.get(i).getTh_name() %></option>
					<%		th_name_duple[i] = thlist.get(i).getTh_name();
							break;
						}
					}
				} %>
			</select>
		</td>
		<td> <%-- 달력 --%>
		
		
		</td>
		<td rowspan="2">
			<table>
				<tr>
					<td colspan="2"><img src="../img/arrow.png" alt="포스터"></td>
				</tr>
				<tr>
					<th colspan="2">제목</th>
				</tr>
				<tr>
					<th>극장</th>
					<td>롯데</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>2016</td>
				</tr>
				<tr>
					<th>인원</th>
					<td>23</td>
				</tr>
				<tr>
					<th>금액</th>
					<td>10000</td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="예매하기"></th>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">시간표</td>
		<td>인원수</td>
	</tr>

</table>

</body>
</html>