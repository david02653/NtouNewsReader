package ntou.cs.controller;

import ntou.cs.model.News;
import ntou.cs.model.NewsRetrievalUsingAPI;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/reload")
public class ReloadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Reload ServletContext");
        String type = req.getParameter("current");
        System.out.println(type);
        ArrayList<News> sport;
        ArrayList<News> business;
        ArrayList<News> health;
        ArrayList<News> entertainment;


        sport = NewsRetrievalUsingAPI.getNews(1);
        business = NewsRetrievalUsingAPI.getNews(2);
        health = NewsRetrievalUsingAPI.getNews(3);
        entertainment = NewsRetrievalUsingAPI.getNews(4);

        getServletContext().setAttribute("sport", sport);
        getServletContext().setAttribute("business", business);
        getServletContext().setAttribute("health", health);
        getServletContext().setAttribute("entertainment", entertainment);
        
        if(type.contains("sport")){
            getServletContext().setAttribute("current", sport);
        }else if(type.contains("business")){
            getServletContext().setAttribute("current", business);
        }else if(type.contains("health")){
            getServletContext().setAttribute("current", health);
        }else if(type.contains("entertainment")){
            getServletContext().setAttribute("current", entertainment);
        }else{
            getServletContext().setAttribute("current", sport);
        }
    }
}
