
import javafx.scene.web.WebView;

public aspect Alinhamento{

	declare precedence: Alinhamento, Sublinhado;
		
	after(): initialization(WebHelpBar.new(WebView)) {
	}
}
