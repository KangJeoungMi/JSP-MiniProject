 <%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입을 아래와 같이 지정하였습니다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>레코드 삭제</title>

<!-- style 태그를 적용하여 배경 전체 이미지, 테이블과 h2 태그에 디자인을 적용하였습니다. -->
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
            width:50%;
            height:30%;            
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
        
       input{
        	width: 300px;
        	height: 40px;
        	font-size: 15px;
        	border: 0;
        	border-radius: 25px;
        	outline: none;
        	padding-left: 10px;
        	background-color: rgb(233, 233, 233);
        }/* input태그 스타일
        가로 세로 크기 300X400
        테두리 없음(0으로 지정)/모서리 둥글게(25px)
        안쪽여백 10px 배경 색지정
         */
        input:focus{
        	background-color: #E2DBFF;
        }
        /* input태그 상자를 클릭하는 경우(선택자뒤에 ':foucus'를 입력)
        배경색 지정
         */
          .sub{
        	color: #000;
        	border: 1px solid #C4B9F5;
        	border-radius: 25px;
        	font-weight: bold;
    		font-size: 16PX;
        	width:150px;
        	height:50px;
        	background-color:#fff;
        	cursor:pointer;
         }/* sub라는 class객체를 지정한 스타일(명함 입력,수정,조회 버튼)
         가로 세로 길이 150X50 배경색상 흰색
         글자크기 16px 굵게
         테두리 둥글게(25px)
         버튼에 커서를 가져다 대면 포인터로 바꿈
         */
            
        .sub:hover{
       		color: #fff;
        	background-color:#C4B9F5;
        
      	}/* .sub에 :hover를 같이 입력하면 마우스 커서를 올리면 배경색상과 폰트 색상을 변경함 */
         
</style>
</head>
<!-- 전체 배경색 지정 -->
<body bgcolor="#C4B9F5">
<div id="wrap">
<h2 style="padding:40px;"><font size="9" color="gray">회 원 탈 퇴</font></h2>	

	<!-- post 방식의 form 구문을 사용하여 submit 버튼을 클릭하면 action 속성에 지정된 웹 서버에 연결하도록 하였습니다.-->
	<form method="post" action="deleteTestPro_1.jsp">
		<table border="0" align="center">

		<tr>  <!-- 행 정렬 --> 
        <td width="100">이름</td><!-- 데이터 셀 지정, 열 정렬-->
        <td> <!-- 데이터 셀 지정, 열 정렬/가로 행 합치기 --> 
		  <input type="text" name="name" placeholder="이름을 입력해주세요" required> </td>
		  <!-- type속성의 기본 값으로 한줄로 된 텍스트 필드를 정의함. name속성에 name 지정
		  placeholder속성으로 필드에 입력할 텍스트의 힌트를 입력 할 수 있음 
		  이름과 전화번호는 required 속성을 두어 필수로 입력하도록 하였습니다.
		  -->
      </tr>
      
      <tr>  
         <td>전화번호</td>
         <td> 
		   <input type="text" name="tell" placeholder="010-0000-1111" required> </td>
		  <!-- type속성의 기본 값으로 한줄로 된 텍스트 필드를 정의함. name속성에 tell 지정
		  placeholder속성으로 필드에 입력할 텍스트의 힌트를 입력 할 수 있음 
		  이름과 전화번호는 required 속성을 두어 필수로 입력하도록 하였습니다.-->
      </tr>
      
		
			<tr>
				<td colspan="3" align="center">
				<input type="submit" value="입 력 완 료" class="sub">
				&nbsp; &nbsp; &nbsp; &nbsp; 
				<input type="reset" value="다 시 작 성" class="sub">
				&nbsp; &nbsp; &nbsp; &nbsp; 
				<!-- type속성의 button으로 지정. 조회를 위해 a태그를 이용하여 selectTest_01.jsp를 지정합니다.  class 선택자를 sub로 지정하여 스타일 지정. -->   
           <a href="selectTest_01.jsp">
           <input type="button" value="명 함 조 회" class="sub"></a>
				</td>
			</tr>
		</table>
	</form>

</div>

	
</body>
</html>