package com.rainyblog.security;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户登录
 *
 * @author chaokunyang
 * @create 2017/2/13
 */
@WebServlet(
        name = "loginServlet",
        urlPatterns = "/login"
)
public class LoginServlet extends HttpServlet {

    private static final Logger logger = LogManager.getLogger();

    private static final Map<String, String> userDatabase = new HashMap<>();

    static {
        userDatabase.put("rainy", "123456");
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(req.getParameter("logout") != null) {
            if(logger.isDebugEnabled()) {
                logger.debug("User {} logged out.", session.getAttribute("username"));
            }
            session.invalidate();
            resp.sendRedirect("/home");
            return;
        }else if(session.getAttribute("username") != null) {
            resp.sendRedirect("/admin");
            return;
        }

        req.setAttribute("loginFailed", false);
        req.getRequestDispatcher("/WEB-INF/jsp/view/login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("username") != null) {
            resp.sendRedirect("/admin");
            return;
        }

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if(username == null || password == null || !LoginServlet.userDatabase.containsKey(username) || !LoginServlet.userDatabase.get(username).equals(password)) {
            logger.warn("Login failed for user {}", username);
            req.setAttribute("loginFailed", true);
            req.getRequestDispatcher("/WEB-INF/jsp/view/login.jsp").forward(req,resp);
        }else {
            logger.info("User {} successfully logged in", username);
            session.setAttribute("username", username);
            req.changeSessionId();
            resp.sendRedirect("/admin");
        }
    }
}
