
package model;

import java.util.Date;

public class User {
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
    private int Status;
    private Date Dob;
    private String MaXacThuc;
    private Date ThoiGianMaXacThuc;
    private boolean TrangThaiXacThuc;
    private String image;
    public User() {
    }

    public User(String Name, String UserName,String email,String PassWord) {
        this.Name = Name;
        this.UserName = UserName;
        this.IDEmail = email;
        this.PassWord = PassWord;
    }

    public User(String Name, String UserName, String PassWord, int Gender, String PhoneNumber) {
        this.Name = Name;
        this.UserName = UserName;
        this.PassWord = PassWord;
        this.Gender = Gender;
        this.PhoneNumber = PhoneNumber;
    }
    
    public User(int IDAccount, String Name, String UserName, String PassWord, int Gender, String PhoneNumber, String IDEmail, String IDFacebook, String Bank, String BankNumber, int Role, int Status) {
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
        this.Status = Status;
    }

    public User(int IDAccount, String Name, String UserName, String PassWord, int Gender, String PhoneNumber, String IDEmail, String IDFacebook, String Bank, String BankNumber, int Role, int Status, Date Dob) {
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
        this.Status = Status;
        this.Dob = Dob;
    }

    public User(int IDAccount, String Name, String UserName, String PassWord, int Gender, String PhoneNumber, String IDEmail, String IDFacebook, String Bank, String BankNumber, int Role, int Status, Date Dob, String MaXacThuc, Date ThoiGianMaXacThuc, boolean TrangThaiXacThuc) {
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
        this.Status = Status;
        this.Dob = Dob;
        this.MaXacThuc = MaXacThuc;
        this.ThoiGianMaXacThuc = ThoiGianMaXacThuc;
        this.TrangThaiXacThuc = TrangThaiXacThuc;
    }

    public User(int IDAccount, String Name, String UserName, String PassWord, int Gender, String PhoneNumber, String IDEmail, String IDFacebook, String Bank, String BankNumber, int Role, int Status, Date Dob, String MaXacThuc, Date ThoiGianMaXacThuc, boolean TrangThaiXacThuc, String image) {
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
        this.Status = Status;
        this.Dob = Dob;
        this.MaXacThuc = MaXacThuc;
        this.ThoiGianMaXacThuc = ThoiGianMaXacThuc;
        this.TrangThaiXacThuc = TrangThaiXacThuc;
        this.image = image;
    }

    public User(int id, String name, String emailReceived, String password, int gender, String phoneNumber, String idEmail, String idFacebook, String bank, String bankNumber, int role, int status, Date date, String image) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Date getDob() {
        return Dob;
    }

    public void setDob(Date Dob) {
        this.Dob = Dob;
    }

    public String getMaXacThuc() {
        return MaXacThuc;
    }

    public void setMaXacThuc(String MaXacThuc) {
        this.MaXacThuc = MaXacThuc;
    }

    public Date getThoiGianMaXacThuc() {
        return ThoiGianMaXacThuc;
    }

    public void setThoiGianMaXacThuc(Date ThoiGianMaXacThuc) {
        this.ThoiGianMaXacThuc = ThoiGianMaXacThuc;
    }

    public boolean isTrangThaiXacThuc() {
        return TrangThaiXacThuc;
    }

    public void setTrangThaiXacThuc(boolean TrangThaiXacThuc) {
        this.TrangThaiXacThuc = TrangThaiXacThuc;
    }
    
    

    
    public void setStatus(int Status) {
        this.Status = Status;
    }

    public int getStatus() {
        return Status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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
        return "User{" + "IDAccount=" + IDAccount + ", Name=" + Name + ", UserName=" + UserName + ", PassWord=" + PassWord + ", Gender=" + Gender + ", PhoneNumber=" + PhoneNumber + ", IDEmail=" + IDEmail + ", IDFacebook=" + IDFacebook + ", Bank=" + Bank + ", BankNumber=" + BankNumber + ", Role=" + Role + ", Status=" + Status + ", Dob=" + Dob + ", MaXacThuc=" + MaXacThuc + ", ThoiGianMaXacThuc=" + ThoiGianMaXacThuc + ", TrangThaiXacThuc=" + TrangThaiXacThuc + ", image=" + image + '}';
    }

   
   
   
   
}

