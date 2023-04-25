package com.playdata.login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String hashedPassword = LoginServlet.hashPassword(password);

        if (isAvailableUsername(request, username)) {
            //username이 사용중이지 않아서 가입이 가능한 경우
            int resultRowCount = registerUser(username, hashedPassword);
            if (resultRowCount == 1) {
                //가입 성공
                //로그인 처리
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                //메인페이지로 이동
                response.sendRedirect("/index.jsp");
            } else {
                // 가입 실패
                // 회원가입 페이지로 이동
                response.sendRedirect("/register.jsp");
            }
        }
    }

    private int registerUser(String username, String hashedPassword) {
        String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
        Connection conn = (Connection) getServletContext().getAttribute("conn");
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, hashedPassword);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
            return 0;
    }

    /**
     * 데이터베이스에 사용자 정보(username)가 이미 사용중인지 조회
     * @param request
     * @param username
     * @return 이미 사용중인 경우 false, 사용 가능한 경우 true
     */

    private boolean isAvailableUsername(HttpServletRequest request, String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        Connection conn = (Connection) request.getServletContext().getAttribute("conn");
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    //이미 username이 사용중인 경우
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }
}
