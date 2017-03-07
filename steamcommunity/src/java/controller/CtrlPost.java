package controller;

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
}
