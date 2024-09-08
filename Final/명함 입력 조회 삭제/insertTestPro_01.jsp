<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용 --%>
<%--JSP 페이지가 생성할 문서의 타입 지정--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%-- 웹 브라우저에서 서버로 넘어오는 파라미터 값에 한글이 있는 경우, 한글깨짐 방지(post 방식)--%>
<%request.setCharacterEncoding("utf-8");%>

<%-- request 내장객체의 getParameter() 메소드를 사용 프로퍼티 값 읽기 --%>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String tell = request.getParameter("tell");
String department = request.getParameter("department");
String position = request.getParameter("position");
String member_addr = request.getParameter("member_addr");
String detail_addr = request.getParameter("detail_addr");

Connection conn = null;//connection은 데이터베이스와 연결하는 객체입니다
PreparedStatement pstmt = null;// sql문 전송하는 객체인 PreparedStatement 
String str = "";//문자열을 공백으로 출력

/*예외 처리 부분입니다.*/
try {
	/*연동할 DB를 포함한 url*/
	String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp?serverTimezone=Asia/Seoul";
	
	String dbId = "jspid";//사용자 계정
   	String dbPass="jsppass";//사용자 패스워드

   	/*DriverManager 등록*/
	Class.forName("com.mysql.cj.jdbc.Driver");
	/*Connection 객체의 url,id,pass를 얻어옴.*/
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	/*sql은 membertbl테이블의 values (?,?,?,?,?,?,?)을 레코드 추가 
	?에 해당되는 필드의 데이터 타입은 문자열이며 읽어올 프로퍼티 값의 갯수대로 넣기*/
	String sql = "insert into memberTBL values (?,?,?,?,?,?,?)";
	/*sql이 실행할 쿼리문 */
	pstmt = conn.prepareStatement(sql);
	
	/*PrepareStatement가 제공하는 setString 메소드
	순차적으로 제공*/
	pstmt.setString(1, name);
	pstmt.setString(2, department);
	pstmt.setString(3, position);
	pstmt.setString(4, email);
	pstmt.setString(5, tell);
	pstmt.setString(6, member_addr);
	pstmt.setString(7, detail_addr);

	pstmt.executeUpdate();

	str = "회원 등록이 완료되었습니다 :";

} 
catch (Exception e) {//Exception e가 발생할 경우 작성하는 문구
	e.printStackTrace();
	str = "회원 등록에 실패했습니다";
} 
finally {//try 문에서 더이상의 실행이 필요 없을 경우 마지막으로 입력하는 문구
	if (pstmt != null)
		try {
			pstmt.close();
		} catch (SQLException sqle) {}
	if (conn != null)
		try {
			conn.close();
		} catch (SQLException sqle) {}
}
%>

<html>
<head>
<title>레코드 추가</title>

</head>

<body>
<div style=" text-align: center; line-height: 400px; border: 50px solid #C4B9F5;width: 50%;height: 40%;margin: 10% auto;font-size: 40px;font-weight: bold;color: #919191;">
	  <%=str %><!-- 상단에 지정한 실패/성공 문구를 출력함 -->
	  </div>
</body>
</html>