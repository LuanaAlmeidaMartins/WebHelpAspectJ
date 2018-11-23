import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect OpenSans {
	after(): initialization(WebHelpBar.new(WebView)) {}
}