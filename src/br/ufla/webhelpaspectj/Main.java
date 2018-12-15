package br.ufla.webhelpaspectj;

import java.io.File;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.control.ScrollPane;
import javafx.scene.image.Image;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;
import javafx.stage.Stage;

public class Main extends Application {

	@Override
	public void start(final Stage stage) {

		// Set application icon
		File file = new File("icons/webhelp.png");
		Image image = new Image(file.toURI().toString());
		stage.getIcons().add(image);

		// Set application home page
		String homePageUrl = "https://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-F68F082";
		// String homePageUrl = "https://pt.wikipedia.org/wiki/Texto";

		// Create opcaoTamanho WebView
		final WebView browser = new WebView();

		// Get WebEngine via WebView and load home page
		final WebEngine webEngine = browser.getEngine();
		webEngine.load(homePageUrl);

		// When the website content is bigger than display area, the scroll pane is
		// enabled
		ScrollPane scrollPane = new ScrollPane();
		scrollPane.setContent(new Group());

		// Create the navigation bar
		// NavigationBar navigationBar = new NavigationBar(browser, homePageUrl);

		// Create the WebHelpDyslexia bar
		Canvas overlay = new Canvas(1300,600);
	    WebHelpBar webHelpBar = new WebHelpBar(browser, overlay);
	    overlay.setAccessibleText("aa");
	    StackPane stack = new StackPane();
	    stack.getChildren().addAll(browser, overlay);
	    stack.setMargin(browser, new Insets(12, 12, 10, 28));

		// Create the VBox, add the navigation, menu and webview to the VBox and
		VBox root = new VBox(webHelpBar, stack);
		// navigationBar,
		// Create the Scene, add the Scene to the Stage and display the Stage
		Scene scene = new Scene(root, 1600,900);

		// root.getChildren().add(g);
		stage.setScene(scene);

		stage.show();
	}

	public static void main(String[] args) {
		launch(args);
	}
}