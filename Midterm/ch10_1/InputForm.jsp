<%@ page contentType="text/html; charset=utf-8" %>
<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입--%>
<%@include file="color.jsp" %>
<%--조각코드의 삽입을 위해 include 디렉티브 사용. --%>

<html>
<head>
<title>명함 등록</title>
<!-- HTML 페이지에 외부 스타일시트를 적용. -->
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<!-- HTML 페이지에 외부 자바스크립트를 추가 -->
</head>

<body bgcolor="<%=bodyback_c%>">

  <div id="wrap"><!-- 전체 상자를 wrap을 id선택자로 입력. -->
  <h2 style="padding:40px;"><font size="9" color="gray">명 함 등 록</font></h2>
  <!-- h2태그를 이용하여 제목을 입력. 안쪽 여백을 40px을 주고 font태그로 글자 크기를 9 회색으로 지정. -->
  
  
  <!-- post 방식의 form 구문을 사용하여 submit 버튼을 클릭하면 action 속성에 지정된 웹 서버에 연결.
		onsubmit 속성은 form 전송을 하기 전에 입력된 데이터의 유효성을 체크하기 위해 사용하는 이벤트. -->
  <form name="regForm" method="post" action="InputPro.jsp" onsubmit="return inputCheck()">
  <!-- form name="regForm" method="post" action="InputProc.jsp.jsp" onsubmit="return inputCheck()" -->

  <!-- 표만들기 테두리를 0으로 지정 cellpadding은 표의 여백을 2로 지정 -->
    <table border="0" cellspacing="0" cellpadding="2"  align="center">
      
     <tr> <!-- 행 정렬 --> 
        <td>로고</td><!-- 데이터 셀 지정, 열 정렬-->
        <td colspan="3"><!-- 데이터 셀 지정, 열 정렬/가로 행 합치기 --> 
		  <a href="../upload/uploadForm.jsp" target="_blank" onClick="window.open(this.href, '', 'width=630px, height=540px'); return false;">
		  <!-- a 링크 태그 이미지 파일 첨부 폼을 '../upload/uploadForm.jsp'으로 입력 target속성에 _blank로 새탭에서 열리게 함.
		  링크를 클릭할 경우 윈도우 창의 크기를 630X540 으로 열리게 지정 -->
           <span style="color:#978686;" >PNG파일로 첨부해주세요</span></a><!-- span태그에 설명 하고 글자 색상 지정 -->            
         </td>
      </tr>
      <tr>  <!-- 행 정렬 --> 
        <td >이름</td><!-- 데이터 셀 지정, 열 정렬-->
        <td colspan="3"> <!-- 데이터 셀 지정, 열 정렬/가로 행 합치기 --> 
		  <input type="text" name="name" placeholder="이름을 입력해주세요"> </td>
		  <!-- type속성의 기본 값으로 한줄로 된 텍스트 필드를 정의함. name속성에 name 지정(jsp파일에 연동)
		  placeholder속성으로 필드에 입력할 텍스트의 힌트를 입력 할 수 있음 -->
      </tr>
      <tr>  
        <td >회사명</td>
        <td> 
		  <input type="text" name="company"  placeholder="회사명을 입력해주세요"> </td>
		  <!-- type속성의 기본 값으로 한줄로 된 텍스트 필드를 정의함. name속성에 name 지정(jsp파일에 연동)
		  placeholder속성으로 필드에 입력할 텍스트의 힌트를 입력 할 수 있음-->
		  <td>직책</td>
        <td> 
		  <input type="text" name="position"placeholder="직책을 입력해주세요" > </td>
		  <!-- type속성의 기본 값으로 한줄로 된 텍스트 필드를 정의함. name속성에 position 지정(jsp파일에 연동)
		  placeholder속성으로 필드에 입력할 텍스트의 힌트를 입력 할 수 있음-->
      </tr>
      <tr> 
         <td>이메일</td>
         <td colspan="3"> 
		   <input type="text" name="email" placeholder="email@email.com"> </td>
		   <!-- type속성의 기본 값으로 한줄로 된 텍스트 필드를 정의함. name속성에 email 지정(jsp파일에 연동)
		  placeholder속성으로 필드에 입력할 텍스트의 힌트를 입력 할 수 있음-->
      </tr>
      <tr>  
         <td>전화번호</td>
         <td colspan="3"> 
		   <input type="text" name="tel" placeholder="010-1234-1234"> </td>
		   <!-- type속성의 기본 값으로 한줄로 된 텍스트 필드를 정의함. name속성에 tel 지정(jsp파일에 연동)
		  placeholder속성으로 필드에 입력할 텍스트의 힌트를 입력 할 수 있음-->
      </tr>
      <tr>  
         <td>우편번호</td>
         <td colspan="3"> 
		   <input type="text" name="member_post" id="member_post"  placeholder="우편번호 검색" readonly onclick="findAddr()" >
		   <!-- type속성의 기본 값으로 한줄로 된 텍스트 필드를 정의함. name속성에 member_post 지정(jsp파일에 연동)
		  placeholder속성으로 필드에 입력할 텍스트의 힌트를 입력 할 수 있음 id선택자를 member_post를 입력하여 스타일 시트와 자바 스크립트를 입력
		  readonly onclick="findAddr()으로 스크립트를 지정하여 우편번호 검색한느 API를 지정.-->
		   <button type="button" onclick="findAddr()" id="btn" >검색</button></td>
		   <!-- 검색 버튼 생성 해당 버튼을 클릭하면 우편번호 찾는 API를 새탭으로 열어줌.-->
      </tr>
      <tr>  
         <td>주소</td>
         <td colspan="3"> 
		   <input type="text" name="member_addr" id="member_addr" readonly > </td>
		   <!-- type속성의 기본 값으로 한줄로 된 텍스트 필드를 정의함. name속성에 member_addr 지정(jsp파일에 연동)
		  placeholder속성으로 필드에 입력할 텍스트의 힌트를 입력 할 수 있음 id선택자를 btn를 입력
		  찾은 우편번호를 지정하여 주소를 자동으로 입력-->
      </tr>
      <tr>  
         <td>상세주소</td>
         <td colspan="3"> 
		   <input type="text" name="detail_addr" placeholder="상세주소를 입력해주세요"> </td>
		   <!-- type속성의 기본 값으로 한줄로 된 텍스트 필드를 정의함. name속성에 detail_addr 지정(jsp파일에 연동)
		  placeholder속성으로 필드에 입력할 텍스트의 힌트를 입력 할 수 있음 상세주소를 입력함. -->
      </tr>
     <tr> 
         <td colspan="4" align="center"> 
          <input type="submit" value="명 함 입 력" class="sub" > 
              &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
           <input type="submit" value="명 함 수 정" class="sub">
           &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
           <input type="reset" value="명 함 조 회" class="sub">
           <!-- type속성의 submit 제출버튼을 입력. class 선택자를 sub로 지정하여 스타일 지정. -->
         </td>
       </tr>
  </table>
  </form>
  </div>
</body>

<script>/* 우편번호 검색 API */
function findAddr(){
	new daum.Postcode({//다음 우편 코드 생성자
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}


</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 다음 우편번호 API 링크  -->
<!-- 팝업을 이용하여 도로명 주소와 지번 주소를 모두 보여줌. 기본적인 팝업을 ㅣㅇ용 사용자가 선택한 주소의 도로명 주소와 지번 주소를 보여줌 -->
</html>
