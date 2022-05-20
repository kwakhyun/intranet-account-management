<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="/resources/css/reset.css">
		<link rel="stylesheet" href="/resources/css/style.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	 	<title>사내 계정 정보</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			const formObj = $("form[name='detailForm']");
			
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/member/updateView");
				formObj.attr("method", "get");
				formObj.submit();
			})
			
			$(".delete_btn").on("click", function() {
				const deleteYN = confirm("※ 확인을 누르면 완전히 삭제됩니다.");
				if(deleteYN == true){
				formObj.attr("action", "/member/delete");
				formObj.attr("method", "post");
				formObj.submit();
				}
			})
			
			$(".list_btn").on("click", function() {
				location.href = "/member/list?page=${scri.page}"
						+"&perPageNum=${scri.perPageNum}"
						+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
		})
	</script>
	<body>
	
		<div id="container">
			<header>
				<h1>계정 상세</h1>
			</header>
			<hr>
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr>
			
			<section id="container">
				<form role="form" method="post" name="detailForm">
					<input type="hidden" id="dealer_no" name="dealer_no" value="${detail.dealer_no}" />
					<input type="hidden" id="page" name="page" value="${scri.page}">
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
				</form>
					<div class="wrap">
						<label for="dealer_no">아이디</label>
						<div class="item">
							<input readonly="readonly" id="dealer_no" name="dealer_no" value="${detail.dealer_no}"/>
						</div>
						
						<label for="user_group_id">그룹 ID</label>
						<div class="item">
							<input readonly="readonly" id="user_group_id" name="user_group_id" value="${detail.user_group_id}"/>
						</div>
						
						<label for="dealer_name">이름</label>
						<div class="item">
							<input readonly="readonly" id="dealer_name" name="dealer_name" value="${detail.dealer_name}"/>
						</div>
						
						<label for="home_tel_no">전화번호</label>
						<div class="item">
							<input readonly="readonly" id="home_tel_no" name="home_tel_no" value="${detail.home_tel_no}"/>
						</div>
						
						<label for="my_cti_manager_id">내선번호</label>
						<div class="item">
							<input readonly="readonly" id="my_cti_manager_id" name="my_cti_manager_id" value="${detail.my_cti_manager_id}"/>
						</div>
						
						<label for="start_date">계정 생성일</label>
						<div class="item">
							<input readonly="readonly" id="start_date" name="start_date" value="${detail.start_date}"/>
						</div>
						
						<label for="end_date">계정 만료일</label>
						<div class="item">
							<input readonly="readonly" id="end_date" name="end_date" value="${detail.end_date}"/>
						</div>
						
						<label for="email">이메일</label>
						<div class="item">
							<input readonly="readonly" id="email" name="email" value="${detail.email}"/>
						</div>
						
						<label for="group_part">그룹 코드</label>
						<div class="item">
							<input readonly="readonly" id="group_part" name="group_part" value="${detail.group_part}"/>
						</div>
						
						<label for="work_group">소속</label>
						<div class="item">
							<input readonly="readonly" id="work_group" name="work_group" value="${detail.work_group}"/>
						</div>
						
						<label for="login_able">LOGIN ABLE</label>
						<div class="item">
							<input readonly="readonly" id="login_able" name="login_able" value="${detail.login_able}"/>
						</div>
						
						<label for="leave_date">LEAVE DATE</label>
						<div class="item">
							<input readonly="readonly" id="leave_date" name="leave_date" value="${detail.leave_date}"/>
						</div>
					</div>
					
					<div id="btn">
						<c:if test="${admin != null}"><button type="submit" class="update_btn">수정</button></c:if>
						<!-- <c:if test="${admin != null}"><button type="submit" class="delete_btn">삭제</button></c:if> -->
						<button type="submit" class="list_btn">목록</button>
					</div>
			</section>
			<hr>
		</div>
	</body>
</html>
