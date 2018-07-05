import javafx.scene.web.WebView;

public aspect UmQuinze {

	declare precedence: UmQuinze, Simples;
	after(): initialization(WebHelpBar.new(WebView)) {
	}
}
