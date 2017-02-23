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
    public static boolean edit(User u, Integer uid) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("update User set username=?, imageURL=?, description=?, name=?, "
                    + "country=?, province=?, city=? where userID=?");
            q.setString(0, u.getUsername());
            q.setString(1, u.getImageUrl());
            q.setString(2, u.getDescription());
            q.setString(3, u.getName());
            q.setString(4, u.getCountry());
            q.setString(5, u.getProvince());
            q.setString(6, u.getCity());
            q.setInteger(7, uid);
            
            q.executeUpdate();
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        session.close();
        return true;
    }
}
