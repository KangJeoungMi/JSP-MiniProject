<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입을 아래와 같이 지정하였습니다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%-- 웹 브라우저에서 서버로 넘어오는 파라미터 값에 한글이 있는 경우, 한글 깨짐을 방지합니다.(post 방식)--%>
<%request.setCharacterEncoding("utf-8");%>

<%
//request.getParameter("  "); HTTP요청의 파라미터 값을 얻기 위해 사용함
String name= request.getParameter("name");
String tell= request.getParameter("tell");

Connection conn=null;//connection은 데이터베이스와 연결하는 객체입니다
PreparedStatement pstmt=null;// sql문 전송하는 객체인 PreparedStatement 
ResultSet rs=null;

/* 예외 처리 */
try{
	/*연동할 DB를 포함한 url*/
	String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp?serverTimezone=Asia/Seoul"; 	
	
	
   	String dbId="jspid";//사용자 계정
   	String dbPass="jsppass";//사용자 패스워드
	 
   	/*DriverManager에 등록 */
	Class.forName("com.mysql.cj.jdbc.Driver");  
   	
	/*Connection 객체의 url,id,pass를 얻어옴.*/
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	
	
	String sql= "select name, tell from memberTBL where name= ?";//membertbl의 테이블의 name과 tell의 열이름의 name=?조건을 찾음
	pstmt=conn.prepareStatement(sql);//Sql의 Statement 클래스의 기능 향상
	

   	pstmt.setString(1,name);//PrepareStatement 객제가 제공하는 setString 메소드 
	rs=pstmt.executeQuery();//객체의 값을 반환 select 구문을 수행할 떄 사용하는 함수
    
	if(rs.next()){ 
		/*PrepareStatement 객제가 제공하는 getString 메소드*/
  		String rName=rs.getString("name");
  		String rTell=rs.getString("tell");
  		
  		
  	//변수.equals("상수")는 변수가 null이 들어올 경우 예외를 발생시키게 되고 비정상적인 프로그램 종료
  	//변수name의 위에서 정의한 문자열 rName 과 변수tell의 위에서 정의한 문자열 rTell을 선언(&&:and)
		if(name.equals(rName) && tell.equals(rTell)){
			//sql문애서 membertbl테이블의 name= ?을 삭제
			sql= "delete from memberTBL where name= ? ";
    		pstmt=conn.prepareStatement(sql); /*sql이 실행할 쿼리문 */
    		pstmt.setString(1,name);//PrepareStatement 객제가 제공하는 setString 메소드 
    		pstmt.executeUpdate();//객체의 값을 반환 select 구문을 수행할 떄 사용하는 함수
%>
<html>
<head>
<title>레코드 삭제</title>

</head>
<body>
<!-- 회원 탈퇴를 알리는 문구를 넣습니다 -->
<p style="border: 50px solid #C4B9F5;width: 50%;height: 40%;margin: 10% auto;font-size: 40px;font-weight: bold;color: #919191; line-height: 10; text-align:center;">
	회원 탈퇴가 완료되었습니다.</p>
	
<%
		}
		else {//if(name.equals(rName) && tell.equals(rTell))문의 쿼리 문을 삭제하기 못하면 실행시킵니다
			//전화번호가 일치하지 않는 경우 재 입력을 요구
%>
				<table style="border: 50px solid #C4B9F5;width: 50%;height: 40%;margin: 10% auto;font-size: 40px;font-weight: bold;color: #919191;">
		<tr align="center" bgcolor="white">
	
			<td>전화번호를 다시 입력해주시길 바랍니다.</td>
		</tr>
	
	</table>
<%
		}
	}
	else {//if(name.equals(rName) && tell.equals(rTell))문의 쿼리 문을 삭제하기 못하면 실행시킵니다
		//전화번호가 일치하지 않는 경우 재 입력을 요구
%>
		<table style="border: 50px solid #C4B9F5;width: 50%;height: 40%;margin: 10% auto;font-size: 40px;font-weight: bold;color: #919191;">
		<tr align="center" bgcolor="white">
			<td>이름을 다시 입력해주시길 바랍니다.</td>
		</tr>
	
	</table>
<%
	}	 
}
catch(Exception e){e.printStackTrace();}//Exception e가 발생할 경우 작성하는 문구
finally{//try 문에서 더이상의 실행이 필요 없을 경우 마지막으로 입력하는 문구
	if(rs != null) 
		try{rs.close();}catch(SQLException sqle){}
 	if(pstmt != null) 
		try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null) 
		try{conn.close();}catch(SQLException sqle){}
}
%>
</body>
</html>