package main.java.model;

public class DataElement {

    private String dataElemName;
    private String reasonForSelection;
    private double sensitivity;
    private double visibility;
    private double relatedness;
    private double privacyRisk;
    private boolean isPreSelected;
    private boolean isPreStored;
    private boolean isPreShared;
    private boolean isPostStored;
    private boolean isPostShared;
    private int isPostSelected;

    private String howPreStored;
    private String wherePreStored;
    private String howPostStored;
    private String wherePostStored;

    public String getHowPreStored() {
        return howPreStored;
    }

    public void setHowPreStored(String howPreStored) {
        this.howPreStored = howPreStored;
    }

    public String getWherePreStored() {
        return wherePreStored;
    }

    public void setWherePreStored(String wherePreStored) {
        this.wherePreStored = wherePreStored;
    }

    public String getHowPostStored() {
        return howPostStored;
    }

    public void setHowPostStored(String howPostStored) {
        this.howPostStored = howPostStored;
    }

    public String getWherePostStored() {
        return wherePostStored;
    }

    public void setWherePostStored(String wherePostStored) {
        this.wherePostStored = wherePostStored;
    }

    public String getHowPreShared() {
        return howPreShared;
    }

    public void setHowPreShared(String howPreShared) {
        this.howPreShared = howPreShared;
    }

    public String getHowPostShared() {
        return howPostShared;
    }

    public void setHowPostShared(String howPostShared) {
        this.howPostShared = howPostShared;
    }

    private String howPreShared;
    private String howPostShared;


    public boolean isPreStored() {
        return isPreStored;
    }

    public void setPreStored(boolean preStored) {
        isPreStored = preStored;
    }

    public boolean isPreShared() {
        return isPreShared;
    }

    public void setPreShared(boolean preShared) {
        isPreShared = preShared;
    }

    public boolean isPostStored() {
        return isPostStored;
    }

    public void setPostStored(boolean postStored) {
        isPostStored = postStored;
    }

    public boolean isPostShared() {
        return isPostShared;
    }

    public void setPostShared(boolean postShared) {
        isPostShared = postShared;
    }

    public String getReasonForSelection() {
        return reasonForSelection;
    }

    public void setReasonForSelection(String reasonForSelection) {
        this.reasonForSelection = reasonForSelection;
    }

    public int getIsPostSelected() {
        return isPostSelected;
    }

    public void setIsPostSelected(int isPostSelected) {
        this.isPostSelected = isPostSelected;
    }

    public boolean isPreSelected() {
        return isPreSelected;
    }

    public void setPreSelected(boolean preSelected) {
        isPreSelected = preSelected;
    }

    public String getDataElemName() {
        return dataElemName;
    }

    public void setDataElemName(String dataElemName) {
        this.dataElemName = dataElemName;
    }

    public double getSensitivity() {
        return sensitivity;
    }

    public void setSensitivity(double sensitivity) {
        this.sensitivity = sensitivity;
    }

    public double getVisibility() {
        return visibility;
    }

    public void setVisibility(double visibility) {
        this.visibility = visibility;
    }

    public double getRelatedness() {
        return relatedness;
    }

    public void setRelatedness(double relatedness) {
        this.relatedness = relatedness;
    }


    public double getPrivacyRisk() {
        if (this.getRelatedness() != 0) {

            double risk =  (this.getSensitivity() *  this.getVisibility()) / ( 2.0 * this.getRelatedness());
            this.setPrivacyRisk(risk);
            //check float value saving
            System.out.println("calculated privacy risk (float) : " + risk);

        } else {
            this.setPrivacyRisk(0);
        }
        return privacyRisk;
    }

    public void setPrivacyRisk(double privacyRisk) {
        this.privacyRisk = privacyRisk;
    }


}
