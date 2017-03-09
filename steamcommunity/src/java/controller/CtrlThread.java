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
    
    public static ArrayList<Thread> getAllThread(Integer disID, Integer category)
    {
        Session session = Factory.getInstance().openSession();
        ArrayList<Thread> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Thread where discussionID=? and categoryType=? order by isPinned DESC, publishDateTime ASC");
        q.setInteger(0, disID);
        q.setInteger(1, category);
        
        hasil = (ArrayList<Thread>) q.list();
        tx.commit();
        session.close();
        return hasil;
    }
    
    public static Thread getThread(Integer thID) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        Thread th = null;
        try {
            Query q = session.createQuery("from Thread where threadID=?");
            q.setInteger(0, thID);
            
            th = (Thread) q.uniqueResult();
            tx.commit();
        } catch (Exception e) {
        }
        session.close();
        return th;
        
        
    }
     public static ArrayList<Thread> getAllSearch(String cari, Integer index)
    {
        Session session = Factory.getInstance().openSession();
        ArrayList<Thread> hasil = null;
        Transaction tx = session.beginTransaction();
        try {
            Query q = session.createQuery("from Thread where discussionID="+index+" and title like'%"+cari+"%'");
            hasil = (ArrayList<Thread>) q.list();
        } catch (Exception e ){
            e.printStackTrace();
        }
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
