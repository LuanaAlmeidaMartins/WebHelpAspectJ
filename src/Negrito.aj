import javafx.scene.web.WebView;
import br.ufla.webhelp.principal.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect Negrito{
	declare precedence: Alinhamento, Sublinhado, Italico, Negrito;
	after(): initialization(WebHelpBar.new(WebView, Canvas)) {}
}
