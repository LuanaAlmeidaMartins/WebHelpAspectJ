import javafx.scene.web.WebView;

public aspect UmMeio {
	
	declare precedence: UmMeio, UmQuinze, Simples; 
	after(): initialization(WebHelpBar.new(WebView)) {
	}

}
