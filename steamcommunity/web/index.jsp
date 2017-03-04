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
                <h3 style="color: #66C0F4">Welcome to the Steam Discussions</h3>
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
                <h3 style="color: #66C0F4">Game Forums</h3>
                <div class="line"></div><br>
                <%
                    for (int i = 0; i < 5; i++) {
                %>
                    <div class="discussionbar">
                        <img src="image/games/leavinglyndow.jpg" class="gamelogos">
                        <a href="thread.jsp" class="discussiontitle">Leaving Lyndow</a>
                        <a href="thread.jsp" class="viewall">VIEW ALL</a>
                    </div>
                <%
                    }
                %>
            </div>
            
        </div>
            <jsp:include page="footer.jsp" flush="true" />
    </body>
</html>
