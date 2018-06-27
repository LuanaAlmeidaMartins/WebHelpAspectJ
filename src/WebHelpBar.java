import org.w3c.dom.Document;

import javafx.concurrent.Worker.State;
import javafx.event.EventHandler;
import javafx.scene.control.Button;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;

public class WebHelpBar extends HBox{
	static HBox hbox;
	static WebEngine webEngine;
	Button align;
	
	public WebHelpBar(WebView web) {
		WebHelpBar.webEngine = web.getEngine();
		hbox = new HBox();
		this.getChildren().add(hbox);
	}
	
	public WebHelpBar(String a) {
		align = new Button();
		align.setText(a);
		align.setId(a);
		System.out.println(align.getId());
	}
	
	public void action() {
		System.out.println("entrou");
		AlignStatus alignStatus = new AlignStatus();
		System.out.println(webEngine.getLoadWorker());
		webEngine.getLoadWorker().stateProperty().addListener((obs, oldValue, newValue) -> {
		     System.out.println("entrou 2??????"); 
		     if (newValue == State.SUCCEEDED) {
		        Document doc = webEngine.getDocument();
		    //   WebHelpBar.applyButtonStatus = new ApplyButtonStatus(doc);

		        align.setOnMouseClicked(new EventHandler<MouseEvent>() {
		          @Override
		          public void handle(MouseEvent event) {
		            alignStatus.setAlign();
		            //WebHelpBar.applyButtonStatus.setFontStyle(alignStatus.getAlign(),
		              //  alignStatus.isAlign());
		        	  System.out.println("shit "+ align.getId());
		        	  System.out.println("teste para set "+ alignStatus.isAlign());
		          }
		        });
		      }
		    });
	   hbox.getChildren().add(align);
	}
}
