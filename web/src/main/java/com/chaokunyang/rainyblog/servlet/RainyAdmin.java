package com.chaokunyang.rainyblog.servlet;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Rainy Blog 管理
 *
 * @author chaokunyang
 * @create 2017/2/12
 */
@WebServlet(
        name = "rainyAdmin",
        urlPatterns = "/admin",
        loadOnStartup = 2
)
@MultipartConfig(
        fileSizeThreshold = 5_242_880, // 5MB
        maxFileSize = 20_971_520L, // 20MB
        maxRequestSize = 41_943_040L // 40MB
)
public class RainyAdmin extends HttpServlet {
    Logger logger = LogManager.getLogger();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/view/admin.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

