import javafx.scene.web.WebView;

public aspect Medio {
	
	declare precedence: Medio, Pequeno;

	after(): initialization(WebHelpBar.new(WebView)) {
	}
}
