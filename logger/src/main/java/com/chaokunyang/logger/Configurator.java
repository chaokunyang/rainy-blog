package com.chaokunyang.logger;

import javax.servlet.*;
import javax.servlet.annotation.WebListener;
import java.util.EnumSet;

/**
 * 过滤器注册
 *
 * @author chaokunyang
 * @create 2017/2/12
 */
/*@WebListener*/ // 使用注解无法定义同类型监听器执行顺序
public class Configurator implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        FilterRegistration.Dynamic registration = context.addFilter("loggingFilter", new LoggingFilter());
        registration.setAsyncSupported(false); // 该日志过滤器无法处理异步请求
        registration.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST, DispatcherType.INCLUDE, DispatcherType.ERROR, DispatcherType.FORWARD),false, "/*");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
