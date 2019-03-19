import Cor.ColorButton;
import WebHelp.WebHelpBar;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;
import javafx.scene.web.WebView;
import javafx.scene.canvas.Canvas;

public aspect Overlay {
	
	String featureName = "Overlay";
	
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
			WebHelpBar.overlay.setVisible(true);
			GraphicsContext gc = WebHelpBar.overlay.getGraphicsContext2D();
			
			WebHelpBar.overlay.setOpacity(0.5);

			if (handle.getColorButtonStatus().isActive() == true) {
				gc.setFill(Color.color(handle.getColorButtonStatus().getColor().getRed(), 
						handle.getColorButtonStatus().getColor().getGreen(), 
						handle.getColorButtonStatus().getColor().getBlue()));
				gc.fillRect(0, -20, 1600, 700);
			} else {
				gc.clearRect(0, -20, 1600, 700);
			}
			gc.fill();
		}
	}
	
	
}