package model;

public class Engine {
	private int engineID;
	private String name;
	private double consum;
	private int price;
	private int putere;
	private int torque;
	private int capacitate;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getConsum() {
		return consum;
	}

	public void setConsum(double consum) {
		this.consum = consum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPutere() {
		return putere;
	}

	public void setPutere(int putere) {
		this.putere = putere;
	}

	public int getTorque() {
		return torque;
	}

	public void setTorque(int torque) {
		this.torque = torque;
	}

	public int getCapacitate() {
		return capacitate;
	}

	public void setCapacitate(int capacitate) {
		this.capacitate = capacitate;
	}

	public int getEngineID() {
		return engineID;
	}

	public void setEngineID(int engineID) {
		this.engineID = engineID;
	}

	public Engine(String name, double consum, int price, int putere, int torque, int capacitate, int engineID) {
		super();
		this.name = name;
		this.consum = consum;
		this.price = price;
		this.putere = putere;
		this.torque = torque;
		this.capacitate = capacitate;
		this.engineID = engineID;
	}

}
