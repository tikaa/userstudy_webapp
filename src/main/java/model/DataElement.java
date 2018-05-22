package main.java.model;

public class DataElement {

    String dataElemName;
    int sensitivity;
    int visibility;
    int relatedness;
    int privacyRisk;
    boolean isSelected;

    public boolean isSelected() {
        return isSelected;
    }

    public void setSelected(boolean selected) {
        isSelected = selected;
    }

    public String getDataElemName() {
        return dataElemName;
    }

    public void setDataElemName(String dataElemName) {
        this.dataElemName = dataElemName;
    }

    public int getSensitivity() {
        return sensitivity;
    }

    public void setSensitivity(int sensitivity) {
        this.sensitivity = sensitivity;
    }

    public int getVisibility() {
        return visibility;
    }

    public void setVisibility(int visibility) {
        this.visibility = visibility;
    }

    public int getRelatedness() {
        return relatedness;
    }

    public void setRelatedness(int relatedness) {
        this.relatedness = relatedness;
    }



    public int getPrivacyRisk() {
        return privacyRisk;
    }

    public void setPrivacyRisk(int privacyRisk) {
        this.privacyRisk = privacyRisk;
    }


}
