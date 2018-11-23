import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect UmQuinze {
	declare precedence: UmQuinze, Simples;
	after(): initialization(WebHelpBar.new(WebView)) {}
}
