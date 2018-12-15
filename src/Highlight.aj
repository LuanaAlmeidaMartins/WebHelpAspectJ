import br.ufla.webhelpaspectj.ColorButton;
import br.ufla.webhelpaspectj.WebHelpBar;
import javafx.scene.web.WebView;
import javafx.scene.canvas.Canvas;

public aspect Highlight {
	String featureName = "Highlight";
	ColorButton button = new ColorButton(featureName);
	
	after(): initialization(WebHelpBar.new(WebView, Canvas)) {
	}
	
	pointcut Cor(): within(Cor);

	pointcut ConstrutorDeCor(): Cor() && execution(new(..));

	after(): ConstrutorDeCor(){
		button.actionButton();
	}
	
	after(ColorButton handle): target(handle) && call(private void setColor(..)) {
		
		if(handle.getColorButtonStatus().getButtonID().equals(featureName)) {
			WebHelpBar.overlay.setVisible(false);
			
			String colorName = button.converterColor(handle.getColorButtonStatus().getColor());
			WebHelpBar.webEngine.executeScript("var selection = window.getSelection();"
					+ "var range = selection.getRangeAt(0);" + "var newNode = document.createElement(\"span\");"
					+ "newNode.setAttribute(\"style\", \"background-color: #" + colorName + ";\");"
					+ "range.surroundContents(newNode); ");
		}
	}
	
}