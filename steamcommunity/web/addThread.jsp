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
                <input style="background-color:rgb(15,25,40); color:white;" type="text" class="form-control" id="usr" name="txtTitle" placeholder="enter a title"><br>
                Content:<br/>
                <textarea style="resize:none;background-color:rgb(15,25,40); color:white;" class="form-control" rows="10" id="comment" name="txtContent" placeholder="say something"></textarea>
                <br/>
                Post In:<br/>
                <input type="radio" name="rbPost" value="1" />General Discussion <br/>
                <input type="radio" name="rbPost" value="2" />Trading <br/>
                <input type="submit" class="btn btn-default" style="background-color:rgb(0,100,0);width:25%; color:white; float:right; font-family: lato; font-size: 16px;" value="Post Thread">
                <input type="hidden" name="idDiscussion" value="<%=request.getParameter("id")%>"/>
                </form>
            </div>
            <div style="clear:both"></div>
        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
