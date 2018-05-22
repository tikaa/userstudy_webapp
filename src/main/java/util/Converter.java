package main.java.util;

import java.util.Base64;

/**
 * This class contains the utility functions which perform conversion from byte array to string and string to byte
 * array.
 */
public class Converter {

    public static String convertByteArrayToString (byte[] bytes) {
        return Base64.getEncoder().encodeToString(bytes);
    }

    public static byte[] convertStringToByteArray (String str) {
        return Base64.getDecoder().decode(str);
    }
}
