<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<head>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Spring Test</title>
</head>

<div class="nav">
	<div>
		<ul>
			<li><a href="/member/list">계정 조회 | </a></li>
			<li><a href="/member/joinView">계정 생성 | </a></li>
			<li>
				<c:if test="${admin != null}"><a href="/member/logout">로그아웃 | </a></c:if>
				<c:if test="${admin == null}"><a href="/">로그인</a></c:if>
			</li>
		</ul>
		<ul>
			<li>
				<c:if test="${admin != null}">
					<p>접속 관리자 : ${admin.admin_id}</p>
				</c:if>
			</li>
		</ul>
	</div>
</div>