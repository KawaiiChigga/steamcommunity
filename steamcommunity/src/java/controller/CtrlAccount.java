package controller;

import model.User;
import network.Factory;
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
}
