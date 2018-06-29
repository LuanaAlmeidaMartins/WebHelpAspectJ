import javafx.scene.web.WebView;

public aspect Sublinhado{

	after(): initialization(WebHelpBar.new(WebView)) {
	}
}