/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import model.Thread;
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
    
    public static ArrayList<Thread> getAllThread()
    {
        Session session = Factory.getInstance().openSession();
        ArrayList<Thread> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Thread");
        hasil = (ArrayList<Thread>) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    public static Thread insertThread(Thread t)
    {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(t);
        Thread th = t;
        tx.commit();
        session.close();
        return th;
    }
}
