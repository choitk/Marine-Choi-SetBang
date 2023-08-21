package com.setbang.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.setbang.domain.PlanVO;

@Repository("PlanDAO")
public class PlanDAOImpl implements PlanDAO{
	private static final Logger logger = LoggerFactory.getLogger(PlanDAOImpl.class);

	@Autowired
	private SqlSessionTemplate mybatis;

    @Override
	// 서비스 플랜 결제
    public void planPayment(PlanVO vo) {
		// TODO Auto-generated method stub
		logger.info("planPayment DAO");
		System.out.println("=> Mybatis planPayment() 호출");
        mybatis.insert("PlanDAO.planPayment", vo);
    }

    @Override
    // 월간 서비스 플랜 결제 시 다음달 자동결제
    public void autoPlanPayment(PlanVO vo) {
    	// TODO Auto-generated method stub
    	logger.info("autoPlanPayment DAO");
    	System.out.println("=> Mybatis autoPlanPayment() 호출");
    	mybatis.insert("PlanDAO.autoPlanPayment", vo);
    }

    @Override
    // 스케줄러 이용 자동결제 업데이트
    public void updateAutoPlanPayment(PlanVO vo) {
    	// TODO Auto-generated method stub
    	logger.info("updateAutoPlanPayment DAO");
    	System.out.println("=> Mybatis updateAutoPlanPayment() 호출");
    	mybatis.insert("PlanDAO.updateAutoPlanPayment", vo);
    }
    
    @Override
    // 서비스 플랜 업그레이드
    public void planUpgrade(PlanVO vo) {
    	// TODO Auto-generated method stub
    	logger.info("planUpgrade DAO");
    	System.out.println("=> Mybatis planUpgrade() 호출");
    	mybatis.insert("PlanDAO.planUpgrade", vo);
    }
    
    @Override
    // 결제 시 회원 서비스 플랜 등급 변경
    public void memPlanUpgrade(PlanVO vo) {
		// TODO Auto-generated method stub
		logger.info("memPlanUpgrade DAO");
		System.out.println("=> Mybatis memPlanUpgrade() 호출");
        mybatis.update("PlanDAO.memPlanUpgrade", vo);
    }

    @Override
    // 서비스 플랜 다운그레이드
    public void memPlanDowngrade(PlanVO vo) {
    	// TODO Auto-generated method stub
    	logger.info("memPlanDowngrade DAO");
    	System.out.println("=> Mybatis memPlanDowngrade() 호출");
    	mybatis.update("PlanDAO.memPlanDowngrade", vo);
    }

    @Override
    // 결제된 서비스 플랜 내역 조회
    public List<PlanVO> getPlanPaymentList(int memCode) {
    	// TODO Auto-generated method stub
    	logger.info("getPlanPaymentList DAO");
    	System.out.println("=> Mybatis getPlanPaymentList() 호출");
    	return mybatis.selectList("PlanDAO.getPlanPaymentList", memCode);
    }
   
}
