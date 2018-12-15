package br.ufla.webhelpaspectj;

import javafx.scene.paint.Color;

public class ColorButtonStatus {

	private boolean status = false;
	double blue = 0.3, red = 1.0, green = 1.0;
	private Color color = Color.YELLOW;
	private String buttonID;

	public boolean isActive() {
		return status;
	}
	
	public String getButtonID(){
		return buttonID;
	}
	
	public void setButtonID(String id) {
		System.out.println("aaaaa");
		this.buttonID = id;
	}

	public void setStatusMenu() {
		this.status = !status;
	}

	public void setStatusSubMenu() {
		if (!this.status) {
			this.status = !status;
		}
	}

	public String getStringToRemove() {
		return null;
	}

	public void setForeground(Color value) {
		this.blue = value.getBlue();
		this.green = value.getGreen();
		this.red = value.getRed();
		this.color  = value;
	}
	
	public Color getColor() {
		return color;
	}

	public double getBlue() {
		return blue;
	}

	public double getRed() {
		return red;
	}

	public double getGreen() {
		return green;
	}
}
