package com.chaokunyang.monitor;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 维护活跃会话列表，仅在单机下和使用集群会话复制的容器环境下使用。
 *  单机下活跃会话在内存中，不占用过多存储空间。集群下一般session在分布式缓存中，jvm维护活跃会话列表维护的是整个集群的会话，大规模集群会占用极大内存空间
 * @author chaokunyang
 * @create 2017/2/12
 */
public class SessionRegistry {
    private SessionRegistry() {
    }

    private static final Map<String, HttpSession> SESSIONS = new ConcurrentHashMap<>();

    public static void addSession(HttpSession session) {
        SESSIONS.put(session.getId(), session);
    }

    public static void updateSession(HttpSession session, String oldSessionId) {
        synchronized (SESSIONS) {
            SESSIONS.remove(oldSessionId);
            addSession(session);
        }
    }

    public static void removeSession(HttpSession session) {
        SESSIONS.remove(session.getId());
    }

    public static List<HttpSession> getAllSessions() {
        return new ArrayList<>(SESSIONS.values());
    }

    public static int getNumberOfSessions() {
        return SESSIONS.size();
    }
}
