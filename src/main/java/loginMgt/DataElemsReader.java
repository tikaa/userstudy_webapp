package main.java.loginMgt;

import main.java.model.DataElement;
import main.java.model.DataItems;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class DataElemsReader {


    public static List<DataElement> dataElemList = new ArrayList<DataElement>();

    private static DataElemsReader dataReader;

    private DataElemsReader() {
    }

    public static DataElemsReader getInstance() {
        if (dataReader == null) {
            synchronized (DataElemsReader.class) {
                if (dataReader == null) {
                    dataReader = new DataElemsReader();
                }
            }
        }
        return dataReader;
    }

    public List<DataElement> generateDataElems() {

        //Get file from resources folder


      /*  for (DataItems item : DataItems.values()) {
            DataElement tempElem = new DataElement().getI;
            tempElem.setDataElemName(item.name());
            dataElemList.add(tempElem);
        }*/


        return dataElemList;

    }

    public List<DataElement> getCurrDataElemList() {
        return dataElemList;
    }

    /*
    getting the list of data element names to populate the check box list in the survey
     */
    public String[] allDataElemNames() {

        /* if the data element list is empty generate the data element list from the text file
            because this method is the method that is called first in the web app generating the
            data elements here is appropriate
         */
        if (dataElemList.isEmpty()) {
            generateDataElems();
        }

        String[] dataElemNames = new String[dataElemList.size()];
        for (int elemIndex = 0; elemIndex < dataElemList.size(); elemIndex++) {
            dataElemNames[elemIndex] = dataElemList.get(elemIndex).getDataElemName();
        }
        return dataElemNames;
    }


}
