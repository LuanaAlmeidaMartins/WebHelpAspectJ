import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect Sublinhado{
	after(): initialization(WebHelpBar.new(WebView)) {}
}