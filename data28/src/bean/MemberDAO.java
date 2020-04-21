package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {

	Connection con;
	DBConnectionMgr mgr;

	public MemberDAO() {
		mgr = DBConnectionMgr.getInstance();
	}

	public ArrayList<MemberDTO> list() {
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDTO dto2 = null;
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "select * from member";
			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println("3. sql문 결정 ok..");

			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();
			System.out.println("4. sql문 전송 ok..");

			while (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				dto2 = new MemberDTO();
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String tel = rs.getString(4);
				dto2.setId(id);
				dto2.setPw(pw);
				dto2.setName(name);
				dto2.setTel(tel);
				list.add(dto2);
			}
			mgr.freeConnection(con, ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 4.검색을 할 예정.
	public MemberDTO select(MemberDTO dto) {
		MemberDTO dto2 = null;
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "select * from member where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			System.out.println("3. sql문 결정 ok..");

			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();
			System.out.println("4. sql문 전송 ok..");

			if (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				System.out.println("검색 결과가 있어요.!!");
				dto2 = new MemberDTO();
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String tel = rs.getString(4);
				dto2.setId(id);
				dto2.setPw(pw);
				dto2.setName(name);
				dto2.setTel(tel);
			}
			mgr.freeConnection(con, ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto2;
	}

	public int delete(MemberDTO dto) {
		int result = 0;
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "delete from member where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());

			// 4) sql문 전송
			result = ps.executeUpdate();

			mgr.freeConnection(con, ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void update(MemberDTO dto) {
		try {
			con = mgr.getConnection();
			// 3) sql문 결정
			String sql = "update member set tel = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTel());
			ps.setString(2, dto.getId());

			// 4) sql문 전송
			ps.executeUpdate();

			mgr.freeConnection(con, ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 로그인 확인
	public boolean loginCheck(MemberDTO dto) {
		boolean result = false; // 로그인 실패한 경우
		try {
			con = mgr.getConnection();

			// 3) sql문 결정
			String sql = "select * from member where id = ? and pw = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());

			// 4) sql문 전송
			ResultSet rs = ps.executeQuery();

			if (rs.next()) { // 검색 결과가 있는지 체크해주는 메서드
				result = true;
			}
			mgr.freeConnection(con, ps);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
