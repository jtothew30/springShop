package com.spring.shop.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component //root-context.xml���� bean���� ����� �� �ְ� �ϴ� ������̼�
@Aspect //spring aop�� a�� �ǹ� -> aop ����� ����ϰڴ�. aop:aspectj-autoproxy�� �˻�
public class DaoAdvice {
	private static final Logger logger = LoggerFactory.getLogger(DaoAdvice.class);
	
	//Join points ������� Before(�޼ҵ� ���� ��), After(�޼ҵ� ���� ��), AfterReturning(��ȯ�� ��),
	//AfterThrowing(���ܹ߻�), Around(�޼ҵ尡 ����Ǳ� �� ��)�� �ִ�.
	//pointcuts ����� DAO�� � �޼��� Aspect�� ������ ������ ����
	@Before("execution(* com.spring.shop.dao.*.*(..))")//Join points ���
	public void startLog(JoinPoint joinPoint){//JoinPoint�� ����Ǵ� �޼ҵ忡 �Ѿ���� ������ ������ �ִ�.
		//logger.info("method path : " + joinPoint.getSignature());	
	}//end

	@After("execution(* com.spring.shop.dao.*.*(..))")
	public void endLog(JoinPoint joinPoint){
		//logger.info("method path : " + joinPoint.getSignature());
	}//end
	
	//@Around�� ������ ������ AOP ������� ProceedingJoinPoint���� �޼ҵ� ������ ������ �� �ִ�.
	//@Around�� �� ��ȯ Ÿ������ pjp.proceed() �� Object�� ����ϰ� throws Throwable�� ����ؾ� �Ѵ�.
	@Around("execution(* com.spring.shop.dao.*.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable{
		//�ش� �޼ҵ尡 ����Ǵ� �ð�
		//logger.info("timeLog start");
		long startTime = System.currentTimeMillis(); //�޼ҵ� ���� �� �ð�
		Object result = pjp.proceed(); //�޼ҵ� ����
		long endTime = System.currentTimeMillis(); //�޼ҵ� ���� �� �ð�
		//logger.info("time Log end time:("+((endTime-startTime)/1000.0)+"��)");
		logger.info("time Log :("+((endTime-startTime)/1000.0)+"��)");
		return result;
	}//end
	
}//DaoAdvice class END
