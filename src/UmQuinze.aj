import javafx.scene.web.WebView;
import br.ufla.webhelp.principal.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect UmQuinze {
	declare precedence: UmQuinze, Simples;
	after(): initialization(WebHelpBar.new(WebView, Canvas)) {}
}
