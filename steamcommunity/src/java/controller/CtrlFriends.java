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
    public static boolean addFriends(User current, User add, String status) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        
        Friends f = new Friends();
        if (status.equals("update")) {
            f.setId(new FriendsId(current.getUserId(), add.getUserId()));
            f.setUserByFriendId(add);
            f.setUserByUserId(current);
            f.setStatus((byte) 1);
            session.saveOrUpdate(f);
            
            Friends up = new Friends();
            up.setId(new FriendsId(add.getUserId(), current.getUserId()));
            up.setUserByFriendId(current);
            up.setUserByUserId(add);
            up.setStatus((byte) 1);
            session.update(up);
        } else {
            f.setId(new FriendsId(current.getUserId(), add.getUserId()));
            f.setUserByFriendId(add);
            f.setUserByUserId(current);
            f.setStatus((byte) 0);
            session.saveOrUpdate(f);
        }
        
        tx.commit();
        
        session.close();
        return true;
    }
    
    public static boolean checkFriend (Integer uid, Integer fid) {
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("cek");
        Query q = session.createQuery("from Friends where userID=? and friendID=?");
        q.setInteger(0, uid);
        q.setInteger(1, fid);
        System.out.println("query");
        Friends f = (Friends) q.uniqueResult();
        tx.commit();
        session.close();
        
        if (f != null) {
            if (f.getStatus() == (byte) 0) {
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }
    public static ArrayList<Friends> getFriends (Integer uid, String type, int all) {
        ArrayList<Friends> list = null;
        
        Session session = Factory.getInstance().openSession();
        Transaction tx = session.beginTransaction();
        
        Query q = null;
        if (type.equals("userID")) {
            if (all == 1) {
                q = session.createQuery("from Friends where " + type + "=?");
                q.setInteger(0, uid);
            } else {
                q = session.createQuery("from Friends where " + type + "=? and status=1");
                q.setInteger(0, uid);
            }
        } else {
            q = session.createQuery("from Friends where " + type + "=?");
            q.setInteger(0, uid);
        }
        list = (ArrayList<Friends>) q.list();
        
        tx.commit();
        session.close();
        return list;
    }
}
