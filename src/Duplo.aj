import javafx.scene.web.WebView;

public aspect Duplo{
	declare precedence: Duplo, UmMeio, UmQuinze, Simples;
	
	after(): initialization(WebHelpBar.new(WebView)) {
	}
}