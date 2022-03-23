<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	
		var k = 10;
		var m =`CartList?num=${k}`;
		console.log(m);
		
	</script>
</head>
<body>
	<h1>Main 화면입니다.</h1>
	<jsp:include page="common/top.jsp" flush="true" /><br>
	<jsp:include page="common/menu.jsp" flush="true" />
	<hr>
	<jsp:include page="goods/goodsList.jsp" flush="true" />
</body>
</html>