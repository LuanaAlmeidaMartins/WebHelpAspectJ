import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;
import br.ufla.webhelpaspectj.ColorButton;
import br.ufla.webhelpaspectj.OpcoesDeTamanho;
import javafx.scene.canvas.Canvas;

public aspect Fonte {
	final String featureName = "Fonte";
	
	OpcoesDeTamanho opcaoTamanho = new OpcoesDeTamanho("Tamanho"); // corrigir
	OpcoesDeTamanho opcaoFamilia = new OpcoesDeTamanho(featureName);
	ColorButton colorButton = new ColorButton(featureName);
	
	
	int i = 0;
	after(): initialization(WebHelpBar.new(WebView, Canvas)) {}

	pointcut Familia(): within(Georgia) ||
						within(OpenDyslexic) ||
						within(OpenSans) ||
						within(ComicSans);

	pointcut ConstrutorDeFamilia(): Familia() && execution(new(..));

	after(): ConstrutorDeFamilia(){
	//	OpcoesDoBotao opcaoTamanho = new OpcoesDoBotao("Fonte");
		String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
		opcaoFamilia.opcao(sep[0]);
		opcaoFamilia.actionButton();
	}
	
	pointcut Cor(): within(Cor);

	pointcut ConstrutorDeCor(): Cor() && execution(new(..));

	after(): ConstrutorDeCor(){
		colorButton.actionButton();
	}
	
	pointcut Tamanho(): within(Pequeno) ||
						within(Medio) ||
						within(Grande) ||
						within(Enorme);

	pointcut ConstrutorDeTamanho(): Tamanho() && execution(new(..));

	after(): ConstrutorDeTamanho(){
		System.out.println(i);
		
	//	if(i == 0) {
		//	opcaoTamanho = new OpcoesDoBotao("Tamanho");
	//	}
		String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
		System.out.println("Tamanho "+sep[0]);
		opcaoTamanho.opcao(sep[0]);
		opcaoTamanho.actionButton();
		i++;
	}
	
	after(ColorButton handle): target(handle) && call(private void setColor(..)) {
		
		if(handle.getColorButtonStatus().getButtonID().equals(featureName)) {
			String colorName = colorButton.converterColor(handle.getColorButtonStatus().getColor());
			WebHelpBar.applyButtonStatus.setFontStyle("color: #"+ colorName + ";", handle.getColorButtonStatus().isActive());
			WebHelpBar.applyButtonStatus.applyStyle();
		}
	}
	
	after(OpcoesDeTamanho handle): target(handle) && call(private void teste(..)) {
		
		if(handle.getBotaoID().equals(featureName)) {
			WebHelpBar.applyButtonStatus.setFontStyle(handle.getID(), handle.getActived());
			WebHelpBar.applyButtonStatus.applyStyle();
		}
		if(handle.getBotaoID().equals("Tamanho")) {
			WebHelpBar.applyButtonStatus.setFontStyle("font-size: "+handle.getID(), handle.getActived());
			WebHelpBar.applyButtonStatus.applyStyle();
		}
	}
	
	
}
