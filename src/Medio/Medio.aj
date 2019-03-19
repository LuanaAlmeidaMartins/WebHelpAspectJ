import javafx.scene.web.WebView;
import WebHelp.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect Medio {
	declare precedence: Medio, Pequeno;

	after(): initialization(WebHelpBar.new(WebView, Canvas)) {
	}
}
