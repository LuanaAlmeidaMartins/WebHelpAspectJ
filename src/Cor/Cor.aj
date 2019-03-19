import javafx.scene.web.WebView;
 import WebHelp.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect Cor {
	after(): initialization(WebHelpBar.new(WebView, Canvas)) {
	}
}
