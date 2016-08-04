<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AddTheater:admin</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function callme(value){
	var textValue = document.getElementById('th_name').value;
	var selectValue = document.getElementById('sel').value;
	document.myvalue.th_name.value=textValue;
	document.myvalue.data.value=selectValue;
	location.href="admin.jsp?mode=Admin/add/AddTheater&data="+selectValue+"&th_name="+textValue;
}
</script>
<style type="text/css">
table#onetb {
	border-collapse: collapse;
	border: 1px solid black;	
	width: 600px;
	height: 100px;
}
table#twotb {
	border-collapse: collapse;
	border: 1px solid black;	
	width: 600px;
	height: 100px;
}
table#threetb {
	border-collapse: collapse;
	border: 1px solid black;	
	width: 100%;
	height: 100px;
}
.st{
	background-color: #dcdcdc;
}
th,td{
	border-collapse: collapse;
	border: 1px solid black;
	text-align: center;
	height: 40px;
}
select {
	width: 200px;
}
#bt{
	width: 200px;
	height: 40px;
}

</style>
</head>
<body>

<%
String th_name;
if(request.getParameter("th_name")==null) th_name="";
else th_name = request.getParameter("th_name");
System.out.println("th_name:" + th_name);

String data;
if(request.getParameter("data")==null) data="0";
else data = request.getParameter("data");
System.out.println("data:" + data);



%>


<table id="onetb">
	<tr>
		<td colspan="2" class="st">지점명과 지점의 전체 상영관을 선택하세요 </td>
	</tr>
	<tr>
		<th>지점</th>
		<td><input type="text" id="th_name" name="th_name" value="<%=th_name %>"></td>
	</tr>
	<tr>
		<th>상영관</th>
		<td>총 
			<select id="sel" style="width: 100px" onchange="callme(value)">
				<%for(int i = 1; i < 11; i++){ %>
					<option value="<%=i %>"	
						<%if(data!=null){
							if(i == Integer.parseInt(data)){ %> 
							selected="selected" <%}} 
						%>><%=i %>
					</option>
				<%} %>
			</select>
			관
		</td>
	</tr>
</table>

<p></p>

<form name="myvalue" action="Admin/add/AddTheaterAf.jsp">
<table id="twotb">
	<tr>
		<td colspan="2" class="st">각 상영관의 총 회차 및 좌석수를 선택하세요</td>
	</tr>
	<tr>
		<th>회차</th>
		<td>
			<table id="threetb">
				<%-- <tr>
					<th><%=data+1 %>관</th> 
				</tr> --%>
				<%for(int i = 0; i < Integer.parseInt(data); i++){ %>
					<tr>
						<th><%=i+1 %>관 </th> 
						<td>총 
							<select name="<%=i+1 %>" style="width: 150px">
								<%for(int j = 1; j < 11; j++){ %>
									<option value="<%=j %>"><%=j %></option>
								<%} %>
							</select>
							차
						</td>
						<td>총 <input type="number" name="th_totalseat<%=i+1 %>" min="50" max="300" required> 석
						</td>
					</tr>	
				<%} %> 
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<input type="hidden" name="th_name" value="<%=th_name%>">
			<input type="hidden" name="data" value="<%=data%>">
			<input type="submit" value="추가" id="bt">
		</td>
	</tr>
</table>
</form>



</body>
</html>