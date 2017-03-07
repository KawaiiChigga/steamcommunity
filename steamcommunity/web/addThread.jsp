<%@page import="model.User"%>
<%@page import="controller.CtrlAccount"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true" />
        <div class="content">
            <jsp:include page="headerthread.jsp" flush="true"></jsp:include>
            <div class="contentthreadleft" style="background: #223245;text-align: justify; line-height: 23px; margin-top: 20px ; padding-top: 5px;padding-left: 30px; padding-right: 30px">
                <p style="color:white">Start a new thread</p><hr/> 
                <form action="newthread" method="POST">
                Title:<br/>
                <input type="text" style="width:500px;color:black" name="txtTitle" /><br/>
                Content:<br/>
                <textarea name="txtContent" rows="10" cols="20" style="width:500px;color:black"></textarea><br/>
                Post In:<br/>
                <input type="radio" name="rbPost" value="1" />General Discussion <br/>
                <input type="radio" name="rbPost" value="2" />Trading <br/>
                <input type="submit" value="Post Thread" style="color:black"><br/>
                <input type="hidden" name="idDiscussion" value="<%=request.getParameter("id")%>"/>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
