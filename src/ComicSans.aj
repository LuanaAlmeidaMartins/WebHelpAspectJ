import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect ComicSans {
	after(): initialization(WebHelpBar.new(WebView)) {
	}
}