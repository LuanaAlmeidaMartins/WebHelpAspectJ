import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;
import javafx.scene.web.WebView;
import Tamanho.SizeButton;
import WebHelp.WebHelpBar;

public aspect Regua {

	final String featureName = "Regua";
	SizeButton opcaoTamanho = new SizeButton(featureName);

	after(): initialization(WebHelpBar.new(WebView, Canvas)) {
	}

	pointcut Tamanho(): within(Pequeno) ||
						within(Medio) ||
						within(Grande) ||
						within(Enorme);

	pointcut ConstrutorDeTamanho(): Tamanho() && execution(new(..));

	after(): ConstrutorDeTamanho(){
		String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
		opcaoTamanho.opcao(sep[0]);
		opcaoTamanho.actionButton();
	}

	after(SizeButton handle): target(handle) && call(private void teste(..)) {
		if (handle.getSizeButtonStatus().getButtonID().equals(featureName)) {
			WebHelpBar.overlay.setVisible(true);
			GraphicsContext gc = WebHelpBar.overlay.getGraphicsContext2D();
			double num = Double.parseDouble(handle.getSizeButtonStatus().getCharSpacing());

			WebHelpBar.overlay.setOpacity(0.8);
			gc.setFill(Color.color(0.0, 0.0, 0.0));

			if (handle.getSizeButtonStatus().isActive() == true) {
				gc.fillRect(0, -20, 1600, 700);
				gc.clearRect(0, 80, 1600, num);
			} else {
				gc.clearRect(0, -20, 1600, 700);
			}
			gc.fill();
		}
	}
}