package com.devzooo.reviewBoard;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MyBatisTest {
	@Inject
	private SqlSessionFactory sqlFactory;
	@Test
	public void testFactory() throws Exception {
		System.out.println("== sqlFactory : "+sqlFactory);
	}	// end testFactory
	@Test
	public void testSession() throws Exception {
		try {
			SqlSession session = sqlFactory.openSession();
			System.out.println("== sqlSession : "+session);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}	// end testSession
}	// end class
