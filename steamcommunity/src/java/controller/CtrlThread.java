/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import model.Discussion;
import network.Factory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Sujana
 */
public class CtrlThread {
    public static SessionFactory factory;
    public CtrlThread()
    {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("error membuat Session factory");
            e.printStackTrace();
        }
    }
     public ArrayList<Thread> getAllThread()
    {
        Session session = Factory.getInstance().openSession();
        ArrayList<Thread> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from thread");
        hasil = (ArrayList<Thread>) q.list();
        
        tx.commit();
        session.close();
        
        return hasil;
    }
    public static boolean insertThread(Thread t)
    {
        Session session = Factory.getInstance().openSession();
        ArrayList<Thread> hasil = null;
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(t);
        tx.commit();
        session.close();
        return true;
    }
}
