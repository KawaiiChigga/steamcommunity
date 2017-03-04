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
    public static boolean insertDiscussion(Discussion d)
    {
        Session session = Factory.getInstance().openSession();
        ArrayList<Discussion> hasil = null;
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(d);
        tx.commit();
        session.close();
        return true;
    }
}
