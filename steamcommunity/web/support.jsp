<%-- 
    Document   : support
    Created on : Feb 21, 2017, 9:53:45 PM
    Author     : Sujana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Steam Support</title>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" flush="true" />
            <div class="content">
                <h3 style="color: #FFFFFF">Steam Support</h3>
                <h4 style="color: #66C0F4">What do you need help with?</h4>
                <p style="border: solid 1px #233550; background: #233550; padding: 15px; margin: 0; text-align: justify; line-height: 23px; color: white; font-size: 12px">
                    Sign in to your Steam account to review purchases, account status, and get personalized help.
                <br/><br/><a href="login.jsp"><input style="background:#66CCFF; border: 0; font-weight: bold; color: white ;height: 30px; width: 200px" type="button" value="Sign in to Steam"/></a>
                </p><br/><br/>
                <h5 style="color: #66C0F4">POPULAR PRODUCT</h5>
                <br/>
                
                <a href=""><input style="background:#708090 ; border: 0; font-weight: bold; height: 50px; width: 700px;color: white;text-align: justify" type="button" value="DOTA"/></a><br/><br/>
                <a href=""><input style="background:#708090 ; border: 0; font-weight: bold; height: 50px; width: 700px;color: white;text-align: justify" type="button" value="Counter Strike"/></a><br/><br/>
                <a href=""><input style="background:#708090 ; border: 0; font-weight: bold; height: 50px; width: 700px;color: white;text-align: justify" type="button" value="Grand Theft Auto V"/></a><br/><br/>
                <a href=""><input style="background:#708090 ; border: 0; font-weight: bold; height: 50px; width: 700px;color: white;text-align: justify" type="button" value="ARK: Survival Evolved"/></a><br/><br/>
                <div class="line" style="height: 2px; width: 700px"></div><br/>
                <a href=""><input style="background:#708090 ; border: 0; font-weight: bold; height: 100px; width: 700px;color: white;text-align: justify" type="button" value="Game, Software, Etc"/></a><br/><br/>
                <a href=""><input style="background:#708090 ; border: 0; font-weight: bold; height: 100px; width: 700px;color: white;text-align: justify" type="button" value="Purchases"/></a><br/><br/>
                <a href=""><input style="background:#708090 ; border: 0; font-weight: bold; height: 100px; width: 700px;color: white;text-align: justify" type="button" value="My Account"/></a><br/><br/>
                <a href=""><input style="background:#708090 ; border: 0; font-weight: bold; height: 100px; width: 700px;color: white;text-align: justify" type="button" value="Steam Hardware"/></a><br/><br/>
            </div>
            
        </div>
            <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
