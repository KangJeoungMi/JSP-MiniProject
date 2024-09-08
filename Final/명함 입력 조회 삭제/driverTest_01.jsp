<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<h2>JDBC드라이버 테스트</h2>

<%
  Connection conn=null;//connnection 객체 생성 데이터 베이스에 연결

  try{
	 //String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
	 String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp?serverTimezone=Asia/Seoul"; 
     String dbId="jspid";//계정 아이디
     String dbPass="jsppass";//계정 패스워드
	
	 //Class.forName("com.mysql.jdbc.Driver");
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 //jdbc 드라이버 로딩을 위해 class.forname()을 사용
	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 //드라이버와 url,id,pw(pass)를 연결
	 out.println("제대로 연결되었습니다.");//정상적으로 연결되면 연결 문구가 작성
  }catch(Exception e){ //Exception e가 발생할 경우 작성하는 문구
	 out.println("Error Msg Type1 : " + e.getMessage() + "<br>");
	 out.println("Error Msg Type2: " + e.toString() + "<br>");
	 out.println("Error Msg Type3: "); e.printStackTrace();
  }
%>