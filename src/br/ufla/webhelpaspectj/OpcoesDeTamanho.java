package br.ufla.webhelpaspectj;

import java.io.File;
import java.util.ArrayList;

import org.w3c.dom.Document;

import javafx.concurrent.Worker.State;
import javafx.event.EventHandler;
import javafx.scene.control.RadioMenuItem;
import javafx.scene.control.SplitMenuButton;
import javafx.scene.control.ToggleGroup;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;

public class OpcoesDeTamanho {
	private ArrayList<RadioMenuItem> item = new ArrayList<>();
	private SplitMenuButton botao;
	private StatusRestricao statusRestricao = new StatusRestricao();
	private String style;
	private boolean actived;

	public OpcoesDeTamanho(String a) {
		botao = new SplitMenuButton();
		botao.setId(a);

		File file = new File("icons/" + a + ".png");
		Image image = new Image(file.toURI().toString(), 28, 28, false, false);
		botao.setGraphic(new ImageView(image));

		WebHelpBar.hbox.getChildren().add(botao);
	}

	public void opcao(String a) {
		RadioMenuItem aitem = new RadioMenuItem(a);
		aitem.setId(botao.getId() + "." + a);
		item.add(aitem);

		ToggleGroup charSpacingGroup = new ToggleGroup();
		charSpacingGroup.getToggles().add(aitem);
		botao.getItems().add(aitem);
	}

	public void actionButton() {
		WebHelpBar.webEngine.getLoadWorker().stateProperty().addListener((obs, oldValue, newValue) -> {
			if (newValue == State.SUCCEEDED) {
				Document doc = WebHelpBar.webEngine.getDocument();
				WebHelpBar.applyButtonStatus = new ApplyButtonStatus(doc);

				botao.setOnMouseClicked(new EventHandler<MouseEvent>() {
					@Override
					public void handle(MouseEvent event) {
						statusRestricao.setCharSpacing();
						teste(statusRestricao.getCharSpacing(botao.getId()),
								statusRestricao.isCharSpacing());
					}

				});

				for (int i = 0; i < item.size(); i++) {
					int j = i;
					item.get(i).setOnAction(actionEvent -> {
						statusRestricao.setOptionCharSpacing();
						teste(statusRestricao.getCharSpacing(item.get(j).getId()),
								statusRestricao.isCharSpacing());
					});
				}
			}
		});
	}
	
	public String getID() {
		return style;
	}
	public boolean getActived() {
		return actived;
	}
	
	private void teste(String style, boolean actived) {
		this.style = style;
		this.actived = actived;
	}
	
	public String getBotaoID(){
		return botao.getId();
	}
}
