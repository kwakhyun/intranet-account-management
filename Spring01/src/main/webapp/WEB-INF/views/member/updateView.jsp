<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>사내 계정 수정</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='updateForm']");

		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			location.href = "/member/detailView?dealer_no=${update.dealer_no}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}";
		})

		$(".update_btn").on("click", function() {
			if (valChk()) {
				return false;
			}
			formObj.attr("action", "/member/update");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})

	function valChk() {
		var updateForm = $("form[name='updateForm'] .chk").length;
		for (var i = 0; i < updateForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
<body class="body">

	<div id="root">
		<header>
			<h1>계정 수정</h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="updateForm" method="post" action="/member/update">
				<input type="hidden" name="dealer_no" value="${update.dealer_no}" />
				<div class="wrap">
					<label for="dealer_name">이름</label>
					<div class="item">
						<input type="text" id="dealer_name" name="dealer_name"
							value="${update.dealer_name}" class="chk" title="이름을 입력하세요" />
					</div>
					
					<label for="home_tel_no">전화번호</label>
					<div class="item">
						<input type="text" id="home_tel_no" name="home_tel_no"
							value="${update.home_tel_no}" />
					</div>
					
					<label for="start_date">계정 생성일</label>
					<div class="item">
						<input type="text" id="start_date" name="start_date"
							value="${update.start_date}" />
					</div>
					
					<label for="end_date">계정 만료일</label>
					<div class="item">
						<input type="text" id="end_date" name="end_date"
							value="${update.end_date}" />
					</div>
					
					<label for="email">이메일</label>
					<div class="item">
						<input type="text" id="email" name="email" value="${update.email}" />
					</div>
					
					<label for="group_part">그룹 코드</label>
					<div class="item">
						<input type="text" id="group_part" name="group_part"
							value="${update.group_part}" />
					</div>
					
					<label for="work_group">소속</label>
					<div class="item">
						<input type="text" id="work_group" name="work_group"
							value="${update.work_group}" />
					</div>
					
					<label for="login_able">LOGIN ABLE</label>
					<div class="item">
						<input type="text" id="login_able" name="login_able"
							value="${update.login_able}" />
					</div>
					
					<label for="leave_date">L-DATE</label>
					<div class="item">
						<input type="text" id="leave_date" name="leave_date"
							value="${update.leave_date}" />
						<fmt:formatDate value="${update.leave_update_date}"
							pattern="yyyy-mm-dd" />
					</div>
				</div>

				<div id="btn">
					<button class="update_btn" type="submit">저장</button>
					<button class="cancel_btn" type="submit">취소</button>
				</div>
				
				<c:if test="${admin.admin_id == null}">
					<p>관리자 로그인이 필요합니다.</p>
				</c:if>
				
			</form>
		</section>
		<hr />
	</div>
</body>
</html>