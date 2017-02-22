package controller;

import network.Factory;
import org.hibernate.Session;

public class CtrlLogin {
    public static boolean validation() {
        Session session = Factory.factory.openSession();
        return false;
    }
}
