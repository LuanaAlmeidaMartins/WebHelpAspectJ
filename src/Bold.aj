import javafx.scene.control.Button;
import javafx.scene.layout.HBox;
import javafx.scene.web.WebView;

public aspect Bold extends HBox{

	after(): initialization(WebHelpBar.new(WebView)) {
////		System.out.println(" bold");
//		Button bold = new Button();
////		bold.setText("bold");
////		WebHelpBar.hbox.getChildren().add(bold);
	}
}
