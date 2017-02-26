package com.rainyblog.security;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * 注册认证过滤器
 *
 * @author chaokunyang
 * @create 2017/2/12
 */
/*@WebListener*/
public class AuthConfigurator implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        FilterRegistration.Dynamic registration = context.addFilter("authenticationFilter", new AuthenticationFilter());
        registration.setAsyncSupported(true);
        registration.addMappingForUrlPatterns(null, false, "/admin/*");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
