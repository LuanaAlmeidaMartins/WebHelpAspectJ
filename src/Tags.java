


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Properties;

public class Tags {
  private ArrayList<String> tags = new ArrayList<String>();
  Properties property = new Properties();

  public Tags() {

    try {
      property.load(new FileInputStream(/*
                                         * System.getProperty("user.dir") + "/properties.txt"
                                         */"properties.txt"));
    } catch (FileNotFoundException e) {
      System.out.println("Arquivo properties.txt nao encontrado");
    } catch (IOException e) {
      System.out.println("IO");
    }
    tags.addAll(Arrays.asList(property.getProperty("tags").split(" ")));
  }

  public ArrayList<String> getTagsName() {
    return tags;
  }
}
