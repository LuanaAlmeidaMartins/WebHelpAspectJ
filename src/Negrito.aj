import javafx.scene.web.WebView;

public aspect Negrito{

	declare precedence: Alinhamento, Sublinhado, Italico, Negrito;

	after(): initialization(WebHelpBar.new(WebView)) {
	}
}
