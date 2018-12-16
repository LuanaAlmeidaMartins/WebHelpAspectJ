import br.ufla.webhelpaspectj.ColorButton;
import br.ufla.webhelpaspectj.WebHelpBar;
import javafx.scene.canvas.Canvas;
import javafx.scene.web.WebView;

public aspect Background {
	String featureName = "Background";
	ColorButton button = new ColorButton(featureName);
	
	after(): initialization(WebHelpBar.new(WebView, Canvas)) {
	}
	
	pointcut Cor(): within(Cor);

	pointcut ConstrutorDeCor(): Cor() && execution(new(..));

	after(): ConstrutorDeCor(){
		button.actionButton();
	}
	
	after(ColorButton handle): target(handle) && call(private void setFeatureStyle(..)) {
		if(handle.getColorButtonStatus().getButtonID().equals(featureName)) {
			String tagStyle = "background: #";
			String colorName = button.converterColor(handle.getColorButtonStatus().getColor());
			WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle);
			WebHelpBar.applyButtonStatus.setFontStyle(tagStyle + colorName + ";", 
					handle.getColorButtonStatus().isActive());
			WebHelpBar.applyButtonStatus.applyStyle();
		}
	}
}