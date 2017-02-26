<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%@ attribute name="htmlTitle" type="java.lang.string" rtexprvalue="true" required="true" %>
<%@ attribute name="bodyTitle" type="java.lang.String" rtexprvalue="true" required="false" %>
<%@ attribute name="headContent" fragment="true" required="false" %>
<%@ attribute name="navigationContent" fragment="true" required="false" %>
<%@ include file="/WEB-INF/jsp/base.jspf" %>
<!DOCTYPE html>
<html>
<head>
<title>Rainy Blog :: <c:out value="${fn:trim(htmlTitle)}"</title>
<link href="<c:url value="/resource/stylesheet/main.css">" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="//cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/moment.js/2.17.1/moment.min.js"></script>
    <script type="text/javascript">
    var postInvisibleForm = function(url, fields) {
        var form = $('<form id="mapForm" method="post"></form>').attr({action: url, style: 'display: none;'});
        for(var key in fields) {
            if(fields.hasOwnProperty(key))
                form.append($('<input type="hidden">').attr({
                    name: key, value: fields[key]
            }));
            $('body').append(form);
            form.submit();
        }
    }
    var newChat = function() {
        postInvisibleForm('<c:url value="/chat" />', {action: 'new'});
    }
    </script>
    <jsp:invoke fragment="headContent"/>
    </head>
    <body>
        <h1>Rainy Blog</h1>
        <jsp:invoke fragment="navigationContent"/>
        <h2><c:out value="${fn:trim(bodyTitle)}"</h2>
        <jsp:body/>
    </body>
    </html>














