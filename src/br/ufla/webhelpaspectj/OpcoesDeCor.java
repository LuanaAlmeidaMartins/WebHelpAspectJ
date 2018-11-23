package br.ufla.webhelpaspectj;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.w3c.dom.Document;

import javafx.concurrent.Worker.State;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.ColorPicker;
import javafx.scene.input.MouseEvent;

public class OpcoesDeCor {
	Properties property = new Properties();
	private ColorPicker colorPicker;

	public OpcoesDeCor(String a) {
		colorPicker = new ColorPicker();
		colorPicker.setId(a);
		colorPicker.setPrefHeight(38);
		colorPicker.setPrefWidth(68);
		colorPicker.getStyleClass().addAll("color-picker", "split-button");
		WebHelpBar.hbox.getChildren().add(colorPicker);
	}

	public void action() {
		LetterColorStatus letterColorStatus = new LetterColorStatus();
		ColorConverter color = new ColorConverter();

		WebHelpBar.webEngine.getLoadWorker().stateProperty().addListener((obs, oldValue, newValue) -> {
			if (newValue == State.SUCCEEDED) {
				Document doc = WebHelpBar.webEngine.getDocument();
				WebHelpBar.applyButtonStatus = new ApplyButtonStatus(doc);

				colorPicker.addEventHandler(MouseEvent.MOUSE_CLICKED, new EventHandler<MouseEvent>() {

					@Override
					public void handle(MouseEvent e) {

						if ((e.getSceneX() >= 570 && e.getSceneX() <= 612)
								&& (e.getSceneY() >= 50 && e.getSceneY() <= 82)) {
							colorPicker.hide();
							letterColorStatus.setColor();
							WebHelpBar.applyButtonStatus.setFontStyle(letterColorStatus.getColor(),
									letterColorStatus.isColor());
						}
					}
				});

				colorPicker.setOnAction((ActionEvent t) -> {
					letterColorStatus.setOptionColorSpacing();
					WebHelpBar.applyButtonStatus.removeFontStyle(letterColorStatus.getRemoveOption());
					letterColorStatus.setColorName(color.converterColor(colorPicker.getValue()));
					WebHelpBar.applyButtonStatus.setFontStyle(letterColorStatus.getColor(),
							letterColorStatus.isColor());
				});
			}
		});
	}

	public String getStyle(String type) {
		try {
			property.load(new FileInputStream(/*
												 * System.getProperty("user.dir") + "/style.txt"
												 */"style.txt"));
		} catch (FileNotFoundException e) {
			System.out.println("Arquivo style.txt nao encontrado");
		} catch (IOException e) {
			System.out.println("IO");
		}
		return property.getProperty(type);
	}
}
