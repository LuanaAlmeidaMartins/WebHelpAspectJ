import javafx.scene.web.WebView;

public aspect Caracteres {

	after(): initialization(WebHelpBar.new(WebView)) {
	}
}
