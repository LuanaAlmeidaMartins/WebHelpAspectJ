package br.ufla.webhelp.status;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class SimpleButtonStatus {
	private boolean status = false;
	private String id;
	private Properties property = new Properties();
	
	public SimpleButtonStatus(String id) {
		this.id = id;
	}

	public String SimpleButtonID() {
		return id;
	}
	
	public void setStatus() {
		this.status = !status;
	}

	public boolean isActive() {
		return status;
	}

	public String getStyle(String id) {
		try {
			property.load(new FileInputStream(/*
												 * System.getProperty("user.dir") + "/style.txt"
												 */"style.txt"));
		} catch (FileNotFoundException e) {
			System.out.println("Arquivo style.txt nao encontrado");
		} catch (IOException e) {
			System.out.println("IO");
		}
		return property.getProperty(id);
	}
}