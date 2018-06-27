import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;
import javafx.stage.Stage;

import org.w3c.dom.Document;

import javafx.concurrent.Worker.State;
import javafx.event.EventHandler;
import javafx.scene.control.Button;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.web.WebView;


public aspect Alinhamento  extends HBox{

	after(): initialization(WebHelpBar.new(WebView)) {
//		System.out.print(" alinha");
//		Button align = new Button();
////		align.setText("Alinha");
////		align.setId("align");
////		WebHelpBar.hbox.getChildren().add(align);
	}
}
