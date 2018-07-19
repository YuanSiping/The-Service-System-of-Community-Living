package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Ask;

/**
 * A data access object (DAO) providing persistence and search support for Ask
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.Ask
 * @author MyEclipse Persistence Tools
 */

public class AskDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(AskDAO.class);
	// property constants
	public static final String AS_TEXT = "asText";
	public static final String _RTEXT = "RText";

	protected void initDao() {
		// do nothing
	}

	public void save(Ask transientInstance) {
		log.debug("saving Ask instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Ask persistentInstance) {
		log.debug("deleting Ask instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Ask findById(java.lang.Integer id) {
		log.debug("getting Ask instance with id: " + id);
		try {
			Ask instance = (Ask) getHibernateTemplate().get("com.pojo.Ask", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Ask instance) {
		log.debug("finding Ask instance by example");
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
		log.debug("finding Ask instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Ask as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAsText(Object asText) {
		return findByProperty(AS_TEXT, asText);
	}

	public List findByRText(Object RText) {
		return findByProperty(_RTEXT, RText);
	}

	public List findAll() {
		log.debug("finding all Ask instances");
		try {
			String queryString = "from Ask";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Ask merge(Ask detachedInstance) {
		log.debug("merging Ask instance");
		try {
			Ask result = (Ask) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Ask instance) {
		log.debug("attaching dirty Ask instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Ask instance) {
		log.debug("attaching clean Ask instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static AskDAO getFromApplicationContext(ApplicationContext ctx) {
		return (AskDAO) ctx.getBean("AskDAO");
	}
}