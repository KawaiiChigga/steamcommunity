package network;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Factory {
    public static SessionFactory factory;
    
    public Factory() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Exception e) {
            System.err.println("Error membuat Session factory");
            e.printStackTrace();
            
        }
    }
    
}
