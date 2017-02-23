package controller;

import java.util.ArrayList;
import model.User;
import network.Factory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CtrlAccount{
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
        }
        session.close();
        return u;
    }
}
