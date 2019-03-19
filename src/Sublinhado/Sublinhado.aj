import javafx.scene.web.WebView;
import WebHelp.WebHelpBar;
import Texto.SimpleButton;
import javafx.scene.canvas.Canvas;

public aspect Sublinhado{
	final String featureName = "Sublinhado";

	after(): initialization(WebHelpBar.new(WebView, Canvas)) {
		SimpleButton a = new SimpleButton (featureName);
		a.action () ;
	}
	
	after(SimpleButton handle): target(handle) && call(private void applyStyle(..)) {
		if(handle.getSimpleButton().getButtonID().equals(featureName)) {
			WebHelpBar.applyButtonStatus.setFontStyle(handle.getSimpleButton().getStyle(),
					handle.getSimpleButton().isActive());
		}
	}
}