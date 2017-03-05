<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" flush="true" />
            <div class="content">

            </div>
            <div style="background-color:rgb(23,26,33); width: 700px; height:325px; margin-left: 200px;margin-top: 20px ; padding-top: 5px;padding-left: 30px; padding-right: 30px;">
                <div class="form-group">
                    <form action="newthread" method="post">
                
                <text style="color:white; font-size:12px;">START A NEW THREAD</text><hr>
                
                <input style="background-color:rgb(15,25,40); color:white;" type="text" class="form-control" id="usr" name="threadname" placeholder="enter a title"><br>
                <textarea style="resize:none;background-color:rgb(15,25,40); color:white;" class="form-control" rows="5" id="comment" name="threadcontent" placeholder="say something"></textarea>
                <br><input type="submit" class="btn btn-default" style="background-color:rgb(0,100,0);width:25%; color:white; float:right; font-family: lato; font-size: 16px;" value="Post Discussion">
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
