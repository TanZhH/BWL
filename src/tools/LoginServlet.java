package tools;

import Entities.Manager;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login.do"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String username = request.getParameter("username").toString();
        String password = request.getParameter("password").toString();
        String action = request.getParameter("action").toString();

        if (action.equals("userLog")) {
            UserDao userDao = new UserDao();
            User user = null;
            user = userDao.login(username, password);
            if (user != null) {
                request.getSession().setAttribute("user", user);
                response.getWriter().write("true");//此值jquery可以接收到
            }
        } else if (action.equals("manaLog")) {
            ManaDao manaDao = new ManaDao();
            String tb = "mana_info";
            Manager manager = null;
            manager = manaDao.manalogin(username,password);
            if (manager != null) {
                request.getSession().setAttribute("manager", manager);
                response.getWriter().write("true");//此值jquery可以接收到
            }
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
