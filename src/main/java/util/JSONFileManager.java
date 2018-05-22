package main.java.util;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.*;

/**
 * Created by Asus PC on 1/13/2017.
 */
public class JSONFileManager {

    public static JSONObject readJSONFile(String filePath) {
        JSONParser parser = new JSONParser();
        Object obj = null;
        InputStream is = null;
        try {
            //opens passwords.json File as input stream
            is = new FileInputStream(filePath);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        try {
            obj = parser.parse(new InputStreamReader(is, "UTF-8"));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return  (JSONObject) obj;
    }

    public static void overwriteJSONFile (String filepath, JSONObject json) {

        try {
            FileOutputStream output = new FileOutputStream( filepath, false);
            output.write(json.toJSONString().getBytes());
            output.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
