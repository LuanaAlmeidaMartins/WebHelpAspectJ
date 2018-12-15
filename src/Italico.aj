import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect Italico {
	
	declare precedence: Alinhamento, Sublinhado, Italico;
	after(): initialization(WebHelpBar.new(WebView, Canvas)) {}
	
}
