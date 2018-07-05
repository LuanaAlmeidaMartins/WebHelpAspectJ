import javafx.scene.web.WebView;

public aspect Georgia {

	after(): initialization(WebHelpBar.new(WebView)) {
	}
}