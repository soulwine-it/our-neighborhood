<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<a class="dropdown-item" href="userLogin.jsp">로그인!</a> <a
							class="dropdown-item" href="userJoin.jsp">회원가입!</a> <a class="dropdown-item"
							href="userLogout.jsp">로그아웃!</a>
					</div></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="내용을 입력해 주세요." aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</nav>
	<section class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="lectureDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="동네가게">동네가게</option>
				<option value="동네공원">동네공원</option>
				<option value="기타">기타</option>
			</select> <input type="text" name="search" class="form-control mx-1 mt-2"
				placeholder="내용을 입력해 주세요.">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal"
				href="#registerModal">등록하기</a> <a class="btn btn-danger mx-1 mt-2"
				data-toggle="modal" href="#reportModal">신고하기</a>
		</form>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">
						쌍문역 &nbsp;<small> 둘리뮤지엄</small>
					</div>
					<div class="col-4 text-right">
						종합평가<span style="color: red;">5</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					좋아요&nbsp;<small>2017년 여름</small>
				</h5>
				<p class="card-text">둘리가 살아 숨쉬는거 같아요</p>
				<div class="row">
					<div class="col-9 text-left">
						편의시설<span style="color: red;">5</span> 접근성<span
							style="color: red;">5</span> 구경거리<span style="color: red;">5</span>
						<span style="color: green;">(추천: 15)</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?')"
							href="./likeAction.jsp?evalutionID=">추천</a> <a
							onclick="return confirm('삭제하시겠습니까?')"
							href="./deleteAction.jsp?evalutionID=">삭제</a>
					</div>

				</div>
			</div>
		</div>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">
						쌍문역 &nbsp;<small> 땡땡안경원</small>
					</div>
					<div class="col-4 text-right">
						종합평가<span style="color: red;">5</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					안경 저렴하게 잘 샀어요&nbsp;<small>2019년 여름</small>
				</h5>
				<p class="card-text">전자파 차단 렌즈랑 같이 맞췄는데 정말 저렴하게 주셔서 기분이 좋았어요</p>
				<div class="row">
					<div class="col-9 text-left">
						편의시설<span style="color: red;">4</span> 접근성<span
							style="color: red;">5</span> 구경거리<span style="color: red;">3</span>
						<span style="color: green;">(추천: 15)</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?')"
							href="./likeAction.jsp?evalutionID=">추천</a> <a
							onclick="return confirm('삭제하시겠습니까?')"
							href="./deleteAction.jsp?evalutionID=">삭제</a>
					</div>

				</div>
			</div>
		</div>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">
						도봉구&nbsp;<small>도봉구민회관</small>
					</div>
					<div class="col-4 text-right">
						종합평가<span style="color: red;">5</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					아이 교육 프로그램이 많아요&nbsp;<small>2020년 봄</small>
				</h5>
				<p class="card-text">집에 있는 아이때문에 알아보았는데 아이들이 참여할 수 있는 실습 강의가 많아서
					좋아요</p>
				<div class="row">
					<div class="col-9 text-left">
						편의시설<span style="color: red;">5</span> 접근성<span
							style="color: red;">5</span> 구경거리<span style="color: red;">5</span>
						<span style="color: green;">(추천: 15)</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?')"
							href="./likeAction.jsp?evalutionID=">추천</a> <a
							onclick="return confirm('삭제하시겠습니까?')"
							href="./deleteAction.jsp?evalutionID=">삭제</a>
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
								<label>방문 계절</label> <select name="semesterDvide"
									class="form-control">
									<option value="봄" selected>봄 (3월~5월)</option>
									<option value="여름">여름 (6월~9월)</option>
									<option value="가을">가을 (9월~11월)</option>
									<option value="겨울">겨울 (12월~2월)</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>동반인원</label> <select name="lectureDvide"
									class="form-control">
									<option value="연인" selected>연인과 함께</option>
									<option value="가족">가족과 함께</option>
									<option value="이웃">이웃과 함께</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" name="evaluationTime"
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
								<label>접근성</label> <select name="comfortablesScore"
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