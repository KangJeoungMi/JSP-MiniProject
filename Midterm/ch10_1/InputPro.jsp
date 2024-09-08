<%@ page contentType="text/html; charset=utf-8" %>
<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입--%>
<%@include file="color.jsp" %>

<% 
  request.setCharacterEncoding("utf-8");
%>
<%-- 웹 브라우저에서 서버로 넘어오는 파라미터 값에 한글이 있는 경우, 한글 깨짐을 방지.--%>

<%--자바빈 객체를 생성 <jsp:useBean> 액션태그를 사용. --%>
<%-- id 속성에 생성될 자바빈 객체(인스턴스)의 이름을 regBean지정하고 class 속성은 객체가 생성될 자바빈 클래스명입니다. --%>
<jsp:useBean id="regBean" class="ch10.register.RegisterBean" />
<jsp:setProperty name="regBean" property="*" />

<html>
<head>
<title>명함 확인</title><!-- 등록된 명함 확인 -->
<!-- HTML 페이지에 내부 스타일시트를 적용. -->
 <style>
 /* InputPro 명함 등록 폼 스타일 시트 */
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
<!-- HTML 페이지에 외부 자바스크립트를 추가 -->
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="<%=bodyback_c%>">
<div>
    <div id="idcard2"><!-- 명함의 로고만 있는 부분을 보여줍니다. id선택자를 idcard를 지정항쳐 스타일을 지정함  -->
    	<img src="<%-- <%= request.getContextPath() + img %> --%>" style="width: 300px;margin-top: 50px;">
    	<!-- DB에 저장된 이미지 파일을 불러옴  -->
    </div>
    <table  border="0" cellspacing="0" cellpadding="2"> <!-- 표 생성하기 -->
        <tr style="height: 20px;"><!-- 행 정렬 --> 
      <td rowspan="4" colspan="1" style="width: 50%; vertical-align: bottom; "><!-- 데이터 셀 지정, 열 정렬 세로열(rowspan) 4개 합치기-->
      <img src="<%-- <%= request.getContextPath() + img %> --%>"  style="margin:auto; width:200px; padding-left:40px"/>
      <!-- DB에 저장된 이미지 파일을 불러옴  -->
      </td>
      <td rowspan="1" colspan="1" style="padding-top:40px"><!-- 데이터 셀 지정, 열 정렬-->
      <h1 style="margin:0px; font-size:50px"><!-- 제목지정 -->
      <!-- jsp:getProperty 액션 태그를 사용하여 InputBean 객체의 name 프로퍼티 값을 읽어옵니다. --> 
      <jsp:getProperty name="regBean" property="name" />
      </h1></td>
      </tr>
      <tr style="height: 20px;"><!-- 행 정렬 --> 
      <td rowspan="1" colspan="1"><!-- 데이터 셀 지정, 열 정렬-->
      <!-- jsp:getProperty 액션 태그를 사용하여 InputBean 객체의 position 프로퍼티 값을 읽어옵니다. -->       
      <jsp:getProperty name="regBean" property="position" /> </td>
      </tr>
      <tr style="height: 20px;"><!-- 행 정렬 빈칸 생성--> 
      <td rowspan="1" colspan="1"><br></td>
    </tr>
    <tr style="height: 20px;">
      <td rowspan="1" colspan="1">TEL | &nbsp;&nbsp;<!-- 데이터 셀 지정, 열 정렬 &nbsp로 빈칸을 두개 생성-->
      <!-- jsp:getProperty 액션 태그를 사용하여 InputBean 객체의 tel 프로퍼티 값을 읽어옵니다. -->  
      <jsp:getProperty name="regBean" property="tel" /> </td>
      </tr>
     
    <tr style="height: 20px;"><!-- 행 정렬 --> 
      <td rowspan="3" colspan="1"  style="text-align: center; letter-spacing:10px; vertical-align: top; width: 50%;">
      <!-- 데이터 셀 지정, 열 정렬 세로 열 3칸 합치기
      스타일 글자 중앙정렬 위에서 10px만큼 띄우기-->
      <!-- jsp:getProperty 액션 태그를 사용하여 InputBean 객체의 company 프로퍼티 값을 읽어옵니다. -->
      <jsp:getProperty name="regBean" property="company" /> </td>
      
      <td rowspan="1" colspan="1">MAIL |&nbsp;&nbsp;<!-- 데이터 셀 지정, 열 정렬 &nbsp로 빈칸을 두개 생성-->
      <!-- jsp:getProperty 액션 태그를 사용하여 InputBean 객체의 email 프로퍼티 값을 읽어옵니다. -->
      <jsp:getProperty name="regBean" property="email" /> </td>
      </tr>
      <tr style="height: 20px;"><!-- 행 정렬 --> 
      <td rowspan="1" colspan="1"><!-- 데이터 셀 지정, 열 정렬-->
      <!-- jsp:getProperty 액션 태그를 사용하여 InputBean 객체의 member_post 프로퍼티 값을 읽어옵니다. -->
      <jsp:getProperty name="regBean" property="member_post" />
      <!-- jsp:getProperty 액션 태그를 사용하여 InputBean 객체의 member_addr 프로퍼티 값을 읽어옵니다. -->
      <jsp:getProperty name="regBean" property="member_addr" /> </td>
      </tr>
      
      <tr style="height: 20px;">
      <td rowspan="1" colspan="1"><!-- 데이터 셀 지정, 열 정렬-->
      <!-- jsp:getProperty 액션 태그를 사용하여 InputBean 객체의 detail_addr 프로퍼티 값을 읽어옵니다. -->
      <jsp:getProperty name="regBean" property="detail_addr" /> </td>
      </tr>
  </table>
  </div>
</body>
</html>
