import javafx.scene.web.WebView;

public aspect Medio {
	after(): initialization(WebHelpBar.new(WebView)) {
	}
}
