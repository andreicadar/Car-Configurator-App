package model;

public class Paint {

	private int paintID;
	private String name;
	private String paintCode;
	private int price;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPaintCode() {
		return paintCode;
	}

	public void setPaintCode(String paintCode) {
		this.paintCode = paintCode;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPaintID() {
		return paintID;
	}

	public void setPaintID(int paintID) {
		this.paintID = paintID;
	}

	public Paint(String name, String paintCode, int price, int paintID) {
		super();
		this.name = name;
		this.paintCode = paintCode;
		this.price = price;
		this.paintID = paintID;
	}

}
