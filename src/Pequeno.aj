import javafx.scene.web.WebView;

public aspect Pequeno {

	after(): initialization(WebHelpBar.new(WebView)) {
	}
}