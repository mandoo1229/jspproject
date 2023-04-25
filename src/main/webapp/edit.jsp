<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>
   <%@ include file="header.jsp"%>
    <div class="container">
    <div>
        <h2>게시판</h2>
        <hr>
        <h3>글쓰기</h3>
        <%
            // Query String으로 넘어온 id 값을 가져온다.
            int id =Integer.parseInt(request.getParameter("id"));

            Connection conn = (Connection) request.getServletContext().getAttribute("conn");
            String sql = "SELECT * FROM board WHERE id = ?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)){
                 stmt.setInt(1, id);
                 try(ResultSet rs =stmt.executeQuery()){
                    if (rs.next()){
        %>

        <form method="post" action="update.jsp">
            <div class="input-group mb-3">
                <label class="form-label" for="title">제목</label>
                <input type="text" id="title" name="title" class="form-control" value="<%=rs.getString("title")%>"required>
            </div>
            <div class="input-group mb-3">
                <label class="form-label" for="author">작성자</label>
                <input class="form-control" type="text" id="author" name="author" value="<%=rs.getString("author")%>"required>
            </div>
            <div class="input-group mb-3">
                <label class="form-label" for="content">내용</label>
                <textarea class="form-control" id="content" name="content" rows="5" required><%=rs.getString("content")%></textarea>
            </div>
            <input type="hidden" name="id" value="<%=rs.getInt("id")%>">
            <button type="submit" class="btn btn-primary"> 수정</button>
        </form>
        <%
                    }  //if-end
                } //if-end
            } catch(SQLException e){
                e.printStackTrace();
            }
        %>
        <div>
        </div>
    </div>
</div>
</body>
</html>
