<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%

    String path = "C:\\fileSave";//웹 어플리케이션상의 절대 경로

    //String path = application.getRealPath("fileFolder"); 

    int size = 1024 * 1024 * 10;//최대 업로될 파일크기 10Mb

    String file = "";
    try{
    	  //전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
    	   //전송할 파일명을 가지고 있는 객체, 서버상의 절대경로,최대 업로드될 파일크기, 문자코드, 기본 보안 적용
        MultipartRequest multi = new MultipartRequest(request,path,size,"UTF-8",new DefaultFileRenamePolicy());

        
      //Form의 파라미터 목록을 가져온다
        Enumeration files = multi.getFileNames();
        String str = (String)files.nextElement();//전송되는 파라미터문자열


        

        file = multi.getFilesystemName(str);

    }catch(Exception e)

    {

        e.printStackTrace();

    }

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
<style>
body{margin: 0 auto;}
div{
background-color: white;
    width: 80%;
    height: 300px;
    font-size: 30px;
    margin: 110px auto;
    text-align: center;
    line-height: 300px;
}
</style>
<script>
alert('파일이 업로드 되었습니다');
</script>
</head>
</head>

<body style="background-color:#C4B9F5">
<div>창을 닫고 폼을 작성해주세요</div>
</body>

</html>