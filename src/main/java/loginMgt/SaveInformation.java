package main.java.loginMgt;

import main.java.model.DataElement;

import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class SaveInformation {

    public void writeToFile(int participantID) {

        String fileName = participantID + ".txt";

        try {
            FileWriter writer = new FileWriter(fileName, true);
          List<DataElement> listofData = DataElemsReader.dataElemList;

          for (int i = 0; i<listofData.size(); i++) {
              if (listofData.get(i).isPreSelected()) {
                  DataElement tempElement = listofData.get(i);
                  writer.write("Data Element Name");
                  writer.write(tempElement.getDataElemName());
                  writer.write("\r\n");   //

                  writer.write("Data Element Purpose");
                  writer.write(tempElement.getReasonForSelection());
                  writer.write("\r\n");   //

                  writer.write("Data Element shared");
                  writer.write(String.valueOf(tempElement.isPreShared()));
                  writer.write("\r\n");   //

                  writer.write("Data Element stored");
                  writer.write(String.valueOf(tempElement.isPreStored()));
                  writer.write("\r\n");   //


                  writer.write("Data Element Attributes");
                  writer.write("\r\n");   // write new line
                  writer.write("\r\n");   //
                  writer.write("Sensitivity : ");
                  writer.write(String.valueOf(tempElement.getSensitivity()));
                  writer.write(" Visibility : ");
                  writer.write(String.valueOf(tempElement.getVisibility()));
                  writer.write("  Relatedness : ");
                  writer.write(String.valueOf(tempElement.getRelatedness()));

                  writer.write("\r\n");   //
                  writer.write("Privacy Risk : ");
                  writer.write(String.valueOf(tempElement.getPrivacyRisk()));

                  writer.write("\r\n");   //
                  writer.write("Is selected after methodology : ");
                  writer.write(String.valueOf(tempElement.getIsPostSelected()));

                  writer.write("\r\n");   //
                  writer.write("Is shared after methodology : ");
                  writer.write(String.valueOf(tempElement.isPostShared()));

                  writer.write("\r\n");   //
                  writer.write("Is stored after methodology : ");
                  writer.write(String.valueOf(tempElement.isPostStored()));
                  writer.close();
              }


          }




        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
