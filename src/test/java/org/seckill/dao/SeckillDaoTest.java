package org.seckill.dao;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.seckill.BaseTest;
import org.seckill.entity.Seckill;

public class SeckillDaoTest extends BaseTest {

	//注入Dao实现类依赖
	@Resource
	private SeckillDao seckillDao;
	
	@Test
	public void testQueryById() throws Exception {
		long id = 1000;
		Seckill seckill = seckillDao.queryById(id);
		System.out.println(seckill.getName());
		System.out.println(seckill);
	}

	@Test
	public void testQueryAll() throws Exception  {
		//Parameter 'offset' not found. Available parameters are [0, 1, param1, param2]
		// java没有保存形参的记录:queryAll(int offset, int limit) -> queryAll(arg1,arg2)
		List<Seckill> seckills = seckillDao.queryAll(0, 100);
		for (Seckill seckill : seckills) {
			System.out.println(seckill);
		}
	}

	@Test
	public void testReduceNumber() throws Exception {
		Date killTime = new Date();
		int updateCount = seckillDao.reduceNumber(1000L, killTime);
		System.out.println("updateCount=" + updateCount);
	}

}
