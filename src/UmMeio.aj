import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect UmMeio {
	declare precedence: UmMeio, UmQuinze, Simples; 
	after(): initialization(WebHelpBar.new(WebView)) {}
}
