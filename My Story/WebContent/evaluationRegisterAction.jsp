<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="evaluation.EvaluationDTO" %>
<%@ page import="evaluation.EvaluationDAO" %>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userID = null;
	//로그인한 상태라서 userID에 세션이 존재한다면
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href='userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}

	String lectureName = null;
	String professorName = null;
	int lectureYear = 0;
	String semesterDivide = null;
	String lectureDivide = null;
	String evaluationTitle = null;
	String evaluationContent = null;
	String totalScore = null;
	String creditScore = null;
	String comfortableScore = null; 
	String scopeScore = null;


	if (request.getParameter("lectureName") != null) {
		lectureName = request.getParameter("lectureName");
	}
	if (request.getParameter("professorName") != null) {
		professorName = request.getParameter("professorName");
	}
	//LectureYear는 int형이기 때문입니다. 사용자에게 받은 것은 문자형이기 때문에 int형으로 바꿔 줍니다.
	if (request.getParameter("lectureYear") != null) {
		try {
			lectureYear = Integer.parseInt(request.getParameter("lectureYear"));
		} catch (Exception e) {
			System.out.println("방문 연도 데이터 오류");
		}
	}
	
	if (request.getParameter("semesterDivide") != null) {
		semesterDivide = request.getParameter("semesterDivide");
	}
	if (request.getParameter("lectureDivide") != null) {
		lectureDivide = request.getParameter("lectureDivide");
	}
	if (request.getParameter("evaluationTitle") != null) {
		evaluationTitle = request.getParameter("evaluationTitle");
	}
	if (request.getParameter("evaluationContent") != null) {
		evaluationContent = request.getParameter("evaluationContent");
	}
	if (request.getParameter("totalScore") != null) {
		totalScore = request.getParameter("totalScore");
	}
	if (request.getParameter("creditScore") != null) {
		creditScore = request.getParameter("creditScore");
	}
	if (request.getParameter("comfortableScore") != null) {
		comfortableScore = request.getParameter("comfortableScore");
	}
	if (request.getParameter("scopeScore") != null) {
		scopeScore = request.getParameter("scopeScore");
	}

	


	if (lectureName == null || professorName == null || lectureYear == 0 || semesterDivide == null || lectureDivide == null || evaluationTitle == null ||
			evaluationContent == null || totalScore == null || creditScore == null || comfortableScore == null || scopeScore == null || evaluationTitle.equals("") ||
			evaluationContent.equals("") ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}

	EvaluationDAO evaluationDAO = new EvaluationDAO();
	int result = evaluationDAO.write(new EvaluationDTO(0, userID, lectureName, professorName, lectureYear, semesterDivide, 
			lectureDivide, evaluationTitle, evaluationContent, totalScore, creditScore, comfortableScore, scopeScore, 0));

	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('등록에 실패했습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>