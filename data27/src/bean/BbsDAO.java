package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	String url = "jdbc:mysql://localhost:3708/virus";
	String user = "root";
	String password = "1234";

	public ArrayList<BbsDTO> list() {
		ArrayList<BbsDTO> list = new ArrayList<>();
		BbsDTO dto2 = null;
		try {
			// 1) 커넥터 설정
			Class.forName("com.mysql.jdbc.Driver");

			// 2) db연결
			Connection con = DriverManager.getConnection(url, user, password);

			// 3) sql문 결정
			String sql = "select * from bbs";
			PreparedStatement ps = con.prepareStatement(sql);

			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();

			while (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				dto2 = new BbsDTO();
				String no = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String writer = rs.getString(4);
				dto2.setNo(no);
				dto2.setTitle(title);
				dto2.setContent(content);
				dto2.setWriter(writer);
				list.add(dto2);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 4.검색을 할 예정.
	public BbsDTO select(BbsDTO dto) {
		BbsDTO dto2 = null;
		try {
			// 1) 커넥터 설정
			Class.forName("com.mysql.jdbc.Driver");

			// 2) db연결
			Connection con = DriverManager.getConnection(url, user, password);

			// 3) sql문 결정
			String sql = "select * from bbs where no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getNo());

			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();

			if (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				dto2 = new BbsDTO();
				String no = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String writer = rs.getString(4);
				dto2.setNo(no);
				dto2.setTitle(title);
				dto2.setContent(content);
				dto2.setWriter(writer);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto2;
	}

	/*
	 * public void update(MemberDTO dto) { try { // 1) 커넥터 설정
	 * Class.forName("com.mysql.jdbc.Driver");
	 * 
	 * // 2) db연결 Connection con = DriverManager.getConnection(url, user, password);
	 * 
	 * // 3) sql문 결정 String sql = "update member set tel = ? where id = ?";
	 * PreparedStatement ps = con.prepareStatement(sql); ps.setString(1,
	 * dto.getTel()); ps.setString(2, dto.getId());
	 * 
	 * // 4) sql문 전송 ps.executeUpdate();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } }
	 */

}
