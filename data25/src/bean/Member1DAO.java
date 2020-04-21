package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Member1DAO {
	String url = "jdbc:mysql://localhost:3708/virus";
	String user = "root";
	String password = "1234";

	public void insert(Member1DTO dto) {
		// 매개변수(파라메터, parameter), 지역변수
		try {
			// 1) 커넥터 설정
			Class.forName("com.mysql.jdbc.Driver");

			// 2) db연결
			Connection con = DriverManager.getConnection(url, user, password);

			// 3) sql문 결정

			String sql = "insert into member1 values (?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getAge());
			ps.setString(3, dto.getCompany());
			ps.setString(4, dto.getTel());

			// 4) sql문 전송
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
