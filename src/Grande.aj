import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect Grande {
	declare precedence: Grande, Medio, Pequeno;
	after(): initialization(WebHelpBar.new(WebView)) {}
}