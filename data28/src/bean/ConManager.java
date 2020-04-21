package bean;

import java.util.ArrayList;

public class ConManager {
	static ArrayList<String> list = null;
	static ConManager con = null;

	// 생성자 메소드 호출 막아버림
	// 외부에서 객체 생성 불가
	private ConManager() { 
		list = new ArrayList<String>();
		list.add("admin");
		list.add("root");
		list.add("manager");
	}

	public static ConManager getInstance() {
		if (con == null) {
			con = new ConManager();
		}
		return con;
	}

	public String getElement(int i) {
		return list.get(i);
	}
}
