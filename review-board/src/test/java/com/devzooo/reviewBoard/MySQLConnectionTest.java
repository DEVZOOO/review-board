package com.devzooo.reviewBoard;

import java.sql.*;

import org.junit.Test;

public class MySQLConnectionTest {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/db0";	// 보통 3306
	private static final String USER = "root";	// 유저
	private static final String PW = "1234";	// 비번
	
	@Test
	public void connect() throws Exception {
		Class.forName(DRIVER);
		try {
			Connection conn = DriverManager.getConnection(URL, USER, PW);
			System.out.println("db연동 성공");
			System.out.println(conn);
		}
		catch (Exception e) {
			System.out.println("db연동 실패");
			e.printStackTrace();
		}
	}
}
