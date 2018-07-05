

public aspect FeaturesSemRestricao {

	pointcut Button(): within(Negrito) ||
					   within(Italico) ||
					   within(Sublinhado) ||
					   within(Alinhamento);

	pointcut myConstructor(): Button() && execution(new(..));

	after(): myConstructor() {
		String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
		WebHelpBar a = new WebHelpBar(sep[0]);
		a.action();
	}
}
