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
                <h3>Welcome to the Steam Discussions</h3>
                <p><b>Everyone is invited!</b> The Steam discussions are for everyone, new and 
                    advanced user alike! </p>
                <p><b>Searching is key!</b> Before you post a question, use the forum search feature 
                    to determine whether your topic has already been covered. <br/> </p>
                <p><b>Do not start flame wars!</b> If someone has engaged in behavior that is a detriment 
                    to the message board -- spamming, flaming people, etc -- contact one of the forum moderators 
                    or report the post. Flaming the offensive user will only increase the problem. 
                    Harassment is not tolerated. </p>
                
                <form action="#" method="GET">
                    <input type="text" name="search" placeholder="Search discussions" />
                    <input type="submit" value="Search" />
                </form>
                
                <br/>
                <h3>Game Forums</h3>
                <div class="line"></div>
            </div>
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </body>
</html>
