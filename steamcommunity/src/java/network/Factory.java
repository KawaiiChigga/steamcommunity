package network;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Factory {
    public static SessionFactory factory;
    
    public static SessionFactory getInstance() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("Failed to create SessionFactory");
            e.printStackTrace();
        }
        return factory;
    }
}
