import javafx.scene.web.WebView;

public aspect Grande {
	
	declare precedence: Grande, Medio, Pequeno;

	after(): initialization(WebHelpBar.new(WebView)) {
	}
}