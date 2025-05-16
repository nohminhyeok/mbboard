package com.example.mbboard.listener;

import org.springframework.stereotype.Component;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

@Component //WebListener
public class ContextBootlistener implements ServletContextListener {
    public ContextBootlistener() {
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	// 웹브라우저 안에 저장 공간 : cookie, api
    	// 외부저장공간 : DB
    	// WAS(Tomcat) 안에 저장 공간 : application, session, request
    	// application.setAttribute() getAttribute()
    	// session.setAttribute() getAttribute 인증정보
    	// request.setAttribute() getAttribute 포워딩
    	ServletContext sc = sce.getServletContext(); // sce이벤트가 발생한 객체 -> Tomcat
    	sc.setAttribute("currentConnectCount", 0); // JSP : application.setAttribute()
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
    }
	
}
