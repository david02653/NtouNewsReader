package ntou.cs.controller;

import ntou.cs.model.News;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/news")
public class TypeSelectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // load in sport type of news
        ArrayList<News> list = (ArrayList<News>) getServletContext().getAttribute("sport");
        req.setAttribute("current", list);
        req.setAttribute("sub", "SPORT");

        System.out.println("add sport news into request attribute");
        for(News n : list){
            System.out.println(n);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("NewsDisplayFormat.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
        ArrayList<News> list = null;
        String type = req.getParameter("type");

        switch (type){
            case "sport":
                list = (ArrayList<News>) getServletContext().getAttribute("sport");
                req.setAttribute("sub", "SPORT");
                break;
            case "business":
                list = (ArrayList<News>) getServletContext().getAttribute("business");
                req.setAttribute("sub", "BUSINESS");
                break;
            case "health":
                list = (ArrayList<News>) getServletContext().getAttribute("health");
                req.setAttribute("sub", "HEALTH");
                break;
            case "entertainment":
                list = (ArrayList<News>) getServletContext().getAttribute("entertainment");
                req.setAttribute("sub", "ENTERTAINMENT");
                break;
            default:
                System.out.println("nothing match");
        }
        req.setAttribute("current", list);

        RequestDispatcher dispatcher = req.getRequestDispatcher("NewsDisplayFormat.jsp");
        dispatcher.forward(req, resp);
    }
}
