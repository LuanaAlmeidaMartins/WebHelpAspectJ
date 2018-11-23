import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect Negrito{
	declare precedence: Alinhamento, Sublinhado, Italico, Negrito;
	after(): initialization(WebHelpBar.new(WebView)) {}
}
