import javafx.scene.web.WebView;

public aspect OpenSans {


	after(): initialization(WebHelpBar.new(WebView)) {
	}
}