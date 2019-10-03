package com.ipn.mx.model.dao;

import com.ipn.mx.model.dto.Discapacidades;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class DiscapacidadDAO {
    static Session session;
    static SessionFactory sessionFactory;
    private static ServiceRegistry serviceRegistryObj;
    
    private static SessionFactory buildSessionFactory() {
        // Creating Configuration Instance & Passing Hibernate Configuration File
        Configuration configObj = new Configuration();
        configObj.configure("hibernate.cfg.xml");
 
        // Since Hibernate Version 4.x, ServiceRegistry Is Being Used
        serviceRegistryObj = new StandardServiceRegistryBuilder().applySettings(configObj.getProperties()).build(); 
 
        // Creating Hibernate SessionFactory Instance
        sessionFactory = configObj.buildSessionFactory(serviceRegistryObj);
        return sessionFactory;
    }
    
    public void create(Discapacidades u) {
        try{
            session = buildSessionFactory().openSession();
        session.beginTransaction();
        session.save(u);
        session.getTransaction().commit();
        }catch(HibernateException ex){
            ex.printStackTrace();
        }finally{
            if(session.isOpen()){
                session.close();
            }
            if(!sessionFactory.isClosed()){
                sessionFactory.close();
            }
            StandardServiceRegistryBuilder.destroy(serviceRegistryObj);
        }
    }

    public void update(Discapacidades u) {
        try{
            session = buildSessionFactory().openSession();
            session.beginTransaction();
            session.update(u);
            session.getTransaction().commit();
        }catch(HibernateException ex){
            ex.printStackTrace();
        }finally{
            if(session.isOpen()){
                session.close();
            }
            if(!sessionFactory.isClosed()){
                sessionFactory.close();
            }
            StandardServiceRegistryBuilder.destroy(serviceRegistryObj);
        }
    }

    public void delete(Discapacidades u) {
        try{
            session = buildSessionFactory().openSession();
            session.beginTransaction();
            session.delete(u);
            session.getTransaction().commit();
        }catch(HibernateException ex){
            ex.printStackTrace();
        }finally{
            if(session.isOpen()){
                session.close();
            }
            if(!sessionFactory.isClosed()){
                sessionFactory.close();
            }
            StandardServiceRegistryBuilder.destroy(serviceRegistryObj);
        }
    }
    
    public Discapacidades find(Discapacidades u) {
        try{
            session = buildSessionFactory().openSession();
            u=(Discapacidades)session.get(Discapacidades.class,u.getIdDiscapacidad());
            return u;
        }catch(HibernateException ex){
            ex.printStackTrace();
        }finally{
            if(session.isOpen()){
                session.close();
            }
            if(!sessionFactory.isClosed()){
                sessionFactory.close();
            }
            StandardServiceRegistryBuilder.destroy(serviceRegistryObj);
        }
        return null;
    }
    
    public List<Discapacidades> findAll() {
        List<Discapacidades> resultados=null;
        try{
            session = buildSessionFactory().openSession();
            String hql = "from Discapacidades";
            Query query = session.createQuery(hql);
            resultados = query.list();
        }catch(HibernateException ex){
            ex.printStackTrace();
        }finally{
            if(session.isOpen()){
                session.close();
            }
            if(!sessionFactory.isClosed()){
                sessionFactory.close();
            }
            StandardServiceRegistryBuilder.destroy(serviceRegistryObj);
        }
        return resultados;
    }

    
    /*public static void main(String[] args) {
        UsuarioDAO dao = new UsuarioDAO();
        Usuario becario = new Usuario();
        becario.setIdUsuario(0);
        System.out.println(dao.find(becario));
    }*/
    
}

