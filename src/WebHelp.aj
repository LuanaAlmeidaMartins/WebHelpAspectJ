public aspect WebHelp{
	
	pointcut Button(): within(Negrito) ||
					   within(Italico) ||
					   within(Sublinhado) ||
					   within(Alinhamento);
	
	pointcut myConstructor(): Button() && execution(new(..));
	
	after (): myConstructor() {
//		System.out.println(thisJoinPointStaticPart.getSourceLocation().toString());
		String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
		WebHelpBar a = new WebHelpBar(sep[0]);
		a.action();
    }
}
