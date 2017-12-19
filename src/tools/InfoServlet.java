package tools;

import Entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by CWZZ on 2016/12/22.
 */
@WebServlet(name = "InfoServlet",urlPatterns = {"/info.do"})
public class InfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String action = request.getParameter("action").toString();
        if (action.equals("rePwd")) {
            this.rePwd(request, response);
        }
        else if(action.equals("reSex")){
            this.reSex(request, response);
        }
    }

    protected void rePwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID").toString());
        String repassword = request.getParameter("repassword").toString();
        UserDao userDao = new UserDao();
        if(userDao.rePwd(userID,repassword)){
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("user");
            user.setPassword(repassword);
            response.getWriter().write("true");
        }

    }
    protected void reSex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID").toString());
        String resex = request.getParameter("resex").toString();
        UserDao userDao = new UserDao();
        if(userDao.reSex(userID,resex)){
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("user");
            user.setSex(resex);
            response.getWriter().write("true");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
