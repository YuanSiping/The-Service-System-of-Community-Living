package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Atac;
import com.pojo.AtacId;

/**
 * A data access object (DAO) providing persistence and search support for Atac
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.Atac
 * @author MyEclipse Persistence Tools
 */

public class AtacDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(AtacDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(Atac transientInstance) {
		log.debug("saving Atac instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Atac persistentInstance) {
		log.debug("deleting Atac instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Atac findById(com.pojo.AtacId id) {
		log.debug("getting Atac instance with id: " + id);
		try {
			Atac instance = (Atac) getHibernateTemplate().get("com.pojo.Atac",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Atac instance) {
		log.debug("finding Atac instance by example");
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
		log.debug("finding Atac instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Atac as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Atac instances");
		try {
			String queryString = "from Atac";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Atac merge(Atac detachedInstance) {
		log.debug("merging Atac instance");
		try {
			Atac result = (Atac) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Atac instance) {
		log.debug("attaching dirty Atac instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Atac instance) {
		log.debug("attaching clean Atac instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static AtacDAO getFromApplicationContext(ApplicationContext ctx) {
		return (AtacDAO) ctx.getBean("AtacDAO");
	}
}