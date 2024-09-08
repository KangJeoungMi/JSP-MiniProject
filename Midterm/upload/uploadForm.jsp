<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
    <%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 해당 출저 W3C -->
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>로고파일 업로드</title>
		<style>
			body,html {
				margin: 0 auto;
			}/* 기본적으로 윈도우에 지정되어 있는 여백을 없애준후 가로길이 설정 */

			#wrap {
				height: 100%;
			}
			/* 
				이미지 첨부 폼이 열릴떄 보이는 높이만 사용
			 */

			.title {
				height: 30%;
				width: 90%;
				margin: auto;
				text-align: center;
				border-bottom: 5px solid #C4B9F5;
			}
			/* 
			보이는 창의 가로를 90% 세로를 30% 사용합니다. px과 다르게 %를 사용하면 창의 크기에 따라 유동적으로 변합니다.
			amrgin:auto;로 상자를 중항정렬 한 후 글자도 중앙정렬 합니다.
			밑줄을 그어 입력 폼과 구분을 줍니다.(hr태그로 밑줄을 만들 수 있으나 해당 태그는 창의 끝까지 선이 그어져 사용하지 않았습니다.)
			  */

			h2 {
				margin: 0;
				padding: 20px 20px 0px 20px;
				height: 50%;
				font-size: 30px;
				color: rgb(87, 86, 86);

			}
			/* 제목의 바깥여백을 0으로 지정하여 여백을 없애고 안쪽 여백을 위 오 아래 외 순으로 지정했습니다. 글자크기30px  */

			p {
				margin: 0;
				color: dimgray;

			}
			/* 규격 안내문구 글자색을 회색으로 지정하여 바깥여백을 0으로 지정합니다. */

			form {
				width: 90%;
				height: 70%;
				margin: auto;
			}
			/* 폼 태그의 가로 90% 세로 70%로 지정하고 중앙정렬 합니다.  */

			table {
				width: 100%;
				height: 200px;
			}/*  */

			input[type="text"] {
				width: 200px;
				height: 30px;
				font-size: 15px;
				border: 0;
				border-radius: 5px;
				outline: none;
				padding-left: 10px;
				background-color: rgb(233, 233, 233);
			}/*텍스트상자 크기를 200X30 으로 지정하고 테두리 둥글게 안쪽 여백 10px을 지정합니다.
			글자 크기15px로 지정합니다.
			 */

			input[type="submit"] {
				border: 1px solid #C4B9F5;
				border-radius: 25px;
				font-weight: bold;
				font-size: 16PX;
				width: 120px;
				height: 40px;
				background-color: #fff;
				cursor: pointer;
			}/* 제출 버튼의 크기를 120X40으로 지정하고 배경은 흰색 1px의 보라색 실선에 모서리 둥글게만듭니다.
			글자크기 16px 글자 굵게 지정합니다.
			 */

			input[type="submit"]:hover{
			color: #fff;
        	background-color:#C4B9F5;
        	}/* 제출버튼에 마우스를 가져다 대면 배경색상 보라색 폰트 색상 흰색으로 바뀜 
        	:hover 속성은 마우스를 가져다 대면 스타일이 생기는 이벤트 입니다
        	*/
		</style>

</head>

<body>

 <div id="wrap">
			<div class="title"><!-- 제목과 파일 업로드 규격 설명 -->
				<h2>로고파일을 업로드 해주세요.</h2><!-- h1-h6 까지 제목지정 태그중에 두번쨰로 큰 제목 태그 사용 -->
				<p>200X200 크기의 .png파일로 업로드 해주세요.</p> <!-- 문단태그를 이용 -->
				<p>파일이름을 번호뒷자리로 저장합니다.</p>
			</div>
			
			<!-- 파일 임력 폼  -->

    <form action="uploadOk.jsp" method="post" enctype="multipart/form-data">
    <!-- action속성은 폼을 전송 할 서버 쪽 스크립트 파일 지정 method 폼 서버에 전송할 메소드 지정 -->
				<table cellpadding="0" cellspacing="1"><!-- 표만들기 -->
					<tbody>
						<tr><!-- 행 정렬 -->
							<td rowspan="1" colspan="1" style="padding-left: 30px;"><!-- 데이터 셀 지정, 열 정렬 -->
								회사명 | <input type="text" name="user"></td>
								<!-- type속성의 기본 값으로 한줄로 된 텍스트 필드를 정의함. name속성을 지정하여 jsp파일에 연동 될 수있게 지정한다 -->

						</tr>
						<tr><!-- 행 정렬 -->
							<td rowspan="1" colspan="1" style="padding-left: 30px;"><!-- 데이터 셀 지정, 열 정렬 -->
								담당자 |
								<input type="text" name="title ">
								<!-- type속성의 기본 값으로 한줄로 된 텍스트 필드를 정의함. name속성을 지정하여 jsp파일에 연동 될 수있게 지정한다 -->
							</td>

						</tr>
						<tr style="height: 24px;"><!-- 행 정렬 / 높이 24px지정-->
							<td colspan="1" class="filebox" style="padding-left: 30px; padding-top: 50px;">
							<!-- 데이터 셀 지정, 열 정렬 클래스 속성지정(CSS 스타일 속성에 .filebox로 스타일 지정함.) 안쪽 여백 왼쪽에 30px 위쪽에 50px 여백 지정합니다 -->
								<input type="file" name="file" id="file"><!-- type속성에서 파일 입력을 정의함. -->
								<input type="submit" value="file upload"><!-- type속성으로 제출 버튼을 생성함. -->
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>


    </form>

</body>

</html>