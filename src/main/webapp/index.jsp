<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%!
    private String name="John";
    public String getName() {
        return name;
    }
%>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Document</title>
</head><html lang="ko">

<body>
   <%@ include file="header.jsp"%>
    <div class="container">
    <div>
        <h2>게시판</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
            <%
                Connection conn = (Connection) request.getServletContext().getAttribute("conn");
                try (Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery("SELECT * FROM board ORDER BY id DESC")) {
                    while(rs.next()) {
            %>
                <tr>
                    <td><%=rs.getInt("id")%></td>
                    <td>
                        <a href="view.jsp?id=<%=rs.getInt("id")%>">
                            <%= rs.getString("title")%>
                        </a>
                    </td>
                    <td><%= rs.getString("author")%></td>
                    <td><%= rs.getString("crated_at")%></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        <%
            if(session.getAttribute("username") != null){
        %>

        <div>
            <a class="btn btn-primary" href="write.jsp" role="button">글쓰기</a>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>