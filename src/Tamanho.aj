
public aspect Tamanho {

	OpcaoTamanho a;
	
	pointcut SubItens(): within(Caracteres) ||
	   					within(Fonte);

	pointcut ConstrutorDeSubItens(): SubItens() && execution(new(..));
	
	pointcut TamanhoP(): within(Pequeno) ||
						 within(Medio);
	
	pointcut ConstrutorDeTamanho(): TamanhoP() && execution(new(..));

	after (): ConstrutorDeSubItens() {
	//System.out.println(thisJoinPointStaticPart.getSourceLocation().toString());
	String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
	a = new OpcaoTamanho(sep[0]);
	
}
	after():ConstrutorDeTamanho(){
		String[] sep = thisJoinPointStaticPart.getSourceLocation().toString().split("\\.");
		a.opcao(sep[0]);
		a.actionButton();
	}
}
