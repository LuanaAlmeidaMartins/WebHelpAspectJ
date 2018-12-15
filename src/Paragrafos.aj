import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.OpcoesDeTamanho;
import br.ufla.webhelpaspectj.WebHelpBar;
import javafx.scene.canvas.Canvas;

public aspect Paragrafos {
	final String featureName = "Paragrafos";
	OpcoesDeTamanho opcaoTamanho = new OpcoesDeTamanho(featureName);

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
	
	after(OpcoesDeTamanho handle): target(handle) && call(private void teste(..)) {
		if (handle.getBotaoID().equals(featureName)) {
			WebHelpBar.applyButtonStatus.setFontStyle(handle.getID(), handle.getActived());
		}
	}
}
