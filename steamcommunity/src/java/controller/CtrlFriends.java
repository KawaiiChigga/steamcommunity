/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import model.Friends;
import model.FriendsId;
import model.User;
import network.Factory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Daniel
 */
public class CtrlFriends {
    public static boolean addFriends(User current, User add) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        
        Friends f = new Friends();
        f.setId(new FriendsId(current.getUserId(), add.getUserId()));
        f.setUserByFriendId(add);
        f.setUserByUserId(current);
        f.setStatus((byte) 0);
        
        session.saveOrUpdate(f);
        tx.commit();
        
        session.close();
        return true;
    }
    
    public static ArrayList<Friends> getFriends (Integer uid) {
        ArrayList<Friends> list = null;
        
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        
        Query q = session.createQuery("from Friends where userID=?");
        q.setInteger(0, uid);
        list = (ArrayList<Friends>) q.list();
        
        tx.commit();
        session.close();
        return list;
    }
}
