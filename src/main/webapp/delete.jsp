<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    //Query String에서 넘어온 데이터를 받는다.
    int id = Integer.parseInt(request.getParameter("id"));

    String sql = "delete from board where id=?";
    Connection conn = (Connection) request.getServletContext().getAttribute("conn");
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            int resultCnt = stmt.executeUpdate();
            response.sendRedirect("index.jsp"); //삭제 후 index.jsp페이지로 넘어갑니다.
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

