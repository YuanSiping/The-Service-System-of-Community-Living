package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Hoa;
import com.pojo.HoaId;

/**
 * A data access object (DAO) providing persistence and search support for Hoa
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.Hoa
 * @author MyEclipse Persistence Tools
 */

public class HoaDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(HoaDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(Hoa transientInstance) {
		log.debug("saving Hoa instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Hoa persistentInstance) {
		log.debug("deleting Hoa instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Hoa findById(com.pojo.HoaId id) {
		log.debug("getting Hoa instance with id: " + id);
		try {
			Hoa instance = (Hoa) getHibernateTemplate().get("com.pojo.Hoa", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Hoa instance) {
		log.debug("finding Hoa instance by example");
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
		log.debug("finding Hoa instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Hoa as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Hoa instances");
		try {
			String queryString = "from Hoa";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Hoa merge(Hoa detachedInstance) {
		log.debug("merging Hoa instance");
		try {
			Hoa result = (Hoa) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Hoa instance) {
		log.debug("attaching dirty Hoa instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Hoa instance) {
		log.debug("attaching clean Hoa instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static HoaDAO getFromApplicationContext(ApplicationContext ctx) {
		return (HoaDAO) ctx.getBean("HoaDAO");
	}
}