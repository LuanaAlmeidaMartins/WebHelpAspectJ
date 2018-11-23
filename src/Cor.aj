import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect Cor {
	after(): initialization(WebHelpBar.new(WebView)) {
	}
}
