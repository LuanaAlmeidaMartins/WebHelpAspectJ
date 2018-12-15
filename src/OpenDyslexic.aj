import javafx.scene.web.WebView;

import javafx.scene.canvas.Canvas;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect OpenDyslexic{
	after(): initialization(WebHelpBar.new(WebView, Canvas)) {}
}