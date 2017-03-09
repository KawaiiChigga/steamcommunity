<%-- 
    Document   : discussion
    Created on : Feb 22, 2017, 6:21:36 PM
    Author     : Sujana
--%>

<%@page import="model.User"%>
<%@page import="controller.CtrlAccount"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Start Your Discussion</title>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true" />
        <%
            User u = CtrlAccount.getUser((Integer) session.getAttribute("currentsession"));
            if (u == null) {
                return;
            } else {
                if (u.getUserId() != 1) {
                    return;
                }
            }
        %>
        <div class="content">
            <h3 style="color: #FFFFFF">New Discussion</h3><br/><br/>
            <div style="border: solid 1px #223245; background: #223245;text-align: justify; line-height: 23px; color: white; width: 700px; height:700px; margin-left: 50px;margin-top: 20px ; padding-top: 5px;padding-left: 30px; padding-right: 30px">
                <p style="color:white">Start a new discussion</p><hr/> 
                <form action="adddiscussion" method="POST" enctype="multipart/form-data">
                Game Name:<br/>
                <input type="text" style="width:500px;color:black" name="txtGameName" /><br/>
                Description:<br/>
                <textarea name="txtDescription" rows="10" cols="20" style="width:500px;color:black"></textarea><br/>
                ID Moderator:<br/>
                <input type="text" style="width:500px;color:black" name="txtModerator" /><br/><br/>
                Image:<br/>
                <input type="file" style="width:500px;color:black" name="txtImg" /><br/><br/>
                <input type="submit" class="btn btn-default" style="background-color:rgb(27,40,56); margin-top:5px;color:white; font-family: lato; font-size: 16px;" value="Create Discussion"><br/>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
