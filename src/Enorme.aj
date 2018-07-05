import javafx.scene.web.WebView;

public aspect Enorme {
	
	declare precedence: Enorme, Grande, Medio, Pequeno; 

	after(): initialization(WebHelpBar.new(WebView)) {
	}
}