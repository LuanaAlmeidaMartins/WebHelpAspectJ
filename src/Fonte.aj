import javafx.scene.web.WebView;
import br.ufla.webhelpaspectj.WebHelpBar;
import br.ufla.webhelpaspectj.ColorButton;
import br.ufla.webhelpaspectj.SizeButton;
import javafx.scene.canvas.Canvas;

public aspect Fonte {
	final String featureName = "Fonte", featureSecondName = "Tamanho";
	
	SizeButton opcaoTamanho = new SizeButton(featureSecondName); 
	SizeButton opcaoFamilia = new SizeButton(featureName);
	ColorButton colorButton = new ColorButton(featureName);
	
	after(): initialization(WebHelpBar.new(WebView, Canvas)) {}

	pointcut Familia(): within(Georgia) ||
						within(OpenDyslexic) ||
						within(OpenSans) ||
						within(ComicSans);

	pointcut ConstrutorDeFamilia(): Familia() && execution(new(..));

	after(): ConstrutorDeFamilia(){
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
		String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
		opcaoTamanho.opcao(sep[0]);
		opcaoTamanho.actionButton();
	}
	
	after(ColorButton handle): target(handle) && call(private void setFeatureStyle(..)) {
		
		if(handle.getColorButtonStatus().getButtonID().equals(featureName)) {
			String tagStyle = "color: #";
			String colorName = colorButton.converterColor(handle.getColorButtonStatus().getColor());
			WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle);
			WebHelpBar.applyButtonStatus.setFontStyle(tagStyle + colorName + ";", handle.getColorButtonStatus().isActive());
			WebHelpBar.applyButtonStatus.applyStyle();
		}
	}
	
	after(SizeButton handle): target(handle) && call(private void teste(..)) {
		if(handle.getSizeButtonStatus().getButtonID().equals(featureName)) {
			String[] tagStyle = handle.getSizeButtonStatus().getCharSpacing().split(":");
			WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle[0]);
			WebHelpBar.applyButtonStatus.setFontStyle(handle.getSizeButtonStatus().getCharSpacing(), 
					handle.getSizeButtonStatus().isActive());
		}
		if(handle.getSizeButtonStatus().getButtonID().equals(featureSecondName)) {
			String[] tagStyle = handle.getSizeButtonStatus().getCharSpacing().split(":");
			WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle[0]);
			WebHelpBar.applyButtonStatus.setFontStyle("font-size: "+handle.getSizeButtonStatus().getCharSpacing(), 
					handle.getSizeButtonStatus().isActive());
		}
	}
}
