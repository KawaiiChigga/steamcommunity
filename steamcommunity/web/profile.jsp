<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp" flush="true" />
            <div class="profile_header">
                <div class="profile_avatar">

                </div>
                <div class="profile_summary">
                    <div class="profile_persona">
                        <h3>Gaunled</h3>
                        <p><b>Daniel</b> at Bandung, Jawa Barat, Indonesia </p>
                    </div>
                    <div class="profile_desc">
                        This is description!
                    </div>
                    <div style="clear: both;"></div>
                </div>
                <div class="profile_edit_btn">
                    <a href="editprofile.jsp"><input type="button" value="Edit Profile"></a><br/><br/>
                    <a href="discussion.jsp"><input type="button" value="New Thread"></a>
                </div>
                <div style="clear: both;"></div>
            </div>
            <div class="profile_content">
                <div class="profile_content_left">
                    <h2>Recent Activity</h2>
                    <hr />
                </div>
                <div class="profile_content_right">
                    <h4>Friends</h4>
                </div>
                <div style="clear: both;"></div>
            </div>
            
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </body>
</html>
