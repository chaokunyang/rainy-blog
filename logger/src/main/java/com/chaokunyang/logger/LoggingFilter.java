package com.chaokunyang.logger;

import org.apache.logging.log4j.ThreadContext;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;

/**
 * 日志过滤器
 *
 * @author chaokunyang
 * @create 2017/2/12
 */
public class LoggingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        boolean clear = false;
        if(!ThreadContext.containsKey("id")) {
            clear = true;
            ThreadContext.put("id", UUID.randomUUID().toString());
            HttpSession session = ((HttpServletRequest)request).getSession(false);
            if(session != null) {
                ThreadContext.put("username", (String)session.getAttribute("username"));
            }
        }

        try {
            chain.doFilter(request,response);
        } finally {
            if(clear)
                ThreadContext.clearAll();
        }
    }

    @Override
    public void destroy() {

    }
}
