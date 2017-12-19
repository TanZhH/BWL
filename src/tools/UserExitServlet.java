package tools;


import Entities.Manager;
import Entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by CWZZ on 2016/11/26.
 */
@WebServlet(name = "UserExitServlet", urlPatterns = {"/exit.do"})
public class UserExitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Manager manager = (Manager)session.getAttribute("manager");
        if(manager != null){
            session.removeAttribute("manager");
        }
        request.getRequestDispatcher("/manaLogin.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            session.removeAttribute("user");
        }
        request.setAttribute("info", user.getUsername() + "已经成功退出！");
        request.getRequestDispatcher("/message.jsp").forward(request,response);

    }
}
