import br.ufla.webhelpaspectj.OpcoesDeTamanho;
import br.ufla.webhelpaspectj.WebHelpBar;
import javafx.scene.web.WebView;
import javafx.scene.canvas.Canvas;

public aspect Linhas {
	String featureName = "Linhas";
	OpcoesDeTamanho opcaoTamanho = new OpcoesDeTamanho(featureName);

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
