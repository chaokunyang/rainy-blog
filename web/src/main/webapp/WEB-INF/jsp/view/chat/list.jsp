<%--
  Created by IntelliJ IDEA.
  User: chaokunyang
  Date: 2017/2/26
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%--@elvariable id="sessions" type="java.util.List<com.wrox.chat.ChatSession>"--%>
<template:basic htmlTitle="聊天" bodyTitle="聊天请求列表">
    <c:choose>
        <c:when test="${fn:length(sessions) == 0}">
            <i>当前没有聊天请求.</i>
        </c:when>
        <c:otherwise>
            点击一个聊天请求开始聊天:<br /><br />
            <c:forEach items="${sessions}" var="s">
                <a href="javascript:void 0;"
                   onclick="join(${s.sessionId});">${s.visitorUsername}</a><br />
            </c:forEach>
        </c:otherwise>
    </c:choose>
    <script type="text/javascript" language="javascript">
        var join = function(id) {
            postInvisibleForm('<c:url value="/chat" />', {
                action: 'join', chatSessionId: id
            });
        };
    </script>
</template:basic>
