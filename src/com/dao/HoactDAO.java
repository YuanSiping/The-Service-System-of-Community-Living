package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Hoact;

/**
 * A data access object (DAO) providing persistence and search support for Hoact
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.Hoact
 * @author MyEclipse Persistence Tools
 */

public class HoactDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(HoactDAO.class);
	// property constants
	public static final String _ANAME = "AName";
	public static final String _AADRESS = "AAdress";
	public static final String _ACOMENT = "AComent";
	public static final String _ASPEC = "ASpec";

	protected void initDao() {
		// do nothing
	}

	public void save(Hoact transientInstance) {
		log.debug("saving Hoact instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Hoact persistentInstance) {
		log.debug("deleting Hoact instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Hoact findById(java.lang.Integer id) {
		log.debug("getting Hoact instance with id: " + id);
		try {
			Hoact instance = (Hoact) getHibernateTemplate().get(
					"com.pojo.Hoact", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Hoact instance) {
		log.debug("finding Hoact instance by example");
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
		log.debug("finding Hoact instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Hoact as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAName(Object AName) {
		return findByProperty(_ANAME, AName);
	}

	public List findByAAdress(Object AAdress) {
		return findByProperty(_AADRESS, AAdress);
	}

	public List findByAComent(Object AComent) {
		return findByProperty(_ACOMENT, AComent);
	}

	public List findByASpec(Object ASpec) {
		return findByProperty(_ASPEC, ASpec);
	}

	public List findAll() {
		log.debug("finding all Hoact instances");
		try {
			String queryString = "from Hoact";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Hoact merge(Hoact detachedInstance) {
		log.debug("merging Hoact instance");
		try {
			Hoact result = (Hoact) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Hoact instance) {
		log.debug("attaching dirty Hoact instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Hoact instance) {
		log.debug("attaching clean Hoact instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static HoactDAO getFromApplicationContext(ApplicationContext ctx) {
		return (HoactDAO) ctx.getBean("HoactDAO");
	}
}