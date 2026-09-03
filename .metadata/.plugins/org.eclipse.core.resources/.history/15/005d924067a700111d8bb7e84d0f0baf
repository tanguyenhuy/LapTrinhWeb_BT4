package huytan.vn.dao.impl;

import jakarta.persistence.*;
import huytan.vn.configs.JpaConfig;
import huytan.vn.dao.IUserDao;
import huytan.vn.entities.User;

public class UserDaoImpl implements IUserDao {
    @Override
    public void insert(User user) {
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user);
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public void update(User user) {
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(user);
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public User findByUsername(String username) {
        EntityManager em = JpaConfig.getEntityManager();
        try {
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.username = :username", User.class);
            query.setParameter("username", username);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    @Override
    public User findByEmail(String email) {
        EntityManager em = JpaConfig.getEntityManager();
        try {
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class);
            query.setParameter("email", email);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    @Override
    public User findByUsernameOrEmail(String value) {
        EntityManager em = JpaConfig.getEntityManager();
        try {
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.username = :val OR u.email = :val", User.class);
            query.setParameter("val", value);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }
}