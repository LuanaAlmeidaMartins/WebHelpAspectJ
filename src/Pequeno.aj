import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect Pequeno {
	after(): initialization(WebHelpBar.new(WebView)) {}
}