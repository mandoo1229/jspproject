<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <title>로그인</title>
    </head>
<body>
   <%@ include file="header.jsp"%>
    <div class="container">
    <h1>로그인</h1>
    <form action="login" method="post">
      <div class="mb-3">
        <label for="username" class="form-label">아이디</label>
        <input type="text" class="form-control" id="username" name="username" placeholder="아이디를 입력하세요." required>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">비밀번호</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요." required>
      </div>
      <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="exampleCheck1">
        <label class="form-check-label" for="exampleCheck1">Check me out</label>
      </div>
      <button type="submit" class="btn btn-primary">로그인</button>
    </form>

        <%
            if("1".equals(request.getParameter("error"))){
        %>
        <div class="alert alert-danger" role="alert">
          로그인에 실패했습니다. 아이디와 비밀번호를 다시 입력하세요.
        </div>
        <%
            }
        %>
    </div>
</body>


</html>