package main.java.crypt;

/**
 * This class contains cryptographic utility functions such as key generation, encrypt, decrypt, etc.
 */
public class CryptManager {

    private static CryptManager manager;

    private CryptManager(){
    }

    public static CryptManager getInstance() {
        if (manager == null) {
            synchronized (CryptManager.class) {
                if (manager == null) {
                    manager = new CryptManager();
                }
            }
        }
        return manager;
    }


}
