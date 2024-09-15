package com.ipn.mx.model.dao;

import java.util.List;
import com.ipn.mx.model.dto.Becario;
import com.ipn.mx.model.dto.Usuario;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class BecarioDAO {
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
    
    public void create(Becario becario) {
        try{
            session = buildSessionFactory().openSession();
        session.beginTransaction();
        session.save(becario);
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

    public void update(Becario becario) {
        try{
            session = buildSessionFactory().openSession();
            session.beginTransaction();
            session.update(becario);
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

    public void delete(Becario becario) {
        try{
            session = buildSessionFactory().openSession();
            session.beginTransaction();
            session.delete(becario);
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
    
    public Becario find(Becario becario) {
        try{
            session = buildSessionFactory().openSession();
            becario=(Becario)session.get(Becario.class,becario.getCurp());
            return becario;
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
    
    public Becario find(Usuario usuario) {
        List<Becario> resultados=null;
        Becario resultado=null;
        try{
            session = buildSessionFactory().openSession();
            String hql = "from Becario where correo='"+usuario.getCorreo()+"'";
            Query query = session.createQuery(hql);
            if(query.list().size()>0)
                resultado = (Becario)query.list().get(0);
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
    
    public List<Becario> findAll() {
        List<Becario> resultados=null;
        try{
            session = buildSessionFactory().openSession();
            String hql = "from Becario";
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
        BecarioDAO dao = new BecarioDAO();
        Becario becario = new Becario();
        Usuario usuario=new Usuario();
        usuario.setCorreo("correo7@gmail.com");
        becario=dao.find(usuario);
        System.out.println(becario.getCurp());
        //becario.setCurp("AUPL970715HMCBRS00");
        //System.out.println(dao.find(becario).getDireccion().getIdDireccion());
    }
    */
}

