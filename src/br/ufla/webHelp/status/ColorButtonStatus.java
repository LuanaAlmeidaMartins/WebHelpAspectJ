package br.ufla.webhelpaspectj;

import javafx.scene.paint.Color;

public class ColorButtonStatus {

	private boolean status = false;
	private Color color;
	private String buttonID;
	
	public ColorButtonStatus(Color value, String id) {
		this.buttonID = id;
		setColor(value);
	}

	public void setStatusMenu() {
		this.status = !status;
		System.out.println(status+"menu");
	}

	public void setStatusSubMenu() {
		if (!this.status) {
			this.status = !status;
		}
	}
	
	public void setColor(Color value) {
		this.color = value;
	}
	
	public boolean isActive() {
		return status;
	}
	
	public String getButtonID(){
		return buttonID;
	}
	
	public Color getColor() {
		return color;
	}
}
