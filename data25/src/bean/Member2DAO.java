package bean;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import java.sql.Connection;

public class Member2DAO {
	String url = "jdbc:mysql://localhost:3708/virus";
	String user = "root";
	String password = "1234";
	private String sql;
	private PreparedStatement ps;
	private Connection con;

	public void insert(Member2DTO dto) {
		// 매개변수(파라메터, parameter), 지역변수
		try {
			// 1) 커넥터 설정
			Class.forName("com.mysql.jdbc.Driver");

			// 2) db연결
			con = DriverManager.getConnection(url, user, password);

			// 3) sql문 결정

			sql = "insert into member22 values (?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getFirstName());
			ps.setString(3, dto.getLastName());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getGender());
			ps.setString(6, dto.getIpAddress());

			// 4) sql문 전송
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
