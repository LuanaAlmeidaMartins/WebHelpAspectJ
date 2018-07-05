import javafx.scene.web.WebView;

public aspect Fonte {

	OpcoesDoBotao opcaoTamanho = new OpcoesDoBotao("Fonte");
	
	int i = 0;
	after(): initialization(WebHelpBar.new(WebView)) {
	}

	pointcut Familia(): within(Georgia) ||
						within(OpenDyslexic) ||
						within(OpenSans) ||
						within(ComicSans);

	pointcut ConstrutorDeFamilia(): Familia() && execution(new(..));

	after(): ConstrutorDeFamilia(){
		String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
		opcaoTamanho.opcao(sep[0]);
		opcaoTamanho.actionButton();
	}
	
	pointcut Cor(): within(Cor);

	pointcut ConstrutorDeCor(): Cor() && execution(new(..));

	after(): ConstrutorDeCor(){
		OpcoesDeCor opCor = new OpcoesDeCor("Cor");
		opCor.action();
	}
	
	pointcut Tamanho(): within(Pequeno) ||
						within(Medio) ||
						within(Grande) ||
						within(Enorme);

	pointcut ConstrutorDeTamanho(): Tamanho() && execution(new(..));

	after(): ConstrutorDeTamanho(){
		System.out.println(i);
		if(i == 0) {
			opcaoTamanho = new OpcoesDoBotao("Tamanho");
		}
		String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
		opcaoTamanho.opcao(sep[0]);
		opcaoTamanho.actionButton();
		i++;
	}
}
