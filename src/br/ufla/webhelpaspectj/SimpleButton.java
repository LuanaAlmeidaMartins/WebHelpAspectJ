package br.ufla.webhelpaspectj;

import java.io.File;

import org.w3c.dom.Document;

import javafx.concurrent.Worker.State;
import javafx.event.EventHandler;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;

public class SimpleButton {
	Button button;
	SimpleButtonStatus status;

	public SimpleButton(String a) {
		button = new Button();
		button.setId(a);
		File file = new File("icons/" + a + ".png");
		Image image = new Image(file.toURI().toString(), 28, 28, false, false);
		button.setGraphic(new ImageView(image));
	}

	public void actionButton() {
		status = new SimpleButtonStatus(button.getId());		
		WebHelpBar.webEngine.getLoadWorker().stateProperty().addListener((obs, oldValue, newValue) -> {
			if (newValue == State.SUCCEEDED) {
				Document doc = WebHelpBar.webEngine.getDocument();
				WebHelpBar.applyButtonStatus = new ApplyButtonStatus(doc);
				button.setOnMouseClicked(new EventHandler<MouseEvent>() {
					@Override
					public void handle(MouseEvent event) {
						status.setStatus();
						applyStyle();
					}
				});
			}
		});
		WebHelpBar.hbox.getChildren().add(button);
	}

	private void applyStyle() {
	}
	
	public SimpleButtonStatus getSimpleButton() {
		return status;
	}
}