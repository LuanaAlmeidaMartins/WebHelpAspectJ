import javafx.scene.web.WebView;

public aspect ComicSans {

	
	after(): initialization(WebHelpBar.new(WebView)) {
	}
}