package tools;

import Entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by CWZZ on 2016/11/25.
 */
@WebServlet(name = "RegServlet", urlPatterns = {"/reg.do"})
public class RegServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String action = request.getParameter("action").toString();
        if (action.equals("checkUser")) {
            this.checkUser(request, response);
        }
        if (action.equals("sendInfo")) {
            this.sendInfo(request, response);
        }
    }

    protected void sendInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").toString();
        String password = request.getParameter("password").toString();
        String sex = request.getParameter("sex").toString();
        String email = request.getParameter("email").toString();
        UserDao userDao = new UserDao();
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setSex(sex);
        user.setEmail(email);
        userDao.saveUser(user);
        response.getWriter().write("true");//此值jquery可以接收到
    }

    protected void checkUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        boolean flag = false;
        String username = request.getParameter("username").toString();
        flag = userDao.userIsExist(username);
        if (flag) {
            response.getWriter().write("true");//此值jquery可以接收到
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
