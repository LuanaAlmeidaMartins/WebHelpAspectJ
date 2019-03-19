package Texto;

import java.io.File;

import org.w3c.dom.Document;
import WebHelp.WebHelpBar;
import WebHelp.ApplyButtonStatus;
import javafx.concurrent.Worker.State;
import javafx.event.EventHandler;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.control.Button;

public class SimpleButton {

	Button botao;
	private SimpleButtonStatus status;

	public SimpleButton(String a) {

		botao = new Button();
		botao.setId(a);
		status = new SimpleButtonStatus(botao.getId());

		File file = new File("icons/" + a + ".png");
		Image image = new Image(file.toURI().toString(), 28, 28, false, false);
		botao.setGraphic(new ImageView(image));
		System.out.println(botao.getId());

	}

	public void action() {
		WebHelpBar.webEngine.getLoadWorker().stateProperty().addListener((obs, oldValue, newValue) -> {
			if (newValue == State.SUCCEEDED) {
				Document doc = WebHelpBar.webEngine.getDocument();
				WebHelpBar.applyButtonStatus = new ApplyButtonStatus(doc);

				botao.setOnMouseClicked(new EventHandler<MouseEvent>() {
					@Override
					public void handle(MouseEvent event) {
						status.setStatus();
						applyStyle();
					}
				});
			}
		});
		WebHelpBar.hbox.getChildren().add(botao);
	}

	private void applyStyle() {
	}

	public SimpleButtonStatus getSimpleButton() {
		return status;
	}
}
