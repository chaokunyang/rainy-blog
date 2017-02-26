<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%@ attribute name="htmlTitle" type="java.lang.String" rtexprvalue="true" required="true" %>
<%@ attribute name="bodyTitle" type="java.lang.String" rtexprvalue="true" required="false" %>
<%@ attribute name="extraHeadContent" fragment="true" required="false" %>
<%@ attribute name="extraNavigationContent" fragment="true" required="false" %>
<%@ include file="/WEB-INF/jsp/base.jspf"%>
<template:main htmlTitle="${htmlTitle}" bodyTitle="${bodyTitle}">
    <jsp:attribute name="headContent">
        <jsp:invoke fragment="extraHeadContent"/>
    </jsp:attribute>
    <jsp:attribute name="navigationContent">
        <a href="<c:url value="/blog"/> ">博客列表</a><br/>
        <a href="<c:url value="/blog"/> ">
            <c:param name="action" value="create" />创建博客
        </a><br/>
        <a href="<c:url value="/chat"/>">
            <c:param name="action" value="list"/>查看聊天列表
        </a><br/>
        <a href="><c:url value="/login?logout" />">退出登录</a><br/>
        <jsp:invoke fragment="extraNavigationContent"/>
    </jsp:attribute>
    <jsp:body>
        <jsp:doBody/>
    </jsp:body>
</template:main>







