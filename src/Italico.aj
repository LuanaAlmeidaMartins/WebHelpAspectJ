import javafx.scene.web.WebView;

public aspect Italico {
	
	declare precedence: Alinhamento, Sublinhado, Italico;

	after(): initialization(WebHelpBar.new(WebView)) {
	}
}
