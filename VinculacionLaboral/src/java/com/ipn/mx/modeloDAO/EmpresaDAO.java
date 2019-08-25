package com.ipn.mx.modeloDAO;

import com.ipn.mx.modelo.Empresa;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class EmpresaDAO {
    protected EntityManager em;
    private EntityManagerFactory emf=null;

    public EmpresaDAO() {
        emf = Persistence.createEntityManagerFactory("VinculacionLaboralPU");
    }
    
    public void create(Empresa e) {
        em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(e);
        em.getTransaction().commit();
    }

    public void update(Empresa e) {
        em = emf.createEntityManager();
        em.getTransaction().begin();
        em.merge(e);
        em.getTransaction().commit();
    }

    public void delete(Empresa e) {
        em = emf.createEntityManager();
        em.getTransaction().begin();
        e = em.find(e.getClass(), e.getRfc());
        em.remove(e);
        em.getTransaction().commit();
    }

    public Empresa find(Empresa e) {
        em = emf.createEntityManager();
        em.getTransaction().begin();
        e = em.find(e.getClass(), e.getRfc());
        em.getTransaction().commit();
        return e;
    }

    public List<Empresa> findAll() {
        em = emf.createEntityManager();
        em.getTransaction().begin();
        Query q = em.createQuery("select e from Empresa as e");
        List<Empresa> resultados = q.getResultList();
        em.getTransaction().commit();
        return resultados;
    }

    public static void main(String[] args) {
        EmpresaDAO dao = new EmpresaDAO();
        Empresa e = new Empresa();
        //e.setRfc("1234567890--1");
        //dao.delete(articulo);
        //dao.update(articulo);
        //System.out.println(dao.find(e));
        //dao.create(articulo);
        System.out.println(dao.findAll());
    }
}
