import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect Italico {
	declare precedence: Alinhamento, Sublinhado, Italico;
	after(): initialization(WebHelpBar.new(WebView)) {}
}
