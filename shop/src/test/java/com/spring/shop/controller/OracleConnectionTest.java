package com.spring.shop.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class OracleConnectionTest {
	private static final Logger logger = LoggerFactory.getLogger(OracleConnectionTest.class);
	
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521/xe";
	private static final String USER = "system";
	private static final String PW = "oracle";
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);
		// try~with
		try (Connection conn = DriverManager.getConnection(URL, USER, PW)){
			logger.info("connected Oracle DB 11g/XE");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
