package services;


import com.sun.org.apache.bcel.internal.generic.AALOAD;
import dao.UserDAO;
import model.User;
import org.apache.commons.lang.RandomStringUtils;

public class CustomerServices {
    
    public String resetCustomerPassword(String email) {
    UserDAO userDAO = new UserDAO();
    String randomPassword = RandomStringUtils.randomAlphanumeric(10);
    userDAO.changePassword(randomPassword, email);
    return randomPassword;
}
}
