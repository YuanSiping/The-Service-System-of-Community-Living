package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class HQLDAO extends HibernateDaoSupport {

	public List findByHQL(final String hql, final Object... p) {
		
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				for (int i = 0; i < p.length; i++) {
					query.setParameter(i, p[i]);
				}
				return query.list();
			}
		});

		return list;
	}

	public List pageQuery(final String hql, final Integer page,
			final Integer size, final Object... p) {
		return getHibernateTemplate().executeFind(new HibernateCallback() {

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if (p != null)
					for (int i = 0; i < p.length; i++) {
						query.setParameter(i, p[i]);
					}
				if (page != null && size != null)
					query.setFirstResult((page - 1) * size).setMaxResults(size);
				return query.list();
			}
		});
	}

	public void bulkUpdate(String hql) {
		getHibernateTemplate().bulkUpdate(hql);
	}

	public float unique(String hql, Object... p) {
		List list = findByHQL(hql, p);
		Object obj = list.get(0);
		float f = Float.parseFloat(obj.toString());
		return f;
	}

}
