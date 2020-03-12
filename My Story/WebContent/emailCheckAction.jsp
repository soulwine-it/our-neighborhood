<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String code = null;
	if(request.getParameter("code") != null){
		code = request.getParameter("code");
	}
	
	UserDAO userDAO = new UserDAO();
	String userID = null;

	if(session.getAttribute("userID") != null){
		//세션값 같은 경우는 object개체를  반환하기 때문에 string으로 변환해줍니다.
		userID = (String)session.getAttribute("userID");
	}
	if(userID == null ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요')");
		script.println("location.href='userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	//현재 사용자의 이메일 주소를 받습니다.
	String userEmail = userDAO.getUserEmail(userID);
	//해당 사용자의 이메일 주소를 해쉬값을 적용한 그 데이터와 일치하는지 확인해봅니다.
	boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	//트루값이라면 인증에 성공
	if(isRight == true){
		userDAO.setUserEmailChecked(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공했습니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
%>