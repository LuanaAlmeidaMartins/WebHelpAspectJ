package br.ufla.webhelpaspectj;

public aspect FeaturesSemRestricao {

	pointcut Button(): within(Negrito) ||
					   within(Italico) ||
					   within(Sublinhado) ||
					   within(Alinhamento) ||
					   within(Leitor);

	pointcut myConstructor(): Button() && execution(new(..));

	after(): myConstructor() {
		String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
		SimpleButton button = new SimpleButton(sep[0]);
		button.actionButton();
	}
	after(SimpleButton handle): target(handle) && call(private void applyStyle(..)) {
		if(handle.getSimpleButton().SimpleButtonID().equals("Leitor")) {
			WebHelpBar.overlay.setVisible(false);
			Synth synth = new Synth();
		}
		else {
			WebHelpBar.applyButtonStatus.setFontStyle(
					handle.getSimpleButton().getStyle(handle.getSimpleButton().SimpleButtonID()),
					handle.getSimpleButton().isActive());
		}
	}
}
