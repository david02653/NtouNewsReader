package ntou.cs.controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class StartUpListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // TODO: read in all page info
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
