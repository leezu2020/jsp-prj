<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>강의평가 웹 사이트</title>
<!--  부트스트랩 css추가하기  -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!--  부트스트랩 css추가하기  -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();
	}
	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if (emailChecked == false) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailSendConfirm.jsp';");
		script.println("</script>");
		script.close();
	}
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">강의평가 웹 사이트</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">메인</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="dropdown"
					data-toggle="dropdown">회원관리</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
<%
	if (userID == null) {
%>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a> <a
							class="dropdown-item" href="userJoin.jsp">회원가입</a>
<%
	} else {
%>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
<%
	}
%>
					</div></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="내용을 입력하세요." aria-label="search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</nav>
	<section class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="lectureDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="전공">전공</option>
				<option value="교양">교양</option>
				<option value="기타">기타</option>
			</select> <input type="text" name="search" class="form-control mx-1 mt-2"
				placeholder="내용을 입력하세요.">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal"
				href="#registerModal">등록하기</a> <a class="btn btn-danger mx-1 mt-2"
				data-toggle="modal" href="#reportModal">신고</a>
		</form>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">
						컴퓨터개론&nbsp;<small>이주형</small>
					</div>
					<div class="col-4 text-right">
						종합<span style="color: red;">A</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					정말 좋은 강의예요.&nbsp;<small>(2017년 여름학기)</small>
				</h5>
				<p class="card-text">강의가 많이 널널해서, 솔직히 많이 배운건 없는거같아요.</p>
				<div class="row">
					<div class="col-9 text-left">
						성적<span style="color: red;">A</span> 여유로움<span style="color: red;">A</span>
						강의<span style="color: red;">C</span> <span style="color: green;">(추천:
							15)</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?')"
							href="./likeAction.jsp?evaluationID=">추천</a> <a
							onclick="return confirm('삭제하시겠습니까?')"
							href="./deleteAction.jsp?evaluationID=">삭제</a>
					</div>
				</div>
			</div>
		</div>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">
						컴퓨터그래픽스&nbsp;<small>주형</small>
					</div>
					<div class="col-4 text-right">
						종합<span style="color: red;">A</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					그닥...&nbsp;<small>(2015년 겨울학기)</small>
				</h5>
				<p class="card-text">너무빡세요. 근데 성적은 잘주십니다.</p>
				<div class="row">
					<div class="col-9 text-left">
						성적<span style="color: red;">A</span> 여유로움<span style="color: red;">D</span>
						강의<span style="color: red;">B</span> <span style="color: green;">(추천:
							5)</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?')"
							href="./likeAction.jsp?evaluationID=">추천</a> <a
							onclick="return confirm('삭제하시겠습니까?')"
							href="./deleteAction.jsp?evaluationID=">삭제</a>
					</div>
				</div>
			</div>
		</div>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">
						컴퓨터구조&nbsp;<small>이주</small>
					</div>
					<div class="col-4 text-right">
						종합<span style="color: red;">A</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					무슨소리인지 모르겠어요.&nbsp;<small>(2015년 2학기)</small>
				</h5>
				<p class="card-text">교수님이 열정은 높으신데, 그냥 어려워요</p>
				<div class="row">
					<div class="col-9 text-left">
						성적<span style="color: red;">B</span> 여유로움<span style="color: red;">B</span>
						강의<span style="color: red;">F</span> <span style="color: green;">(추천:
							0)</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?')"
							href="./likeAction.jsp?evaluationID=">추천</a> <a
							onclick="return confirm('삭제하시겠습니까?')"
							href="./deleteAction.jsp?evaluationID=">삭제</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">평가 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./evaluationRegisterAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>강의명</label> <input type="text" name="lectureName"
									class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-6">
								<label>교수명</label> <input type="text" name="professorName"
									class="form-control" maxlength="20">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>수강 연도</label> <select name="lectureYear"
									class="form-control">
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018">2018</option>
									<option value="2019">2019</option>
									<option value="2020" selected>2020</option>
								</select>
							</div>
							<div class="from-group col-sm-4">
								<label>수강 학기</label> <select name="semesterDivide"
									class="form-control">
									<option value="1학기">1학기</option>
									<option value="여름학기">여름학기</option>
									<option value="2학기" selected>2학기</option>
									<option value="겨울학기">겨울학기</option>
								</select>
							</div>
							<div class="from-group col-sm-4">
								<label>강의 구분</label> <select name="semesterDivide"
									class="form-control">
									<option value="전공">전공</option>
									<option value="교양">교양</option>
									<option value="기타" selected>기타</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" name="evaluationTitle"
								class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="evaluationContent" class="form-control"
								maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-3">
								<label>종합</label> <select name="totalScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>성적</label> <select name="gradeScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>여유로움</label> <select name="comfortableScore"
									class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>총평</label> <select name="lectureScore"
									class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./reportAction.jsp" method="post">
						<div class="form-group">
							<label>신고 제목</label> <input type="text" name="reportTitle"
								class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>신고 내용</label>
							<textarea name="reportContent" class="form-control"
								maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-danger">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer class="bg-dark mt-2 p-3 text-center" style="color: #FFFFFF;">
		Copyright %copy; 2020 이주형 All Rights Reserved. </footer>
	<!--  제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!--  파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.min.js"></script>
	<!--  부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>