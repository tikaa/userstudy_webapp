package main.java.util;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

public class DataStorer {

    public void fileWriter(String fileName, String content) {
        List<String> lines = Arrays.asList("submission from Participant : " + fileName, content);
        String random = String.valueOf(Math.random());
        //select the correct path for installation
       Path file = Paths.get( "/srv/webapps/survey2018unsw.csiro.au/" + fileName + random + "_main_study.txt"); //for server deployment
//      Path file = Paths.get( "C:\\Users\\Awanthika\\Desktop\\" + fileName + ".txt"); // for local testing

        try {
            Files.write(file, lines, Charset.forName("UTF-8"));
            System.out.println("content written to file" + file.getFileName() + " for participant : " + fileName);
        } catch (IOException e) {
            System.out.println("could not write to file. Error occurred" + e);
        }
    }
}
