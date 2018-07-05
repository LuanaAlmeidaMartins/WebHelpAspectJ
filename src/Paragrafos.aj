
import javafx.scene.web.WebView;

public aspect Paragrafos {
	OpcoesDoBotao opcaoTamanho = new OpcoesDoBotao("Paragrafos");

	after(): initialization(WebHelpBar.new(WebView)) {
	}

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
