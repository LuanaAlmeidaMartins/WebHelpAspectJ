import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect Medio {
	declare precedence: Medio, Pequeno;
	after(): initialization(WebHelpBar.new(WebView)) {}
}
