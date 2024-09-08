<%@ page contentType="text/html; charset=utf-8" %>
<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입--%>
<%@include file="color.jsp" %>

<%-- 웹 브라우저에서 서버로 넘어오는 파라미터 값에 한글이 있는 경우, 한글 깨짐을 방지.--%>
<% 
  request.setCharacterEncoding("utf-8");
%>
<%-- request 내장객체의 getParameter() 메소드를 사용하여 자바빈 객체의 프로퍼티 값을 읽기. --%>
 <% 
String company = request.getParameter("company");
String logo = request.getParameter("logo");
String position = request.getParameter("position");
String name = request.getParameter("name");
String mail1 = request.getParameter("mail1");
String phone = request.getParameter("phone");
String member_addr = request.getParameter("member_addr");
String detail_addr = request.getParameter("detail_addr");
String member_post = request.getParameter("member_post");
%> 
<html>
<head>
<title>명함 확인</title><!-- 등록된 명함 확인 -->
<!-- HTML 페이지에 외부 자바스크립트를 추가 -->
<script language="JavaScript" src="script.js"></script>
<style>/* HTML 페이지에 내부 스타일시트를 적용. */
 /* InputProc 명함 등록 폼 스타일 시트 */
body{margin:0 auto; width:100%;}/* 초기 지정되어 있는 여백을 없애고 보이는 윈도우를 다 사용함 */
	div{
		width:90%;
        height:90%;
        margin : 40px auto;
        text-align:center;
        background-color:#ffffff;
        }/* 가로 세로를 윈도우의 90%만 사용 바깥쪽 여백을 위아래 40px정도 띄우고 auto를 사용해서 중앙정렬 함 */
        
	table,#idcard2{
	 width:600px;
	 height:400px;
	 background-color: white;
	 margin-top:220px;
	 border-radius: 5px;
	 box-shadow: 2px 3px 5px 5px rgb(0,0,0, 0.09);
	 margin-right: 150px;
	 float:right;
	}/*명함 600X400 바깥쪽 여백 220px 테두리 모서리 둥글게 상자 그림자넣기 */
	
	tr,td{padding:0; margin:0; height:40px}
	
	.logoimg{
		width:500px;
		border: 1px solid saddlebrown;
	}
 </style>
</head>

<body bgcolor="<%=bodyback_c%>">
    <div>
    <div id="idcard2">
    	<img src="email.png" style="width: 300px;margin-top: 50px;">
    </div>
<table cellpadding="0" cellspacing="1">
  <tbody>
    <tr style="height: 20px;">
      <td rowspan="4" colspan="1" style="width: 50%; vertical-align: bottom; ">
      <img src="email.png" style="margin:auto; width:200px; padding-left:40px">
      </td>
      <td rowspan="1" colspan="1" style="padding-top:40px">
      <h1 style="margin:0px; font-size:50px"><%= name %></h1></td>
       <!-- request 내장객체의 getParameter() 메소드를 사용하여 읽어온 id 프로퍼티 값을 표현식을 사용하여 화면에 출력. -->
    </tr>
    <tr style="height: 20px;">
      <td rowspan="1" colspan="1">
        <%= position %></td>
         <!-- request 내장객체의 getParameter() 메소드를 사용하여 읽어온 id 프로퍼티 값을 표현식을 사용하여 화면에 출력. -->
    </tr>
    <tr style="height: 20px;">
      <td rowspan="1" colspan="1"><br></td>
    </tr>
    <tr style="height: 20px;">
      <td rowspan="1" colspan="1">TEL | &nbsp;&nbsp;<%= phone %></td>
       <!-- request 내장객체의 getParameter() 메소드를 사용하여 읽어온 id 프로퍼티 값을 표현식을 사용하여 화면에 출력. -->
    </tr>

    <tr style="height: 20px;">
      <td rowspan="3" colspan="1"  style="text-align: center; letter-spacing:10px; vertical-align: top; width: 50%;">
      <%= company %></td>
       <!-- request 내장객체의 getParameter() 메소드를 사용하여 읽어온 id 프로퍼티 값을 표현식을 사용하여 화면에 출력. -->
      <td rowspan="1" colspan="1">MAIL |&nbsp;&nbsp;<%= mail1 %></td>
    </tr>
    <tr style="height: 20px;">
      <td rowspan="1" colspan="1"><%= member_post %><%= member_addr %></td>
       <!-- request 내장객체의 getParameter() 메소드를 사용하여 읽어온 id 프로퍼티 값을 표현식을 사용하여 화면에 출력. -->
    </tr>
    <tr style="height: 20px;">
      <td rowspan="1" colspan="1"><%= detail_addr %></td>
       <!-- request 내장객체의 getParameter() 메소드를 사용하여 읽어온 id 프로퍼티 값을 표현식을 사용하여 화면에 출력. -->
    </tr>
  </tbody>
</table>
  </div>
    
</body>
</html>
