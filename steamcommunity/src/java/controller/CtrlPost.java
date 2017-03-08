package controller;

import java.util.ArrayList;
import model.Post;
import network.Factory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CtrlPost {
    public static Post getPost(Integer id) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        Post p = null;
        try {
            Query q = session.createQuery("from Post where postID=?");
            q.setInteger(0, id);
            
            p = (Post) q.uniqueResult();
            tx.commit();
        } catch (Exception e) {
        }
        session.close();
        return p;
    }
    
    public static Post insertPost(Post p) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(p);
        Post post = p;
        tx.commit();
        session.close();
        return post;
    }
    
    public static ArrayList<Post> getAllPost(Integer threadID) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        ArrayList <Post> p = null;
        try {
            Query q = session.createQuery("from Post where threadID=? ORDER BY postDateTime ASC");
            q.setInteger(0, threadID);
            
            p = (ArrayList<Post>) q.list();
            tx.commit();
        } catch (Exception e) {
        }
        session.close();
        return p;
    }
    
    public static ArrayList<Post> getPostByUserID(Integer uid) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        ArrayList <Post> p = null;
        try {
            Query q = session.createQuery("from Post where userID=? ORDER BY postDateTime DESC");
            q.setInteger(0, uid);
            
            p = (ArrayList<Post>) q.list();
            tx.commit();
        } catch (Exception e) {
        }
        session.close();
        return p;
    }
}
