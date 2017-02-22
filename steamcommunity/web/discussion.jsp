<%-- 
    Document   : discussion
    Created on : Feb 22, 2017, 6:21:36 PM
    Author     : Sujana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Start Your Thread</title>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true" />
        <div class="content">
            <h3 style="color: #FFFFFF">New Discussion</h3><br/><br/>
            <div style="border: solid 1px #223245; background: #223245;text-align: justify; line-height: 23px; color: white; width: 700px; height: 400px; margin-left: 50px;margin-top: 20px ; padding-top: 5px;padding-left: 30px; padding-right: 30px">
                <p style="color:white">Start a new discussion</p><hr/> 
                Discussion ID:<br/>
                <input type="text" name="txtDiscussionId" /> <br/>
                Game Name:<br/>
                <input type="text" name="txtGameName" /><br/>
                Description:<br/>
                <input type="text" name="txtDescription" /><br/>
                Image:<br/>
                <input type="text" name="txtGameName" /><br/>

            </div>
        </div>
    </body>
</html>
