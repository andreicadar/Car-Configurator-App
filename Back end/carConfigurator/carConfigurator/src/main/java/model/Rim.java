package model;

public class Rim {

	private int rimID;
	private String name;
	private String pathPoza;
	private int diameter;
	private int price;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPathPoza() {
		return pathPoza;
	}

	public void setPathPoza(String pathPoza) {
		this.pathPoza = pathPoza;
	}

	public int getDiameter() {
		return diameter;
	}

	public void setDiameter(int diameter) {
		this.diameter = diameter;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRimID() {
		return rimID;
	}

	public void setRimID(int rimID) {
		this.rimID = rimID;
	}

	public Rim(String name, String pathPoza, int diameter, int price, int rimID) {
		super();
		this.name = name;
		this.pathPoza = pathPoza;
		this.diameter = diameter;
		this.price = price;
		this.rimID = rimID;
	}

}
