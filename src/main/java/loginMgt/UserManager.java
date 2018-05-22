package main.java.loginMgt;

import main.java.loginMgt.exception.UserExistException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import main.java.util.JSONFileManager;

import javax.servlet.http.HttpServletRequest;

/**
 * This class is responsible for user creation and authentication
 */
public class UserManager {

    private static UserManager manager;

    public static final String JSON_ARRAY_NAME = "data";
    public static final String PASSWORD_FILE = "datasources/passwords.json";
    public static final String UTF_8 = "UTF-8";

    private UserManager() {
    }

    public static UserManager getInstance() {
        if (manager == null) {
            synchronized (UserManager.class) {
                if (manager == null) {
                    manager = new UserManager();
                }
            }
        }
        return manager;
    }

    /**
     * Check if user with same user name exist, if not create new user, save password details at passwords.json and
     * save user public key at keys.json
     *
     * @param request
     * @param user
     * @throws UserExistException
     */
    public void registerUser(HttpServletRequest request, User user) throws UserExistException {

        //Read json file where user details will be saved
        JSONObject jsonObject = JSONFileManager.readJSONFile(request.getSession().getServletContext().getRealPath
                (PASSWORD_FILE));
        JSONArray userArray = (JSONArray)jsonObject.get(JSON_ARRAY_NAME);

        //Check if username is already used, if its already used throw an exception
        if (isUserAlreadyExist(user.getUsername(), userArray)) {
            throw new UserExistException();
        }

        //Save new user's details to the json file.
        JSONObject userObject = new JSONObject();
        userObject.put("username", user.getUsername());
        userObject.put("password", user.getPassword());
        userArray.add(userObject);
        JSONFileManager.overwriteJSONFile(request.getSession().getServletContext().getRealPath(PASSWORD_FILE), jsonObject);

    }

    /**
     *
     * Check whether username and password matches by referring to passwords.json data source
     *
     * @param username
     * @param password
     * @return
     */
    public boolean validateCredential (HttpServletRequest request, String username, String password) {

        //Retrieve registered username and password details from json file
        JSONObject userList = JSONFileManager.readJSONFile(request.getSession().getServletContext().getRealPath
                (PASSWORD_FILE));
        JSONArray userArray = (JSONArray)userList.get(JSON_ARRAY_NAME);
        int numberOfUsers = userArray.size();
        JSONObject post;
        //Looping through the registered user array retrieved from the json file
        for (int i = 0; i<numberOfUsers; i++) {
            post = (JSONObject)userArray.get(i);
            //If matching user found, check whether he gave correct password
            if (post.get("username").toString().equals(username)) {
                if (post.get("password").toString().equals(password)) {
                    return true;
                }
                return false;
            }
        }
        //ToDo : improve this with encrypted passwords
        return false;
    }

    /**
     * This function receives a username and an array of users, and check whether given username is already exist in
     * the array or not
     *
     * @param newUserName
     * @param oldUsers
     * @return
     */
    private boolean isUserAlreadyExist (String newUserName, JSONArray oldUsers) {
        int numberOfUsers = oldUsers.size();
        JSONObject post;
        for (int i = 0; i<numberOfUsers; i++) {
            post = (JSONObject)oldUsers.get(i);
            if (post.get("username").toString().equals(newUserName)) {
                return true;
            }
        }
        return false;
    }

}
