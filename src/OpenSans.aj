import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect OpenSans {
	after(): initialization(WebHelpBar.new(WebView, Canvas)) {}
}