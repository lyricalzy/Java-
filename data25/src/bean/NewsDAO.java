package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class NewsDAO {
	String url = "jdbc:mysql://localhost:3708/virus?characterEncoding=utf8&serverTimezone=UTC";
	String user = "root";
	String password = "1234";
	private String sql;
	private PreparedStatement ps;
	private Connection con;

	public void insert(NewsDTO dto) {
		// 매개변수(파라메터, parameter), 지역변수
		try {
			// 1) 커넥터 설정
			Class.forName("com.mysql.jdbc.Driver");

			// 2) db연결
			con = DriverManager.getConnection(url, user, password);

			// 3) sql문 결정

			sql = "insert into news values (?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getAuthor());
			ps.setString(3, dto.getDate());
			ps.setString(4, dto.getCategorie());

			// 4) sql문 전송
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
