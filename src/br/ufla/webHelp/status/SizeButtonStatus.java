package br.ufla.webhelpaspectj;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class SizeButtonStatus {

	private boolean status = false;
	private Properties property = new Properties();
	private String buttonID, subButtonID;
	
	public SizeButtonStatus(String id) {
		this.buttonID = id;
	}

	public void setMenu() {
		this.status = !status;
	}

	public void setSubMenu() {
		if (this.status == false) {
			this.status = !status;
		}
	}

	public boolean isActive() {
		return status;
	}

	public String getCharSpacing() {
		try {
			property.load(new FileInputStream(/*
												 * System.getProperty("user.dir") + "/style.txt"
												 */"style.txt"));
		} catch (FileNotFoundException e) {
			System.out.println("Arquivo style.txt nao encontrado");
		} catch (IOException e) {
			System.out.println("IO");
		}
		return property.getProperty(subButtonID);
	}

	public void setButtonID(String id) {
		this.subButtonID= id;
	}
	
	public String getButtonID() {
		return buttonID;
	}
}
