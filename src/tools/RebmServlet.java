package tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by CWZZ on 2016/12/20.
 */
@WebServlet(name = "RebmServlet",urlPatterns = {"/rebm.do"})
public class RebmServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String action = request.getParameter("action").toString();
        if (action.equals("delReb")) {
            this.delReb(request, response);
        }
        else if(action.equals("addReb")){
            this.addReb(request, response);
        }
        else if(action.equals("modReb")){
            this.modReb(request, response);
        }

    }

    protected void modReb(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rebID = Integer.parseInt(request.getParameter("rebID").toString());
        String textarea = request.getParameter("textarea").toString();
        RebDao rebDao = new RebDao();
        if(rebDao.modReb(rebID,textarea)){
            response.getWriter().write("true");

        }
    }
        protected void addReb(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID").toString());
        String textarea = request.getParameter("textarea").toString();
        RebDao rebDao = new RebDao();
        if(rebDao.addReb(userID,textarea)){
            response.getWriter().write("true");
        }
    }
        protected void delReb(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rebID = Integer.parseInt(request.getParameter("select").toString());
        RebDao rebDao = new RebDao();
        if(rebDao.delReb(rebID)){
            response.getWriter().write("true");
        }

    }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
