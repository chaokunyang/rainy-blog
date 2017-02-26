package com.chaokunyang.monitor;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionIdListener;
import javax.servlet.http.HttpSessionListener;

/**
 * 会话监听器，监听session的变化
 *
 * @author chaokunyang
 * @create 2017/2/12
 */
@WebListener
public class SessionListener implements HttpSessionListener, HttpSessionIdListener {

    private static final Logger logger = LogManager.getLogger();

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        logger.debug("Session" + se.getSession().getId() + " created");
        SessionRegistry.addSession(se.getSession());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        logger.debug("Session" + se.getSession().getId() + " destroyed");
        SessionRegistry.removeSession(se.getSession());
    }

    @Override
    public void sessionIdChanged(HttpSessionEvent event, String oldSessionId) {
        logger.debug("Session ID" + oldSessionId + "changed to" + event.getSession().getId());
        SessionRegistry.updateSession(event.getSession(), oldSessionId);
    }
}
