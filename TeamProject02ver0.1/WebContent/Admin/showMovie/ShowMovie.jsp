 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
     
     <%@ page import="java.util.*" %>
     <%@ page import="sist.co.Theater.*" %>
     <%@ page import="sist.co.Movie.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
function updateForm(){
	alert("zz");
	location.href="Admin/showMovie/UpdateTheater.jsp?th_name=<%=request.getParameter("th_name")%>&th_cinema=<%=request.getParameter("th_cinema")%>&th_s_date=<%=request.getParameter("th_s_date")%>&th_e_date=<%=request.getParameter("th_e_date")%>&mv_seq=<%=request.getParameter("mv_seq")%>&th_num=<%=request.getParameter("th_num")%>&th_time="$('#th_time option:selected').attr('value');
}
</script>

</head>
<body>

<div>
	
<div style="display:inline-block; border:1px solid;">
	<!-- 지점 선택 부분 -->
	<table border="1" >
		<%
			TheaterDAO thdao = TheaterDAO.getInstance();
			TheaterDTO thdto = new TheaterDTO();
			
			List<TheaterDTO> th_name_List = thdao.groupByTheater();
			
		%>
		
			<%for(int i =0;i<th_name_List.size();i++){
				%>
					<tr><td onmouseover ="changeBg(1,this)" onmouseout="changeBg(2,this)"onclick="location.href='admin.jsp?mode=Admin/showMovie/ShowMovie&th_name=<%=th_name_List.get(i).getTh_name()%>'"><%=th_name_List.get(i).getTh_name() %></td></tr>
				<%
			}
			%>
	</table>
	<!-- 지점 선택 부분 -->
	</div>
	
	
	
	
	<div style="display:inline-block; border:1px solid;" >
	<!-- 상영광 부분!!! -->
	<%
		if(request.getParameter("th_name")!=null){
			%>
			
			<table border="1" >
				<%
					List<TheaterDTO> th_cinema_List = thdao.groupByCinema(request.getParameter("th_name"));
				%>
				
				<%
					for(int i=0;i<th_cinema_List.size();i++){
						%>
							<tr><td onmouseover ="changeBg(1,this)" onmouseout="changeBg(2,this)"onclick="location.href='admin.jsp?mode=Admin/showMovie/ShowMovie&th_name=<%=request.getParameter("th_name")%>&th_cinema=<%=th_cinema_List.get(i).getTh_cinema()%>'"><%=th_cinema_List.get(i).getTh_cinema() %></td></tr>
							
						<%
						
					}
				%>
			</table>
			
			
			<%
		}
	%>
	
	<!-- 상영관 부분!!! -->
	</div>
	
	<%!
public String two(String msg){	//날짜 01월,02월 이런식으로 만들기위해 사용되는 메서드
	return msg.trim().length()<2 ? "0"+msg:msg.trim();
}
public boolean nvl(String msg){
	return msg==null || msg.trim().equals("")? true: false;
}//빈 문자열인지 확인하는 메서드....
public String dot3(String msg){			//캘린더 안에 글자 15글자 이상일시 짜르기 메서드
	String s ="";
	
	if(msg.length()>=15){
		s = msg.substring(0,15);
		s += "...";
	}else{
		s = msg.trim();
	}
	
	return s;
}
%>


	<div style="display : inline-block; color:#a94442; border:1px solid;">
		<!-- 시작 날짜 달력 부분 -->
		<%
			if(request.getParameter("th_cinema") !=null ){
				%>
					<%
Calendar cal = Calendar.getInstance();
cal.set(Calendar.DATE,1);		//이거 아마 달력 1일째 사이에 빈 공간 넣을려고 1일 체크하는거 인듯
String s_year = request.getParameter("m_year");		//Calendar에서 Calendar로 보내고 받을때 사용
String s_month = request.getParameter("m_month");	//언제 사용하는지 체크!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
int m_year = cal.get(Calendar.YEAR);
if(!nvl(s_year)){
	m_year = Integer.parseInt(s_year);
}
int m_month = cal.get(Calendar.MONTH) +1 ;
if(!nvl(s_month)){
	m_month = Integer.parseInt(s_month);
}
if(m_month<1){
	m_month=12;
	m_year--;							//달 체크하고 년수 올리거나 내리거나
}
if(m_month>12){
	m_month=1;
	m_year++;
}
cal.set(m_year,m_month-1,1);	//달 1일 체크하고 빈칸 넣을려고 세팅함
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
///////////////////////////////////////////////	전년도,전월,다음달,다음년 표시
String pp = String.format("<a href='%s&m_year=%d&m_month=%d'><img src='img/left.gif'></a>","admin.jsp?mode=Admin/showMovie/ShowMovie&th_name="+request.getParameter("th_name")+"&th_cinema="+request.getParameter("th_cinema"),m_year-1,m_month);
String p = String.format("<a href='%s&m_year=%d&m_month=%d'><img src='img/prec.gif'></a>","admin.jsp?mode=Admin/showMovie/ShowMovie&th_name="+request.getParameter("th_name")+"&th_cinema="+request.getParameter("th_cinema"),m_year,m_month-1);	
String nn = String.format("<a href='%s&m_year=%d&m_month=%d'><img src='img/last.gif'></a>","admin.jsp?mode=Admin/showMovie/ShowMovie&th_name="+request.getParameter("th_name")+"&th_cinema="+request.getParameter("th_cinema"),m_year+1,m_month);
String n = String.format("<a href='%s&m_year=%d&m_month=%d'><img src='img/next.gif'></a>","admin.jsp?mode=Admin/showMovie/ShowMovie&th_name="+request.getParameter("th_name")+"&th_cinema="+request.getParameter("th_cinema"),m_year,m_month+1);
///////////////////////////////////////////////
%>
<!-- 폼~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<table border="1" align="center">

<tr >				<!-- 이쪽이 달력 맨위에 달이동or년이동 부분 -->
	<td colspan="7" align="center">
	<%=pp %><%=p %>
		<font style="font-size:40px;">
			<%=String.format("%d년&nbsp;&nbsp;%d월",m_year,m_month) %>
		</font>
	<%=n %><%=nn %>
	</td>
</tr>


<tr class="date">
	<td>일</td>
	<td>월</td>
	<td>화</td>
	<td>수</td>
	<td>목</td>
	<td>금</td>
	<td>토</td>
</tr>


<tr align="left" valign="top">
<%
for(int i=1;i<dayOfWeek;i++){		//dayOfWeek-->달 시작하기 전날까지 공백처리 위해 사용
	%>
	<td>&nbsp;</td>
	<% 
}
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);		//달력 마지막 날 이후 빈 공간 채우기 위해 사용
for(int i=1;i<=lastDay;i++){
	%>

	<td onmouseover ="changeBg(1,this)" onmouseout="changeBg(2,this)">
	<%String th_s_date =  m_year+two(m_month+"")+two(i+""); %>
	<a href = "admin.jsp?mode=Admin/showMovie/ShowMovie
	&th_name=<%=request.getParameter("th_name") %>
	&th_cinema=<%=request.getParameter("th_cinema") %>
	&th_s_date=<%=th_s_date%>&startday=<%=i%>&m_year=<%=m_year%>&m_month=<%=m_month%>">
	<%=i %>
	</a>
		
	</td>
	<% 
	if((i+dayOfWeek-1)%7 ==0){
		%>
		</tr><tr align="left" valign="top">
		<%}%>
	<%}%>
	<%
	for(int i=0; i<(7-(dayOfWeek+lastDay-1)%7)%7; i++){			//마지막 날 이후 빈공간 채우기
		%>
		<td onmouseover ="changeBg(1,this)" onmouseout="changeBg(2,this)">&nbsp;</td>
		<%}%>

</tr>
</table>
				<%
			}
		%>
		
	</div>
	
	<div style="display : inline-block; color:#a94442; border:1px solid;">
		<!-- 상영 종료 시간 부분 -->
		
		<%if(request.getParameter("th_s_date") != null){
			%>
			<%
Calendar cal = Calendar.getInstance();
cal.set(Calendar.DATE,1);		//이거 아마 달력 1일째 사이에 빈 공간 넣을려고 1일 체크하는거 인듯
String q_year = request.getParameter("w_year");		//Calendar에서 Calendar로 보내고 받을때 사용
String q_month = request.getParameter("w_month");	//언제 사용하는지 체크!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
int w_year = cal.get(Calendar.YEAR);
if(!nvl(q_year)){
	w_year = Integer.parseInt(q_year);
}
int w_month = cal.get(Calendar.MONTH) +1 ;
if(!nvl(q_month)){
	w_month = Integer.parseInt(q_month);
}
if(w_month<1){
	w_month=12;
	w_year--;							//달 체크하고 년수 올리거나 내리거나
}
if(w_month>12){
	w_month=1;
	w_year++;
}
cal.set(w_year,w_month-1,1);	//달 1일 체크하고 빈칸 넣을려고 세팅함
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
///////////////////////////////////////////////	전년도,전월,다음달,다음년 표시
String pp = String.format("<a href='%s&w_year=%d&w_month=%d'><img src='img/left.gif'></a>","admin.jsp?mode=Admin/showMovie/ShowMovie&th_name="+request.getParameter("th_name")+"&th_cinema="+request.getParameter("th_cinema")+"&th_s_date="+request.getParameter("th_s_date"),w_year-1,w_month);
String p = String.format("<a href='%s&w_year=%d&w_month=%d'><img src='img/prec.gif'></a>","admin.jsp?mode=Admin/showMovie/ShowMovie&th_name="+request.getParameter("th_name")+"&th_cinema="+request.getParameter("th_cinema")+"&th_s_date="+request.getParameter("th_s_date"),w_year,w_month-1);	
String nn = String.format("<a href='%s&w_year=%d&w_month=%d'><img src='img/last.gif'></a>","admin.jsp?mode=Admin/showMovie/ShowMovie&th_name="+request.getParameter("th_name")+"&th_cinema="+request.getParameter("th_cinema")+"&th_s_date="+request.getParameter("th_s_date"),w_year+1,w_month);
String n = String.format("<a href='%s&w_year=%d&w_month=%d'><img src='img/next.gif'></a>","admin.jsp?mode=Admin/showMovie/ShowMovie&th_name="+request.getParameter("th_name")+"&th_cinema="+request.getParameter("th_cinema")+"&th_s_date="+request.getParameter("th_s_date"),w_year,w_month+1);
///////////////////////////////////////////////
%>
<!-- 폼~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<table border="1" align="center">

<tr >				<!-- 이쪽이 달력 맨위에 달이동or년이동 부분 -->
	<td colspan="7" align="center">
	<%=pp %><%=p %>
		<font style="font-size:40px;">
			<%=String.format("%d년&nbsp;&nbsp;%d월",w_year,w_month) %>
		</font>
	<%=n %><%=nn %>
	</td>
</tr>


<tr class="date">
	<td>일</td>
	<td>월</td>
	<td>화</td>
	<td>수</td>
	<td>목</td>
	<td>금</td>
	<td>토</td>
</tr>


<tr align="left" valign="top">
<%
for(int i=1;i<dayOfWeek;i++){		//dayOfWeek-->달 시작하기 전날까지 공백처리 위해 사용
	%>
	<td>&nbsp;</td>
	<% 
}
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);		//달력 마지막 날 이후 빈 공간 채우기 위해 사용
for(int i=1;i<=lastDay;i++){
	%>

	<td onmouseover ="changeBg(1,this)" onmouseout="changeBg(2,this)">
	<%String th_e_date = w_year+two(w_month+"")+two(i+""); %>
	
	
	<a href = "admin.jsp?mode=Admin/showMovie/ShowMovie
			&th_name=<%=request.getParameter("th_name") %>
			&th_cinema=<%=request.getParameter("th_cinema") %>
			&th_s_date=<%=request.getParameter("th_s_date")%>
			&th_e_date=<%=th_e_date%>">
			<%=i %>
	</a>
	
		
	</td>
	<% 
	if((i+dayOfWeek-1)%7 ==0){
		%>
		</tr><tr align="left" valign="top">
		<%}%>
	<%}%>
	<%
	for(int i=0; i<(7-(dayOfWeek+lastDay-1)%7)%7; i++){			//마지막 날 이후 빈공간 채우기
		%>
		<td onmouseover ="changeBg(1,this)" onmouseout="changeBg(2,this)">&nbsp;</td>
		<%}%>

</tr>
</table>

				<%
			}
		%>
	</div>	
		<br>
		<div style="display:inline-block; color:#a94442; border:1px white solid;">
			<!-- 영화 선택 부분 -->
			<%
				if(request.getParameter("th_e_date") != null){
					%>
					
					<%
					
						MovieDAO modao = MovieDAO.getInstance();
						//수정해야됨!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
						List<MovieDTO> moList = modao.getOnMovie();
						
						session.setAttribute("re_movie",moList);
					
					%>
						<table>
							<tr>
							<%
								if(request.getParameter("mv_seq") != null){
									String mv_img = modao.getMvIMG(Integer.parseInt(request.getParameter("mv_seq")));
									session.setAttribute("re_mv_img",mv_img);
									session.setAttribute("param_mv_seq", request.getParameter("mv_seq"));
									%>
									<td>
										<div>
											<img src="${re_mv_img }" alt="영화이미지" id="movieImg" width="90px"height="140px;">
											<select name="mv_seq" id="mv" onchange="changeImg()">
												<option value="0">영화제목들</option>
												
												<c:forEach var="movie" items="${re_movie }">
													<c:if test="${param_mv_seq == movie.mv_seq }">
														<option value="${movie.mv_seq }" id="${movie.mv_img }" selected>${movie.mv_title }</option>
													</c:if>
													
													<c:if test="${param_mv_seq != movie.mv_seq }">
														<option value="${movie.mv_seq }" id="${movie.mv_img }">${movie.mv_title }</option>
													</c:if>
										
												</c:forEach>
												
											</select>
										</div>
									
									</td>
									<%
								}else{
									%>
									
									<td>
									<div>
										<img src="img/no_image.gif" alt="영화이미지" id="movieImg" width="90px"height="140px;">
										<select name="mv_seq" id="mv" onchange="changeImg()">
											<option value="0">영화제목들</option>
											
											<c:forEach var="movie" items="${re_movie }">
												<option value="${movie.mv_seq }" id="${movie.mv_img }">${movie.mv_title }</option>
											</c:forEach>
											
										</select>
									</div>


								</td>
									
									<%
								}
							%>
								
							</tr>
						</table>	
					<%
				}
			%>
		</div>
		
		<div style="display:inline-block; color:#a94442; border:1px solid;">
			<!-- 상영차 선택 -->
			<%
				if(request.getParameter("mv_seq") !=null){
					List<TheaterDTO> th_num_List = thdao.selectTh_Num(request.getParameter("th_name"),request.getParameter("th_cinema"));
					%>
						<table>
							<%
								for(int i=0;i<th_num_List.size();i++){
									%>
										<tr>
											<td onmouseover ="changeBg(1,this)" onmouseout="changeBg(2,this)" onclick="location.href='admin.jsp?mode=Admin/showMovie/ShowMovie&th_name=<%=request.getParameter("th_name")%>&th_cinema=<%=request.getParameter("th_cinema")%>&th_s_date=<%=request.getParameter("th_s_date")%>&th_e_date=<%=request.getParameter("th_e_date")%>&mv_seq=<%=request.getParameter("mv_seq")%>&th_num=<%=th_num_List.get(i).getTh_num()%>'">
												[<%=th_num_List.get(i).getTh_num() %>] 회차
											</td>
										</tr>
									<%
								}
							%>
							
						</table>
					<%
				}
			%>
		</div>
		
		
		<div style="display:inline-block; color:#a94442; " id="selected">
			<!-- 해당 회차 몇시에 시작하는지 체크 -->
			<%if(request.getParameter("th_num") != null){
				
				
				
				if(request.getParameter("th_time")==null){
					%>
						<table>
							<tr>
								<td>
									<select name="th_time" onchange="clickSelect()" id="th_time">
										<%for(int i =0;i<24;i++){
										%>
										<%if(i<10){
											%>
												<option value="1991-07-05 0<%=i%>:00:00">0<%=i%> : 00</option>
											<%
										}else{
											%>
												<option value="1991-07-05 <%=i%>:00:00"><%=i %> : 00</option>
											<% 
										}
										} %>
									</select>
								</td>
							</tr>
							
						
						
					
					</table>
					<%
				}else{
					%>
						<table>
							<tr>
								<td>
									<select name="th_time" onchange="clickSelect()" id="th_time">
										<%for(int i =0;i<24;i++){
										%>
										<%if(i<10){
											String checkI="1991-07-05 0"+i+":00:00";
											if(checkI.equals(request.getParameter("th_time"))){
												%>
												<option value="1991-07-05 0<%=i%>:00:00" selected>0<%=i%> : 00</option>
												<%
											}else{
												%>
												<option value="1991-07-05 0<%=i%>:00:00">0<%=i%> : 00</option>
												<%
											}
											
										}else{
											String checkI="1991-07-05 "+i+":00:00";
											if(checkI.equals(request.getParameter("th_time"))){
												%>
												<option value="1991-07-05 <%=i%>:00:00" selected><%=i %> : 00</option>
												<%
											}else{
												%>
												<option value="1991-07-05 <%=i%>:00:00" ><%=i %> : 00</option>
												<%
											}
											%>
												
											<% 
										}
										} %>
									</select>
								</td>
							</tr>
					</table>
					
					<input type="button" value="저장" onclick="location.href='Admin/showMovie/UpdateTheater.jsp?th_name=<%=request.getParameter("th_name")%>&th_cinema=<%=request.getParameter("th_cinema")%>&th_s_date=<%=request.getParameter("th_s_date")%>&th_e_date=<%=request.getParameter("th_e_date")%>&mv_seq=<%=request.getParameter("mv_seq")%>&th_num=<%=request.getParameter("th_num")%>&th_time=<%=request.getParameter("th_time")%>'">
					<%
				}
				%>
					
				
				
				<%
				
			}
			%>
		</div>
	
</div>
<br>

<input type="button" value="다시하기" onclick="location.href='admin.jsp?mode=Admin/showMovie/ShowMovie'">


<script type="text/javascript">
	function changeImg(){
		$('#movieImg').attr('src',$('#mv option:selected').attr('id'));
		location.href="admin.jsp?mode=Admin/showMovie/ShowMovie"+
				"&th_name=<%=request.getParameter("th_name")%>"+
				"&th_cinema=<%=request.getParameter("th_cinema")%>"+
				"&th_s_date=<%=request.getParameter("th_s_date")%>"+
				"&th_e_date=<%=request.getParameter("th_e_date")%>"+
				"&mv_seq="+$('#mv option:selected').attr('value');
	}
</script>



<script type="text/javascript">
function clickSelect(){
	location.href="admin.jsp?mode=Admin/showMovie/ShowMovie"+
	"&th_name=<%=request.getParameter("th_name")%>"+
	"&th_cinema=<%=request.getParameter("th_cinema")%>"+
	"&th_s_date=<%=request.getParameter("th_s_date")%>"+
	"&th_e_date=<%=request.getParameter("th_e_date")%>"+
	"&mv_seq=<%=request.getParameter("mv_seq")%>"+
	"&th_num=<%=request.getParameter("th_num")%>"+
	"&th_time="+$('#th_time option:selected').attr('value');
	
}
</script>
<script type="text/javascript">
	function changeBg(a,b){
		if(a==1){
			b.style.background="white";
		}if(a==2){
			b.style.background="#282828";
		}
	}
</script>



</body>
</html>