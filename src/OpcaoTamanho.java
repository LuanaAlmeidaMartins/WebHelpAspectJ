import java.io.File;
import java.util.ArrayList;

import org.w3c.dom.Document;

import javafx.concurrent.Worker.State;
import javafx.event.EventHandler;
import javafx.scene.control.RadioMenuItem;
import javafx.scene.control.SplitMenuButton;
import javafx.scene.control.ToggleGroup;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;

public class OpcaoTamanho extends HBox {

	ArrayList<RadioMenuItem> item =  new ArrayList<>();
	SplitMenuButton botao;
	CharSpacingStatus charSpacingStatus = new CharSpacingStatus();

	public OpcaoTamanho(String a) {
		botao = new SplitMenuButton();
		botao.setId(a);
		
		File file = new File("icons/" + a + ".png");
		Image image = new Image(file.toURI().toString(), 28, 28, false, false);
		botao.setGraphic(new ImageView(image));

		WebHelpBar.hbox.getChildren().add(botao);
		System.out.println("---------------------> " + botao.getId());
	}

	public void opcao(String a) {
		RadioMenuItem aitem = new RadioMenuItem(a);
		aitem.setId(botao.getId()+"."+a);
		
		item.add(aitem);
		
		ToggleGroup charSpacingGroup = new ToggleGroup();
		charSpacingGroup.getToggles().add(aitem);
		botao.getItems().add(aitem);
		System.out.println("Ss " + a);
	}
	
	  public void actionButton() {

				System.out.println(item.toString());
		    
		//    System.out.println(",----------------------------------- + "+item.getId());
		    WebHelpBar.webEngine.getLoadWorker().stateProperty().addListener((obs, oldValue, newValue) -> {
		      if (newValue == State.SUCCEEDED) {
		        Document doc = WebHelpBar.webEngine.getDocument();
		        WebHelpBar.applyButtonStatus = new ApplyButtonStatus(doc);

		        botao.setOnMouseClicked(new EventHandler<MouseEvent>() {
		          @Override
		          public void handle(MouseEvent event) {
		            charSpacingStatus.setCharSpacing();
		            WebHelpBar.applyButtonStatus.setFontStyle(
		                charSpacingStatus.getCharSpacing(botao.getId()),
		                charSpacingStatus.isCharSpacing());
		          }
		        });
		        
		        for(int i = 0; i < item.size(); i++) {
		        	int j = i;
		        	item.get(i).setOnAction(actionEvent -> {
			        	
				          charSpacingStatus.setOptionCharSpacing();
				          WebHelpBar.applyButtonStatus.removeFontStyle(charSpacingStatus.getRemoveOption());
				          WebHelpBar.applyButtonStatus.setFontStyle(
				              charSpacingStatus.getCharSpacing(item.get(j).getId()),
				              charSpacingStatus.isCharSpacing());
				        });
		        }
//		        item.setOnAction(actionEvent -> {
//		        	
//		          charSpacingStatus.setOptionCharSpacing();
//		          WebHelpBar.applyButtonStatus.removeFontStyle(charSpacingStatus.getRemoveOption());
//		          WebHelpBar.applyButtonStatus.setFontStyle(
//		              charSpacingStatus.getCharSpacing(item.getId()),
//		              charSpacingStatus.isCharSpacing());
//		        });
		      }
		    });
		  }
}
