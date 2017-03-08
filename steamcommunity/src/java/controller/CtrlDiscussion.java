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
public class CtrlDiscussion {
    public ArrayList<Discussion> getAllDiscussion()
    {
        Session session = Factory.getInstance().openSession();
        ArrayList<Discussion> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Discussion");
        hasil = (ArrayList<Discussion>) q.list();
        
        tx.commit();
        session.close();
        
        return hasil;
    }
    public static ArrayList<Discussion> getAllSearch(String cari)
    {
        Session session = Factory.getInstance().openSession();
        ArrayList<Discussion> hasil = null;
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Discussion where gamename like'%"+cari+"%' or description like'%"+cari+"%'");
        hasil = (ArrayList<Discussion>) q.list();
        
        tx.commit();
        session.close();
        
        return hasil;
    }
    public static Discussion getDisc(Integer did) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        Discussion d = null;
        try {
            Query q = session.createQuery("from Discussion where discussionID=?");
            q.setInteger(0, did);
            
            d = (Discussion) q.uniqueResult();
            tx.commit();
        } catch (Exception e) {
        }
        session.close();
        return d;
    }
    public static Discussion insertDiscussion(Discussion d)
    {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(d);
        Discussion temp = d;
        tx.commit();
        session.close();
        return temp;
    }
}
