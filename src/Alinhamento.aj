import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect Alinhamento{
	declare precedence: Alinhamento, Sublinhado;
	after(): initialization(WebHelpBar.new(WebView)) {}
}