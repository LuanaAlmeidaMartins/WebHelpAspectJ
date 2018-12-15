import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;
import br.ufla.webhelpaspectj.OpcoesDoBotao;
import javafx.scene.canvas.Canvas;

public aspect Paragrafos {
	OpcoesDoBotao opcaoTamanho = new OpcoesDoBotao("Paragrafos");

	after(): initialization(WebHelpBar.new(WebView, Canvas)) {}

	pointcut Espaco(): within(Simples) ||
		within(UmMeio) ||
		within(UmQuinze) ||
		within(Duplo);

	pointcut ConstrutorDeEspaco(): Espaco() && execution(new(..));

	after(): ConstrutorDeEspaco(){
		String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
		opcaoTamanho.opcao(sep[0]);
		opcaoTamanho.actionButton();
	}
}
