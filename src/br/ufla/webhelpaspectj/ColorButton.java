package br.ufla.webhelpaspectj;

import javafx.concurrent.Worker.State;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.ColorPicker;
import javafx.scene.input.MouseEvent;
import javafx.scene.paint.Color;
import org.w3c.dom.Document;

public class ColorButton {
	private ColorPicker colorPicker;
	private ColorButtonStatus status;

	public ColorButton(String nome) {
		colorPicker = new ColorPicker();
		colorPicker.setId(nome);
		
		colorPicker.setPrefHeight(38);
		colorPicker.setPrefWidth(68);
		colorPicker.getStyleClass().addAll("color-picker", "split-button");

		colorPicker.setStyle("-fx-background-image: url('/" + colorPicker.getId()
				+ ".png'); -fx-background-size: 28 28; "
				+ "-fx-background-position: 10px; -fx-background-repeat: no-repeat; "
				+ "-fx-color-label-visible: false; -fx-color-rect-width: 0px; " + "-fx-color-rect-height: 0px;");
		
		WebHelpBar.hbox.getChildren().add(colorPicker);
	}

	public void actionButton() {
		System.out.println("action");

		WebHelpBar.webEngine.getLoadWorker().stateProperty().addListener((obs, oldValue, newValue) -> {
			status = new ColorButtonStatus();
			status.setButtonID(colorPicker.getId());
			
			if (newValue == State.SUCCEEDED) {
				System.out.println("State.SUCCEDED");
				Document doc = WebHelpBar.webEngine.getDocument();
				WebHelpBar.applyButtonStatus = new ApplyButtonStatus(doc);

				colorPicker.addEventHandler(MouseEvent.MOUSE_CLICKED, new EventHandler<MouseEvent>() {
					@Override
					public void handle(MouseEvent e) {
						if (!e.getPickResult().toString().contains("arrow-button")) {
							colorPicker.hide();
							status.setStatusMenu();
							setColor();
						}
					}
				});
				colorPicker.setOnAction((ActionEvent t) -> {
					status.setStatusSubMenu();
					status.setForeground(colorPicker.getValue());
					setColor();
				});
			}
		});
	}

	public String converterColor(Color color) {
		return colorChanelToHex(color.getRed()) + colorChanelToHex(color.getGreen()) + colorChanelToHex(color.getBlue())
				+ colorChanelToHex(color.getOpacity());
	}

	private String colorChanelToHex(double chanelValue) {
		String rtn;
		rtn = Integer.toHexString((int) Math.min(Math.round(chanelValue * 255), 255));
		if (rtn.length() == 1) {
			rtn = "0" + rtn;
		}
		return rtn;
	}
	
	public ColorButtonStatus getColorButtonStatus() {
		return status;
	}
	
	private void setColor() {
		
	}
}

