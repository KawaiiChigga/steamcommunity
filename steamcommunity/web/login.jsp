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
                <h3>Sign In</h3>
                <p>To an existing Steam account</p>
                <form action="#" method="POST">
                    Steam username <br/>
                    <input type="text" name="txtUsername" /> <br/>
                    Password <br/>
                    <input type="password" name="txtPassword" /> <br/>
                    <input type="checkbox" name="checkRemember" /> Remember me on this computer <br/>
                    <input type="submit" name="btnSubmit" value="Sign in"/>
                </form>
                <a href="#">Forgot your password?</a>
            </div>
        </div>
    </body>
</html>
