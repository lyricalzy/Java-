package bean;

public class BasketDTO {
	private String id; // 제품의 id
	private String logid; // 주문한 사람의 id
	private int price; // 제품 가격
	private int count; // 주문수량

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLogid() {
		return logid;
	}

	public void setLogid(String logid) {
		this.logid = logid;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "BasketDTO [id=" + id + ", logid=" + logid + ", price=" + price + ", count=" + count + "]";
	}
	
}
