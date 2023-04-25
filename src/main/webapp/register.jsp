<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <title>회원가입</title>
    </head>
<body>
   <%@ include file="header.jsp"%>
    <div class="container">
    <h1>회원가입</h1>
        <form action="register" method="post">
            <label for="username">아이디</label>
            <input type="text" name="username" id="username" placeholder="아이디를 입력하세요." required> <br>
            //request에 있는 name과 동일해야 한다. (RegisterServlet 클래스에 있는 )
            <label for="password">비밀번호</label>
            <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요." required> <br>
            <button type="submit" class="btn btn-primary">회원가입</button>
            </label>
        </form>
    </div>
</body>
</html>