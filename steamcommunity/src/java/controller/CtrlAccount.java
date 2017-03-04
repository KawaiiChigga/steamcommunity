package controller;

import java.util.ArrayList;
import model.User;
import network.Factory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CtrlAccount{
    public static User getUser(String username) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        User u = null;
        try {
            Query q = session.createQuery("from User where username=?");
            q.setString(0, username);
            
            u = (User) q.uniqueResult();
            tx.commit();
        } catch (Exception e) {
        }
        return u;
    }
    
    public static boolean createAccount(User u) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(u);
        tx.commit();
        session.close();
        return true;
    }
    
    public static User login(String username, String password) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        User u = null;
        try {
            Query q = session.createQuery("from User where username=? and password=?");
            q.setString(0, username);
            q.setString(1, password);
            
            u = (User) q.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return u;
    }
    public static boolean edit(User u) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(u);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return true;
    }
}
