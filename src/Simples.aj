import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect Simples{
after(): initialization(WebHelpBar.new(WebView)) {}
}