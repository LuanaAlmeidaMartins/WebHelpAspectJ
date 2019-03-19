package WebHelp;

import javafx.scene.canvas.Canvas;
import javafx.scene.layout.HBox;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;

public class WebHelpBar extends HBox {
	public static HBox hbox;
	public static WebEngine webEngine;
	public static ApplyButtonStatus applyButtonStatus;
	public static Canvas overlay;

	public WebHelpBar(WebView web, Canvas overlay) {
		WebHelpBar.webEngine = web.getEngine();
		WebHelpBar.overlay = overlay;
		hbox = new HBox();
		this.getChildren().add(hbox);
	}

}
