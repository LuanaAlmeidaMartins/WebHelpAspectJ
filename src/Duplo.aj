import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect Duplo{
	declare precedence: Duplo, UmMeio, UmQuinze, Simples;
	
	after(): initialization(WebHelpBar.new(WebView, Canvas)) {
	}
}