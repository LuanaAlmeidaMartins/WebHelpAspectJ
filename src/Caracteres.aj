import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.OpcoesDeTamanho;
import br.ufla.webhelpaspectj.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect Caracteres {
	final String featureName = "Caracteres";
	OpcoesDeTamanho opcaoTamanho = new OpcoesDeTamanho(featureName);

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

	after(OpcoesDeTamanho handle): target(handle) && call(private void teste(..)) {
		if (handle.getBotaoID().equals(featureName)) {
			WebHelpBar.applyButtonStatus.setFontStyle(handle.getID(), handle.getActived());
		}
	}
}
