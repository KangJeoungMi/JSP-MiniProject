<%--JSP 페이지가 생성할 문서의 타입을 아래와 같이 지정하였습니다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--meta 태그: 브라우저에게 웹 페이지 관련 부가 정보를 제공하는 태그-->
<!-- 뷰포트 선언 -->
<!--content="width=device-width;= 화면 뷰 포트의 너비
	initial-scale=1.0;=초기 화면 확대비율
	minimum-scale=1.0;=화면 축소 최소비율
	maximum-scale=1.0;=화면 확대 최대 비율
	user-scalable=yes;"=사용자의 확대 혹은 축소 가능 여부  
	-->
<meta 
	charset="UTF-8"
	
	name="viewport"
	content="width=device-width;
	initial-scale=1.0;
	minimum-scale=1.0;
	maximum-scale=1.0;
	user-scalable=yes;"
	/>
	
	<!-- 모바일 입력 폼의 스타일을 지정합니다 -->
	
<style>


		table{
			
    		background: #fff;
            margin-left:auto; 
            margin-right:auto;
                     
        }/* 표 만들기(명함 등록 폼을 표로 생성)
        바깥쪽여백 좌우 auto로 중앙정렬 
        가로 세로 크기 = 800X500
        */
        
        tr,td{
        	border-bottom:4px solid #fff;
        	padding-left:10px
        }/*생성 한 표 내 행과 열 스타일
        아래 테두리만 4px 실선으로 지정 색상 지정
        안쪽 여백 10px
        */
        
       input{
        	height:35px;
        	font-size: 15px;
        	border: 0;
        	border-radius: 25px;
        	outline: none;
        	padding-left: 10px;
        	background-color: rgb(233, 233, 233);
        	margin-top: 10px;
        }/* input태그 스타일
        가로 세로 크기 300X400
        테두리 없음(0으로 지정)/모서리 둥글게(25px)
        안쪽여백 10px 배경 색지정
         */
        input:focus{
        	background-color: #E2DBFF;
        }/* input태그 상자를 클릭하는 경우(선택자뒤에 ':foucus'를 입력)
        배경색 지정
         */
         .sub{
         	margin:10px 60px;
        	color: #000;
        	border: 1px solid #C4B9F5;
        	border-radius: 25px;
        	font-weight: bold;
    		font-size: 12PX;
        	width:200px;
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
         
		
		
		@media only screen and (max-width: 320px) {
			* { background: #C4B9F5; color: white; }
		}
		
		/* 세로보기모드 */
		@media only screen and (min-width: 321px) and (orientation: portrait) {  
			* { background: #C4B9F5; color: black; }
		}
		
		/* 가로보기모드 */
		@media only screen and (min-width: 321px) and (orientation: landscape) { 
			* { background: #C4B9F5; color: black; }
		}
</style>

<title>외부 프로그램 링크</title>
</head>


<body>
<h2 style="text-align:center; padding:40px;"><font size="6" >모 바 일 등 록</font></h2>
	<form method="post" action="linkTestProc.jsp" >
	
	 <!-- 표만들기 테두리를 0으로 지정 cellpadding은 표의 여백을 2로 지정 -->
    <table border="0" cellspacing="0" cellpadding="2"  align="center">
      
    <!--이메일 입력-->
      <tr>  <!-- 행 정렬 --> 
        <td ><label for="email">EMAIL</label></td><!-- 데이터 셀 지정, 열 정렬-->
        <td> <!-- 데이터 셀 지정, 열 정렬/가로 행 합치기 --> 
		  <input id="email" name="email" type="email" size="20" placeholder="email@address.com" autofocus required><p>
		  </td>
      </tr>
	
	
	<!--전화번호 입력(전화)-->
	<tr>
		<td><label for="phone">PHONE</label></td>
		<td>
		   <input id="phone" name="phone" type="number" size="10" placeholder="010-1234-1234"><p>
		</td>
	</tr>
	
	<!--전화번호 입력(SMS)-->
	<tr>
		<td><label for="sms">SMS</label></td>
		<td>
		   <input id="sms" name="sms" type="number" size="10" placeholder="010-1234-1234"><p>
		</td>
	</tr>
	
	<!--주소 입력-->
	<tr>
		<td><label for="addr">ADDRESS</label></td>
		<td>
		   <input id="addr" name="addr" type="text" size="25" placeholder="주소를 입력해주세요."><p>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
		   <input type="submit" value="S U B M I T" class="sub"></input>	
		</td>
	</tr>
	
	</table>
		
		
	</form>
	
	
</body>

</html>