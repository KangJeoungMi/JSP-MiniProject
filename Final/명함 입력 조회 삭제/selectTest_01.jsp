<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입을 아래와 같이 지정하였습니다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>레코드 표시</title>
<!-- 생성된 표 스타일 생성 -->
<style>
body{margin : 0 auto;
    	width:100%;} /* 기본적으로 윈도우에 지정되어 있는 여백을 없애준후 가로길이 설정 */
        #wrap{
            width:90%;
            height:90%;
            margin : 40px auto;
            text-align:center;
            background-color:#ffffff;
        }/*wrap이라는 id객체를 지정한 상자 스타일 
        가로 세로 전체 윈도우 크기의 90%
        바깥쪽 여백 위아래 40px 지정 좌우 중앙정렬
        텍스트 중앙정렬 배경색 흰색
         */
           table{
            margin-left:auto; 
            margin-right:auto;
            width:70%;
        }/* 표 만들기(명함 등록 폼을 표로 생성)
        바깥쪽여백 좌우 auto로 중앙정렬 
        가로 세로 크기 = 800X500
        */
        
        tr,td{
        	border-bottom:4px solid #C4B9F5;
        	padding-left:10px
        }
        /*생성 한 표 내 행과 열 스타일
        아래 테두리만 4px 실선으로 지정 색상 지정
        안쪽 여백 10px
        */
</style>

</head>
<body bgcolor="#C4B9F5"><!-- 배경 색상 -->
<div id="wrap"><!-- 전체 상자를 wrap을 id선택자로 입력. -->
<h2 style="padding:40px;"><font size="9" color="gray">등 록 결 과</font></h2>	
<!-- h2태그를 이용하여 제목을 입력. 안쪽 여백을 40px을 주고 font태그로 글자 크기를 9 회색으로 지정. -->
	<table border="0" align="center">
	<!-- 표만들기 테두리를 0으로 지정  
	입력된 명함을 한번에 보기위한 표를 생성합니다-->
		<tr><!-- 행 정렬 -->
			<th width="200">이름</th>  
			<th width="300">부서</th>
			<th width="300">직책</th>
			<th width="500">이메일(E-mail)</th>
			<th width="500">전화번호</th>
			<th width="900">주소</th>
			<th width="900">상세주소</th>

		</tr>
	</div>
	
		<%
		Connection conn=null;;//connection은 데이터베이스와 연결하는 객체
  		PreparedStatement pstmt=null;// sql문 전송하는 객체인 PreparedStatement
  		ResultSet rs=null;

  		/*예외 처리 부분*/
  		try{
  			/*연동할 DB를 포함한 url*/
	 		String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp?serverTimezone=Asia/Seoul"; 

	 		String dbId="jspid";//사용자 계정
	 	   	String dbPass="jsppass";//사용자 패스워드
     			
     		/*DriverManager에 등록*/
	 		Class.forName("com.mysql.cj.jdbc.Driver");  
	 		/*Connection 객체의 url,id,pass를 얻어옴.*/
	 		conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 		
	 		//membertbl의 테이블의 전체 조건을 찾음
	 		String sql= "select * from memberTBL";
	 		//Sql의 Statement 클래스의 기능 향상
	 		pstmt=conn.prepareStatement(sql);
	 		//객체의 값을 반환 select 구문을 수행할 떄 사용하는 함수
	 		rs=pstmt.executeQuery();

		 	while(rs.next()){
		 		/*PrepareStatement 객제가 제공하는 getString 메소드*/
	       		String name= rs.getString("name");
	       		String department= rs.getString("department");
	       		String position= rs.getString("position");
	       		String email= rs.getString("email");
	       		String tell= rs.getString("tell");
	       		String member_addr= rs.getString("member_addr");
	       		String detail_addr= rs.getString("detail_addr");

%>
 <!-- request 내장객체의 getParameter() 메소드를 사용하여 읽어온 id 프로퍼티 값을 표현식을 사용하여 화면에 출력. -->	
		<tr>
			<td width="100"><%=name%></td>
			<td width="100"><%=department%></td>
			<td width="100"><%=position%></td>
			<td width="200"><%=email%></td>
			<td width="200"><%=tell%></td>
			<td width="200"><%=member_addr%></td>
			<td width="200"><%=detail_addr%></td>
		</tr>
<%
			} 
		}catch(Exception e){e.printStackTrace();}//Exception e가 발생할 경우 작성하는 문구
		finally{//try 문에서 더이상의 실행이 필요 없을 경우 마지막으로 입력하는 문구
			if(rs != null) 
	    		try{rs.close();}catch(SQLException sqle){}
	 		if(pstmt != null) 
				try{pstmt.close();}catch(SQLException sqle){}
	 		if(conn != null) 
				try{conn.close();}catch(SQLException sqle){}
		}
%>
	</table>
</body>
</html>