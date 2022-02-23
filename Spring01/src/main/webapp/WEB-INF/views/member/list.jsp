<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="/resources/css/reset.css">
		<link rel="stylesheet" href="/resources/css/style.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/litera/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	 	<title>사내 계정 관리</title>
	</head>
	
	<body class="body">
		<div id="container">
			<header>
				<h1>계정 조회</h1>
			</header>
			<hr />

			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form role="form" method="get">
					<table class="table table-hover">
						<tr>
						<th>아이디</th>
						<th>그룹ID</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>생성일</th>
						<th>이메일</th>
						<th>그룹코드</th>
						<th>소속</th>
						<th>SMS</th>
						<th>퇴사일</th>
						</tr>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>
									<a href="/member/detailView?dealer_no=${list.dealer_no}
										&page=${scri.page}
										&perPageNum=${scri.perPageNum}
										&searchType=${scri.searchType}
										&keyword=${scri.keyword}"><c:out value="${list.dealer_no}"></c:out></a>
								</td>
								<td><c:out value="${list.user_group_id}"></c:out></td>
								<td>
									<a href="/member/detailView?dealer_no=${list.dealer_no}
										&page=${scri.page}
										&perPageNum=${scri.perPageNum}
										&searchType=${scri.searchType}
										&keyword=${scri.keyword}"><c:out value="${list.dealer_name}"></c:out></a>
								</td>
								<td><c:out value="${list.home_tel_no}"></c:out></td>
								<td><c:out value="${list.start_date}"></c:out></td>
								<td><c:out value="${list.email}"></c:out></td>
								<td><c:out value="${list.group_part}"></c:out></td>
								<td><c:out value="${list.work_group}"></c:out></td>
								<td><c:out value="${list.login_able}"></c:out></td>
								<td><c:out value="${list.leave_date}"></c:out></td>
							</tr>
						</c:forEach>
					</table>
					
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="s" <c:out value="${scri.searchType == null ? 'selected' : ''}" />>선택</option>
								<option value="i" <c:out value="${scri.searchType eq 'i' ? 'selected' : ''}" />>아이디</option>
								<option value="n" <c:out value="${scri.searchType eq 'n' ? 'selected' : ''}" />>이름</option>
								<option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}" />>전화번호</option>
							</select>
						</div>
						
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordId" value="${scri.keyword}" class="form-control" />
								<span class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default">검색</button>
								</span>
							</div>
						</div>
						
						<script>
							$(function() {
								$('#searchBtn').click(function() {
									self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + encodeURIComponent($('#keywordId').val());
								});
							});
						</script>
					</div>
					
					<div class="page">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a class="back" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">◀</a></li>
							</c:if>
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNo">
								<li><a href="list${pageMaker.makeSearch(pageNo)}">${pageNo}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a class="next" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">▶</a></li>
							</c:if>
						</ul>
					</div>
					
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>