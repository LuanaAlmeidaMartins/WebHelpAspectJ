import javafx.scene.web.WebView;
import br.ufla.webhelp.principal.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect OpenDyslexic{
	after(): initialization(WebHelpBar.new(WebView, Canvas)) {}
}