package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//db처리 전담 클래스
public class ProductDAO {
	Connection con;
	DBConnectionMgr mgr;

	public ProductDAO() {
		mgr = DBConnectionMgr.getInstance();
	}
	
	public ProductDTO one(ProductDTO dto) throws Exception {
		con = mgr.getConnection();
		
		// 3.SQL문 결정/생성
		String sql = "select * from product22 where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());

		// 4.DB로 SQL문 전송
		ResultSet rs = ps.executeQuery();
		ProductDTO dto2 = null;
		
		while (rs.next()) { 
			//결과로 가지고 온 테이블의 행을 한줄씩 내려가서 있는지 체크
			String id = rs.getString(1); //id 컬럼
			String title = rs.getString(2);
			String content = rs.getString(3);
			String price = rs.getString(4);
			String img = rs.getString(5);
			//dao java코드 <--- db table
			//table의 결과값 행 1개당(rdb,관계형 db) 
			//dto 1개로 mapping(object)
			//ORM
			//변수의 선언의 위치가 변수의 생존범위!
			dto2 = new ProductDTO();
			dto2.setId(id);
			dto2.setTitle(title);
			dto2.setContent(content);
			dto2.setPrice(price);
			dto2.setImg(img);
		}
		mgr.freeConnection(con, ps, rs);
		
		return dto2;
	}
	public ArrayList<ProductDTO> list() throws Exception {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		con = mgr.getConnection();
		
		// 3.SQL문 결정/생성
		String sql = "select * from product22";
		PreparedStatement ps = con.prepareStatement(sql);
		
		// 4.DB로 SQL문 전송
		ResultSet rs = ps.executeQuery();
		while (rs.next()) { 
			//결과로 가지고 온 테이블의 행을 한줄씩 내려가서 있는지 체크
			String id = rs.getString(1); //id 컬럼
			String title = rs.getString(2);
			String content = rs.getString(3);
			String price = rs.getString(4);
			String img = rs.getString(5);
			//dao java코드 <--- db table
			//table의 결과값 행 1개당(rdb,관계형 db) 
			//dto 1개로 mapping(object)
			//ORM
			ProductDTO dto = new ProductDTO();
			dto.setId(id);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setPrice(price);
			dto.setImg(img);
			list.add(dto);
		}
		mgr.freeConnection(con, ps, rs);
		return list;
	}

	
}
