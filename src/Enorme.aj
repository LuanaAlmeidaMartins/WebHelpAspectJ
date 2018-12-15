import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect Enorme {
	declare precedence: Enorme, Grande, Medio, Pequeno;

	after(): initialization(WebHelpBar.new(WebView, Canvas)) {
	}
}