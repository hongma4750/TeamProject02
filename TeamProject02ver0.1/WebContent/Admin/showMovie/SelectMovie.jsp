<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="sist.co.Movie.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	function update(a){
		if(a==1){
			if($('#onMovie option:selected').attr('value') != null){
				location.href="Admin/showMovie/ChangeMovie.jsp?mv_seq="+$('#onMovie option:selected').attr('value');
				return true;
			}else{
				return false;
			}
		}else if(a==2){
			if($('#offMovie option:selected').attr('value') != null){
				location.href="Admin/showMovie/ChangeMovies.jsp?mv_seq="+$('#offMovie option:selected').attr('value');
				return true;
			}else{
				return false;
			}
		}
	}
</script>
</head>
<body>

<div>
	<div style="border:1px solid; display:inline-block; height:100px;" >
		<!-- 상영중인 영화 -->
		<h3>상영중인 영화</h3>
			<%
				MovieDAO dao = MovieDAO.getInstance();
				
				List<MovieDTO> on_List = dao.getOnMovie();

			%>
			<select id="onMovie">
				<%for(int i=0;i<on_List.size();i++){
					if(on_List.size()==0){
						%>
							<option>상영중인 영화가 없습니다.</option>
						<%
					}else{
						%>
						<option value="<%=on_List.get(i).getMv_seq() %>"><%=on_List.get(i).getMv_title() %></option>
						<%
					}
					
				}
				%>
			</select>
			<input type="button" value="상영내리기" onclick="return update(1)">
	</div>
	<br>
	<div style="border:1px solid; display:inline-block; height:100px;" >
		<!-- 상영중인 영화 -->
		<h3>상영 안하고 있는 영화</h3>
			<%

				List<MovieDTO> off_List = dao.getOffMovie();

			%>
			<select id="offMovie">
				<%for(int i=0;i<off_List.size();i++){
					
					if(off_List.size()==0){
						%>
							<option selected>상영 안하고 있는 영화가 없습니다.</option>
						<%
					}else{
						%>
						<option value="<%=off_List.get(i).getMv_seq() %>"><%=off_List.get(i).getMv_title() %></option>
					<%
					}
					
				}
				%>
			</select>
			<input type="button" value="상영하기" onclick="return update(2)">
	</div>
</div>
</body>
</html>