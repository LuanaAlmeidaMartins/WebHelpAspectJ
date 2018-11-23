import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect Georgia {
	after(): initialization(WebHelpBar.new(WebView)) {}
}