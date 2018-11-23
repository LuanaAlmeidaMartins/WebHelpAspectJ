import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect OpenDyslexic{
	after(): initialization(WebHelpBar.new(WebView)) {}
}