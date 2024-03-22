/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package commons;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

public class GoogleUtils {
public static String getToken(final String code) throws ClientProtocolException, IOException {
  String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
      .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
          .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
          .add("redirect_uri",Constants.GOOGLE_REDIRECT_URI).add("code", code)
          .add("grant_type", Constants.GOOGLE_GRANT_TYPE)
          .add("scope", "profile").build()) 
      .execute().returnContent().asString();
  JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
  String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
  return accessToken;
}

public static GooglePojo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
    String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
    String response = Request.Get(link).execute().returnContent().asString();
    System.out.println(response);
    GooglePojo googlePojo = new Gson().fromJson(response, GooglePojo.class);
    System.out.println(googlePojo);
    return googlePojo;
  }
public static String getGoogleRedirectURL() {
  String googleRedirectURL = "https://accounts.google.com/o/oauth2/auth?client_id=" + Constants.GOOGLE_CLIENT_ID
      + "&redirect_uri=" + Constants.GOOGLE_REDIRECT_URI
      + "&response_type=code"
      + "&scope=email%20profile"; // Include the profile scope
  return googleRedirectURL;
}
}

