import javafx.scene.web.WebView;
public aspect Cor {
	after(): initialization(WebHelpBar.new(WebView)) {
	}
}
