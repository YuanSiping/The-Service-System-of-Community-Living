package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.At;

/**
 * A data access object (DAO) providing persistence and search support for At
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.At
 * @author MyEclipse Persistence Tools
 */

public class AtDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(AtDAO.class);
	// property constants
	public static final String _CNUMBER = "CNumber";

	protected void initDao() {
		// do nothing
	}

	public void save(At transientInstance) {
		log.debug("saving At instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(At persistentInstance) {
		log.debug("deleting At instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public At findById(java.lang.Integer id) {
		log.debug("getting At instance with id: " + id);
		try {
			At instance = (At) getHibernateTemplate().get("com.pojo.At", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(At instance) {
		log.debug("finding At instance by example");
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
		log.debug("finding At instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from At as model where model." + propertyName
					+ "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCNumber(Object CNumber) {
		return findByProperty(_CNUMBER, CNumber);
	}

	public List findAll() {
		log.debug("finding all At instances");
		try {
			String queryString = "from At";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public At merge(At detachedInstance) {
		log.debug("merging At instance");
		try {
			At result = (At) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(At instance) {
		log.debug("attaching dirty At instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(At instance) {
		log.debug("attaching clean At instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static AtDAO getFromApplicationContext(ApplicationContext ctx) {
		return (AtDAO) ctx.getBean("AtDAO");
	}
}