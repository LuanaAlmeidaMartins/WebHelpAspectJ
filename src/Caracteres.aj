import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.OpcoesDoBotao;
import br.ufla.webhelpaspectj.WebHelpBar;

public aspect Caracteres {
	OpcoesDoBotao opcaoTamanho = new OpcoesDoBotao("Caracteres");

	declare precedence: Caracteres, Alinhamento, Sublinhado, Italico, Negrito;

	after(): initialization(WebHelpBar.new(WebView)) {
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

}
