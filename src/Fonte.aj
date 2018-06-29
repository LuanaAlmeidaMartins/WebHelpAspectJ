import javafx.scene.web.WebView;

public aspect Fonte {

	after(): initialization(WebHelpBar.new(WebView)) {
	}
}
