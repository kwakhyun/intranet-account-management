<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="/resources/css/home.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
	})
</script>
<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="logo">
				<img alt="logo" src="/resources/img/logo.png">
			</div>
			<form name='homeForm' method="post" action="/member/login" id="login" class="input-group">
			
				<c:if test="${admin == null}">
					<input type="text" id="admin_id" name="admin_id" class="input-field" placeholder="Enter User ID" required="required">
					<input type="password" id="admin_pw" name="admin_pw" class="input-field" placeholder="Enter Password" required="required">
					<button type="submit" class="submit">Login</button>
				</c:if>
				<c:if test="${admin != null }">
					<div class="link">
						<a href="/member/list">계정 조회</a>
					</div>
					<div class="link">
						<a href="/member/joinView">계정 생성</a>
					</div>
				</c:if>
			
				<c:if test="${message == false}">
					<p style="color: red;">등록되지 않은 관리자입니다.</p>
				</c:if>
				
			</form>
			<div class="copyright">
				<img alt="copyright" src="/resources/img/copyright.png">
			</div>
		</div>
	</div>
</body>
</html>
