import javafx.scene.web.WebView;

public aspect Simples{
	
after(): initialization(WebHelpBar.new(WebView)) {
	}
}