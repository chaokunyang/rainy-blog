package com.chaokunyang.rainyblog.servlet;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * RainyBlogServlet
 *
 * @author chaokunyang
 * @create 2017/2/12
 */
@WebServlet(
        name = "homeServlet",
        urlPatterns = "/home",
        loadOnStartup = 1
)
public class RainyBlogServlet extends HttpServlet {
    Logger logger = LogManager.getLogger();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logger.debug("接收到首页请求");
        req.getRequestDispatcher("/WEB-INF/jsp/view/home.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
