public aspect WebHelp{
	pointcut Button(): within(Alinhamento) ||
					   within(Bold);
	
	pointcut myConstructor(): Button() && execution(new(..));
	
	after (): myConstructor() {
		WebHelpBar a = new WebHelpBar(thisJoinPointStaticPart.getSourceLocation().toString());
		a.action();
    }
}
