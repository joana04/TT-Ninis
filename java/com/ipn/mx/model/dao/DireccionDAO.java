package com.ipn.mx.model.dao;

import java.util.List;
import com.ipn.mx.model.dto.Direccion;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class DireccionDAO {
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
    
    public void create(Direccion direccion) {
        try{
            session = buildSessionFactory().openSession();
        session.beginTransaction();
        session.save(direccion);
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

    public void update(Direccion direccion) {
        try{
            session = buildSessionFactory().openSession();
            session.beginTransaction();
            session.update(direccion);
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

    public void delete(Direccion direccion) {
        try{
            session = buildSessionFactory().openSession();
            session.beginTransaction();
            session.delete(direccion);
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
    
    public Direccion find(Direccion direccion) {
        try{
            session = buildSessionFactory().openSession();
            direccion=(Direccion)session.get(Direccion.class,direccion.getIdDireccion());
            return direccion;
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
    
    public List<Direccion> findAll() {
        List<Direccion> resultados=null;
        try{
            session = buildSessionFactory().openSession();
            String hql = "from direccion";
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
    
    public Integer getLastDireccion() {
        List<Direccion> resultados=null;
        Integer resultado=null;
        try{
            session = buildSessionFactory().openSession();
            String hql = "select max(idDireccion) from Direccion";
            Query query = session.createQuery(hql);
            resultado = (Integer)query.list().get(0);
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
        return resultado;
    }
    
    public static void main(String[] args) {
        DireccionDAO dao = new DireccionDAO();
        Direccion d = new Direccion();
        d.setIdDireccion(2);
        //System.out.println(dao.find(d).getCalle());
        System.out.println(dao.getLastDireccion());
    }
    
}

