import javafx.scene.web.WebView;

public aspect OpenDyslexic{


	after(): initialization(WebHelpBar.new(WebView)) {
	}
}