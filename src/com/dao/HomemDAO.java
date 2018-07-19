package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Homem;
import com.pojo.HomemId;

/**
 * A data access object (DAO) providing persistence and search support for Homem
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.Homem
 * @author MyEclipse Persistence Tools
 */

public class HomemDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(HomemDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(Homem transientInstance) {
		log.debug("saving Homem instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Homem persistentInstance) {
		log.debug("deleting Homem instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Homem findById(com.pojo.HomemId id) {
		log.debug("getting Homem instance with id: " + id);
		try {
			Homem instance = (Homem) getHibernateTemplate().get(
					"com.pojo.Homem", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Homem instance) {
		log.debug("finding Homem instance by example");
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
		log.debug("finding Homem instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Homem as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Homem instances");
		try {
			String queryString = "from Homem";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Homem merge(Homem detachedInstance) {
		log.debug("merging Homem instance");
		try {
			Homem result = (Homem) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Homem instance) {
		log.debug("attaching dirty Homem instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Homem instance) {
		log.debug("attaching clean Homem instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static HomemDAO getFromApplicationContext(ApplicationContext ctx) {
		return (HomemDAO) ctx.getBean("HomemDAO");
	}
}