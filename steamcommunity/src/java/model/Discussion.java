package model;
// Generated Feb 28, 2017 6:24:31 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Discussion generated by hbm2java
 */
public class Discussion  implements java.io.Serializable {


     private Integer discussionId;
     private String gamename;
     private String description;
     private String imgurl;
     private Set<User> users = new HashSet<User>(0);
     private Set<Thread> threads = new HashSet<Thread>(0);

    public Discussion() {
    }

	
    public Discussion(String gamename, String description, String imgurl) {
        this.gamename = gamename;
        this.description = description;
        this.imgurl = imgurl;
    }
    public Discussion(String gamename, String description, String imgurl, Set<User> users, Set<Thread> threads) {
       this.gamename = gamename;
       this.description = description;
       this.imgurl = imgurl;
       this.users = users;
       this.threads = threads;
    }
   
    public Integer getDiscussionId() {
        return this.discussionId;
    }
    
    public void setDiscussionId(Integer discussionId) {
        this.discussionId = discussionId;
    }
    public String getGamename() {
        return this.gamename;
    }
    
    public void setGamename(String gamename) {
        this.gamename = gamename;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public String getImgurl() {
        return this.imgurl;
    }
    
    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }
    public Set<User> getUsers() {
        return this.users;
    }
    
    public void setUsers(Set<User> users) {
        this.users = users;
    }
    public Set<Thread> getThreads() {
        return this.threads;
    }
    
    public void setThreads(Set<Thread> threads) {
        this.threads = threads;
    }




}


