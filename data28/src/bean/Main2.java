package bean;

public class Main2 {

	public static void main(String[] args) {
		ConManager m = ConManager.getInstance();
		System.out.println("주소는: " +m);
		System.out.println(m.getElement(1));
	}

}
