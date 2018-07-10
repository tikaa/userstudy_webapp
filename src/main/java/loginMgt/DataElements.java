package main.java.loginMgt;

import main.java.model.DataItems;

public class DataElements {


    public static String getAllDataElemsAsJSON() {
        StringBuffer sb = new StringBuffer();
        sb.append("[");
        int iterator = 1;
        for (DataItems dataElem : DataItems.values()) {

            sb.append("\"").append(dataElem.toString()).append("\"");
            if (iterator < DataItems.values().length) {
                sb.append(",");
            }
            iterator++;
        }
        sb.append("]");
        return sb.toString();
    }
}
