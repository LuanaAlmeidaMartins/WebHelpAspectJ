import javafx.scene.web.WebView;
import Tamanho.SizeButton;
import WebHelp.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect Paragrafos {
	final String featureName = "Paragrafos";
	SizeButton opcaoTamanho = new SizeButton(featureName);

	after(): initialization(WebHelpBar.new(WebView, Canvas)) {}

	pointcut Espaco(): within(Pequeno) ||
		within(Medio) ||
		within(Grande) ||
		within(Enorme);

	pointcut ConstrutorDeEspaco(): Espaco() && execution(new(..));

	after(): ConstrutorDeEspaco(){
		String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
		opcaoTamanho.opcao(sep[0]);
		opcaoTamanho.actionButton();
	}
	
	after(SizeButton handle): target(handle) && call(private void teste(..)) {
		if (handle.getSizeButtonStatus().getButtonID().equals(featureName)) {
			String[] tagStyle = handle.getSizeButtonStatus().getCharSpacing().split(":");
			WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle[0]);
			WebHelpBar.applyButtonStatus.setFontStyle(handle.getSizeButtonStatus().getCharSpacing(), 
					handle.getSizeButtonStatus().isActive());
		}
	}
}
