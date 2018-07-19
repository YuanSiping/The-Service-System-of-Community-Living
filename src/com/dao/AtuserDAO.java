package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Atuser;
import com.pojo.AtuserId;

/**
 * A data access object (DAO) providing persistence and search support for
 * Atuser entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Atuser
 * @author MyEclipse Persistence Tools
 */

public class AtuserDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(AtuserDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(Atuser transientInstance) {
		log.debug("saving Atuser instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Atuser persistentInstance) {
		log.debug("deleting Atuser instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Atuser findById(com.pojo.AtuserId id) {
		log.debug("getting Atuser instance with id: " + id);
		try {
			Atuser instance = (Atuser) getHibernateTemplate().get(
					"com.pojo.Atuser", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Atuser instance) {
		log.debug("finding Atuser instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Atuser instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Atuser as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Atuser instances");
		try {
			String queryString = "from Atuser";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Atuser merge(Atuser detachedInstance) {
		log.debug("merging Atuser instance");
		try {
			Atuser result = (Atuser) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Atuser instance) {
		log.debug("attaching dirty Atuser instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Atuser instance) {
		log.debug("attaching clean Atuser instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static AtuserDAO getFromApplicationContext(ApplicationContext ctx) {
		return (AtuserDAO) ctx.getBean("AtuserDAO");
	}
}