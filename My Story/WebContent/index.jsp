<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>우리동네 이야기</title>
<!-- bootstrap css 추가 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- custom css 추가 -->
<link rel="stylesheet" href="./css/custom.css"> 
</head>
<body>
	<nav class="navbar navbar-expend-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">우리동네 이야기</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">메인</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
					회원관리
					</a>
						<div class="dropdown-menu" aria-labelledby="dropdown">
							<a class="dropdown-item" href="#">로그인</a>
							<a class="dropdown-item" href="#">회원가입</a>
							<a class="dropdown-item" href="#">로그아웃</a>
						</div>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="내용을 입력해 주세요." aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</nav>
	
<!-- jquery javascript 추가 -->
<script src="./js/jquery.min.js"></script>
<script src="./js/popper.js"></script>
<script src="./js/bootstrap.min.js"></script> 


</body>
</html>