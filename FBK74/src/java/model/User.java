
package model;

public class User {
    
//    [IDAccount]
//      ,[Name]
//      ,[UserName]
//      ,[PassWord]
//      ,[Gender]
//      ,[PhoneNumber]
//      ,[IDEmail]
//      ,[IDFacebook]
//      ,[Bank]
//      ,[BankNumber]
//      ,[Role]

    private int IDAccount;
    private String Name;
    private String UserName;
    private String PassWord;
    private int Gender;
    private String PhoneNumber;
    private String IDEmail;
    private String IDFacebook;
    private String Bank;
    private String BankNumber;
    private int Role;
//    private String address;
//    private String password;

    public User() {
    }

    public User(int IDAccount, String Name, String UserName, String PassWord, int Gender, String PhoneNumber, String IDEmail, String IDFacebook, String Bank, String BankNumber, int Role) {
        this.IDAccount = IDAccount;
        this.Name = Name;
        this.UserName = UserName;
        this.PassWord = PassWord;
        this.Gender = Gender;
        this.PhoneNumber = PhoneNumber;
        this.IDEmail = IDEmail;
        this.IDFacebook = IDFacebook;
        this.Bank = Bank;
        this.BankNumber = BankNumber;
        this.Role = Role;
    }

    public int getIDAccount() {
        return IDAccount;
    }

    public void setIDAccount(int IDAccount) {
        this.IDAccount = IDAccount;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPassWord() {
        return PassWord;
    }

    public void setPassWord(String PassWord) {
        this.PassWord = PassWord;
    }

    public int getGender() {
        return Gender;
    }

    public void setGender(int Gender) {
        this.Gender = Gender;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getIDEmail() {
        return IDEmail;
    }

    public void setIDEmail(String IDEmail) {
        this.IDEmail = IDEmail;
    }

    public String getIDFacebook() {
        return IDFacebook;
    }

    public void setIDFacebook(String IDFacebook) {
        this.IDFacebook = IDFacebook;
    }

    public String getBank() {
        return Bank;
    }

    public void setBank(String Bank) {
        this.Bank = Bank;
    }

    public String getBankNumber() {
        return BankNumber;
    }

    public void setBankNumber(String BankNumber) {
        this.BankNumber = BankNumber;
    }

    public int getRole() {
        return Role;
    }

    public void setRole(int Role) {
        this.Role = Role;
    }

    @Override
    public String toString() {
        return "User{" + "IDAccount=" + IDAccount + ", Name=" + Name + ", UserName=" + UserName + ", PassWord=" + PassWord + ", Gender=" + Gender + ", PhoneNumber=" + PhoneNumber + ", IDEmail=" + IDEmail + ", IDFacebook=" + IDFacebook + ", Bank=" + Bank + ", BankNumber=" + BankNumber + ", Role=" + Role + '}';
    }

   
}
