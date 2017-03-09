package controller;

import java.util.ArrayList;
import model.User;
import network.Factory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CtrlAccount{
    public static User getUser(Integer uid) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        User u = null;
        try {
            Query q = session.createQuery("from User where userID=?");
            q.setInteger(0, uid);
            
            u = (User) q.uniqueResult();
            tx.commit();
        } catch (Exception e) {
        } finally {
            session.close();
        }
        return u;
    }
    
    public static boolean createAccount(User u) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.saveOrUpdate(u);
            tx.commit();
        } catch (Exception e) {
        } finally {
            session.close();
        }
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
    public static ArrayList<User> getAllSearch(String cari)
    {
        Session session = Factory.getInstance().openSession();
        ArrayList<User> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from User where username like'%"+cari+"%'");
        hasil = (ArrayList<User>) q.list();
        
        tx.commit();
        session.close();
        
        return hasil;
    }
    
    public static boolean edit(User u) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(u);
            tx.commit();
        } catch (Exception e) {
        } finally {
            session.close();
        }
        return true;
    }
}
