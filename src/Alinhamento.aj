import javafx.scene.web.WebView;
import br.ufla.webhelp.principal.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect Alinhamento {
	declare precedence: Alinhamento, Sublinhado;

	after(): initialization(WebHelpBar.new(WebView, Canvas)) {
	}
}