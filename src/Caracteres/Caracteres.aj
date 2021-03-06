import javafx.scene.web.WebView;
import Tamanho.SizeButton;
import WebHelp.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect Caracteres {
	final String featureName = "Caracteres";
	SizeButton opcaoTamanho = new SizeButton(featureName);

	declare precedence: Caracteres, Alinhamento, Sublinhado, Italico, Negrito;

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
			String[] tagStyle = handle.getSizeButtonStatus().getCharSpacing().split(":");
			WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle[0]);
			WebHelpBar.applyButtonStatus.setFontStyle(handle.getSizeButtonStatus().getCharSpacing(), 
					handle.getSizeButtonStatus().isActive());
		}
	}
}
