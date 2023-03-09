package model;

public class ConfiguratedCar {
	private Engine engine;
	private Paint paint;
	private Rim rim;

	public Engine getEngine() {
		return engine;
	}

	public void setEngine(Engine engine) {
		this.engine = engine;
	}

	public Paint getPaint() {
		return paint;
	}

	public void setPaint(Paint paint) {
		this.paint = paint;
	}

	public Rim getRim() {
		return rim;
	}

	public void setRim(Rim rim) {
		this.rim = rim;
	}

	public ConfiguratedCar(Engine engine, Paint paint, Rim rim) {
		super();
		this.engine = engine;
		this.paint = paint;
		this.rim = rim;
	}

	int getTotalPrice() {
		return engine.getPrice() + paint.getPrice() + rim.getPrice();
	}

}
