package ntou.cs.controller;

import ntou.cs.model.News;
import ntou.cs.model.NewsRetrievalUsingAPI;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.IOException;
import java.util.ArrayList;

public class StartUpListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        ArrayList<News> sport;
        ArrayList<News> business;
        ArrayList<News> health;
        ArrayList<News> entertainment;

        try{
            sport = NewsRetrievalUsingAPI.getNews(1);
            business = NewsRetrievalUsingAPI.getNews(2);
            health = NewsRetrievalUsingAPI.getNews(3);
            entertainment = NewsRetrievalUsingAPI.getNews(4);

            context.setAttribute("sport", sport);
            context.setAttribute("business", business);
            context.setAttribute("health", health);
            context.setAttribute("entertainment", entertainment);
        }catch (IOException e){
            e.printStackTrace();
            System.out.println("init news info read error");
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
