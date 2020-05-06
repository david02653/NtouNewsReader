package ntou.cs.controller;

import ntou.cs.model.News;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/news")
public class TypeSelectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // load in sport type of news
        ArrayList<News> list = (ArrayList<News>) getServletContext().getAttribute("sport");
        req.setAttribute("current", list);

        RequestDispatcher dispatcher = req.getRequestDispatcher("NewsDisplayFormat.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
        // TODO : return selected type of news info
    }
}
