<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>우리동네 이야기</title>
<!-- bootstrap css 추가 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- custom css 추가 -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String lectureDivide = "전체";
		String searchType = "최신순";
		String search = "";
		int pageNumber = 0;
		if (request.getParameter("lectureDivide") != null) {
			lectureDivide = request.getParameter("lectureDivide");
		}
		if (request.getParameter("searchType") != null) {
			searchType = request.getParameter("searchType");
		}
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		if (request.getParameter("pageNumber") != null) {
			try {
				// 입력받을때 String형태 이기 때문에 int 로 형변환
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch (Exception e) {
				System.out.println("검색 페이지 번호 오류");
			}

		}
		String userID = null;
		//로그인한 상태라서 userID에 세션이 존재한다면
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		//로그인을 하지 않았다면
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href='userLogin.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
		//사용자가 이메일 인증을 받았는지 확인
		boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
		//이메일 인증이 되지 않은 사람은 이메일 인증을 할 수 있는 페이지로 보냄
		if (emailChecked == false) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='emailSendConfirm.jsp';");
			script.println("</script>");
			script.close();
			return;
		}
	%>
	<nav class="navbar navbar-expend-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">우리동네 이야기</a>
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
					data-toggle="dropdown"> 회원관리 </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">

						<%
							if (userID == null) {
						%>
						<a class="dropdown-item" href="userLogin.jsp">로그인!</a> <a
							class="dropdown-item" href="userJoin.jsp">회원가입!</a>
						<%
							} else {
						%>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃!</a>
						<%
							}
						%>
					</div></li>
			</ul>
			<form action="./index.jsp" method="get"
				class="form-inline my-2 my-lg-0">
				<input type="text" name="search" class="form-control mr-sm-2"
					type="search" placeholder="내용을 입력해 주세요." aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</nav>
	<section class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="lectureDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="동네가게"
					<% if(lectureDivide.equals("동네가게")) out.println("selected"); %>>동네가게</option>
				<option value="동네공원"
					<% if(lectureDivide.equals("동네공원")) out.println("selected"); %>>동네공원</option>
				<option value="기타"
					<% if(lectureDivide.equals("기타")) out.println("selected"); %>>기타</option>
			</select> <select name="searchType" class="form-control mx-1 mt-2">
				<option value="최신순">최신순</option>
				<option value="추천순"
					<% if(lectureDivide.equals("추천순")) out.println("selected"); %>>추천순</option>

			</select> <input type="text" name="search" class="form-control mx-1 mt-2"
				placeholder="내용을 입력해 주세요.">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal"
				href="#registerModal">등록하기</a> <a class="btn btn-danger mx-1 mt-2"
				data-toggle="modal" href="#reportModal">신고하기</a>
		</form>
		<%
			ArrayList<EvaluationDTO> evaluationList = new ArrayList<EvaluationDTO>();
			evaluationList = new EvaluationDAO().getList(lectureDivide, searchType, search, pageNumber);
			//반환되어 온 리스트가 널값이 아니라면 
			if(evaluationList != null)
				for(int i = 0 ; i < evaluationList.size(); i++){
					//총 6개의 강의평가 글에서 5개까지만 출력이 되고  실제로 evaluation이라는 변수를 만들어서 현재리스트에 있는 해당 index를 가져오도록 해서 카드안에서 출력을 하도록 만들어준다.
					if(i == 5) break;
					EvaluationDTO evaluation = evaluationList.get(i);
				
		%>


		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">지역 : <span style="color: blue"> <%= evaluation.getLectureName() %> </span>
						&nbsp; 방문한 곳: <span style="color: blue"><%= evaluation.getProfessorName() %></span>
					</div>
					<div class="col-4 text-right">
					종합 점수: <span style="color: red;"><%=evaluation.getTotalScore() %></span> 점
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					<%= evaluation.getEvaluationTitle() %>&nbsp;<small>(<%=evaluation.getLectureYear() %>)
						<%=evaluation.getSemesterDivide() %></small>
				</h5>
				<p class="card-text"><%= evaluation.getEvaluationContent() %></p>
				<div class="row">
					<div class="col-9 text-left">
						편의시설<span style="color: red;"><%= evaluation.getCreditScore() %></span>
						접근성<span style="color: red;"><%= evaluation.getComfortableScore() %></span>
						구경거리<span style="color: red;"><%= evaluation.getScopeScore() %></span>
						<span style="color: green;">(추천: <%= evaluation.getLikeCount() %>)
						</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?')"
							href="./likeAction.jsp?evalutionID=<%= evaluation.getEvaluationID() %>">추천</a> <a
							onclick="return confirm('삭제하시겠습니까?')"
							href="./deleteAction.jsp?evalutionID=<%= evaluation.getEvaluationID() %>">삭제</a>
					</div>

				</div>
			</div>
		</div>
		<%
				}
		%>

	</section>
	<ul class="pagination justify-content-center mt-3">
		<li class="page-item">
<%
		if(pageNumber <= 0){
%> 
<a class="page-link disabled">이전</a> <%
} else{
%> 
		
<a class="page-link" href="./index.jsp?lectureDivide=<%= URLEncoder.encode(lectureDivide, "UTF-8") %>
&searchType=<%= URLEncoder.encode(searchType, "UTF-8") %>&search=<%= URLEncoder.encode(search, "UTF-8") %>&pageNumber=
<%= pageNumber - 1 %>"> 이전 </a>
		
<% } %>
		</li>
		
		<li>
		<%
		if(evaluationList.size() < 6){
		%> 
		<a class="page-link disabled">다음</a> 
		
		<%
		} else{
		%> 
		
		<a class="page-link"
			href="./index.jsp?lectureDivide=<%= URLEncoder.encode(lectureDivide, "UTF-8") %>&searchType=
			<%= URLEncoder.encode(searchType, "UTF-8") %>&search=<%= URLEncoder.encode(search, "UTF-8") %>&pageNumber=
		<%= pageNumber + 1 %>">이전</a>
<% } %>
	
		</li>
	</ul>

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
								<label>동네이름</label> <input type="text" name="lectureName"
									class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-6">
								<label>가게이름</label> <input type="text" name="professorName"
									class="form-control" maxlength="20">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>방문날짜</label> <select name="lectureYear"
									class="form-control">
									<option value="2020" selected>2020</option>
									<option value="2019">2019</option>
									<option value="2018">2018</option>
									<option value="2017">2017</option>
									<option value="2016">2016</option>
									<option value="2015">2015</option>
									<option value="2014">2014</option>
									<option value="2013">2013</option>
									<option value="2012">2012</option>
									<option value="2011">2011</option>
									<option value="2010">2010</option>
									<option value="2009">2009</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>방문 계절</label> <select name="semesterDivide"
									class="form-control">
									<option value="봄" selected>봄 (3월~5월)</option>
									<option value="여름">여름 (6월~9월)</option>
									<option value="가을">가을 (9월~11월)</option>
									<option value="겨울">겨울 (12월~2월)</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>동반인원</label> <select name="lectureDivide"
									class="form-control">
									<option value="연인" selected>연인과 함께</option>
									<option value="가족">가족과 함께</option>
									<option value="이웃">이웃과 함께</option>
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
									<option value="5" selected>5</option>
									<option value="4">4</option>
									<option value="3">3</option>
									<option value="2">2</option>
									<option value="1">1</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>편의시설</label> <select name="creditScore"
									class="form-control">
									<option value="5" selected>5</option>
									<option value="4">4</option>
									<option value="3">3</option>
									<option value="2">2</option>
									<option value="1">1</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>접근성</label> <select name="comfortableScore"
									class="form-control">
									<option value="5" selected>5</option>
									<option value="4">4</option>
									<option value="3">3</option>
									<option value="2">2</option>
									<option value="1">1</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>구경거리</label> <select name="scopeScore"
									class="form-control">
									<option value="5" selected>5</option>
									<option value="4">4</option>
									<option value="3">3</option>
									<option value="2">2</option>
									<option value="1">1</option>
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
							<button type="submit" class="btn btn-danger">신고하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #ffffff;">
		Copyright &copy; 2020 똥글이 All right Reserved. </footer>


	<!-- jquery javascript 추가 -->
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>


</body>
</html>