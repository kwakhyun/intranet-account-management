<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>사내 계정 생성</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='joinForm']");

		$(".join_btn").on("click", function() {
			if (valChk()) {
				return false;
			}
			formObj.attr("action", "/member/join");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})

	function valChk() {
		var regForm = $("form[name='joinForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
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
			<h1>계정 생성</h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="joinForm" method="post" action="/member/join">
			
				<c:if test="${admin.admin_id != null}">
					<div class="wrap">
						<label for="dealer_no">아이디</label>
						<div class="item">
							<input type="text" id="dealer_no" name="dealer_no" class="chk"
								title="아이디를 입력하세요" />
						</div>
	
						<label for="dealer_name">이름</label>
						<div class="item">
							<input type="text" id="dealer_name" name="dealer_name" class="chk"
								title="이름을 입력하세요" />
						</div>
	
						<label for="home_tel_no">전화번호</label>
						<div class="item">
							<input type="text" id="home_tel_no" name="home_tel_no" class="chk"
								title="번호를 입력하세요" />
						</div>
						
						<label for="my_cti_manager_id">내선번호</label>
						<div class="item">
							<input type="text" id="my_cti_manager_id" name="my_cti_manager_id" />
						</div>
	
						<label for="email">이메일</label>
						<div class="item">
							<input type="text" id="email" name="email" />
						</div>
	
						<label for="group_part">그룹코드</label>
						<div class="item">
							<input type="text" id="group_part" name="group_part" class="chk"
								title="코드를 입력하세요" />
						</div>
	
						<label for="work_group">소속</label>
						<div class="radio">
							<input type="radio" id="work_group" name="work_group" value="CS" /><label for="work_group">고객센터</label>
							<input type="radio" id="work_group2" name="work_group" value="EMP" /><label for="work_group2">본부</label>
						</div>
					</div>
					
					<div id="btn">
						<button class="join_btn" type="submit">완료</button>
					</div>
				</c:if>
				
				<c:if test="${admin.admin_id == null}">
					<p>관리자 로그인이 필요합니다.</p>
				</c:if>
				
			</form>
		</section>
		<hr />
	</div>
</body>
</html>