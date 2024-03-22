/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.MemberOfClass;

public class MemberOfClassDAO extends DBContext {

    public List<MemberOfClass> getClassesForAccount(int accountId) {
        YouthTrainingCourseDAO dao = new YouthTrainingCourseDAO();
        ClassDAO cDAO = new ClassDAO();
        String sql = "SELECT [IDMemberOfClass]\n"
                + "      ,[IDAccount]\n"
                + "      ,C.[IDClass]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[NameStudent]\n"
                + "      ,[age]\n"
                + "      ,[height]\n"
                + "      ,[weight]\n"
                + "      ,[status1]\n"
                + "	  ,y.[Information]\n"
                + "	  ,y.Tuition\n"
                + "	  ,y.TimeRegist\n"
                + "	  ,y.TimeStart\n"
                + "	  ,y.TimeCloseRegist\n"
                + "  FROM [dbo].[MemberOfClass] AS MC\n"
                + "  JOIN [dbo].[Class] AS C \n"
                + "  ON MC.[IDClass] = C.[IDClass]\n"
                + "  JOIN [dbo].[YouthTrainingCourse] AS Y\n"
                + "  ON Y.[IDYouthTrainingCourse] = C.[IDYouthTrainingCourse] "
                + "WHERE IDAccount = ?\n "
                + "ORDER BY status1 ASC";
        List<MemberOfClass> classesForMember = new ArrayList<>();

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, accountId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                MemberOfClass memberOfClassEntity = new MemberOfClass();
                memberOfClassEntity.setIdMemberOfClass(resultSet.getInt("IDMemberOfClass"));
                memberOfClassEntity.setIdAccount(resultSet.getInt("IDAccount"));
                memberOfClassEntity.setIdClass(resultSet.getInt("IDClass"));
                memberOfClassEntity.setPhoneNumber(resultSet.getString("PhoneNumber"));
                memberOfClassEntity.setNameStudent(resultSet.getString("NameStudent"));
                memberOfClassEntity.setAge(resultSet.getInt("age"));
                memberOfClassEntity.setHeight(resultSet.getInt("height"));
                memberOfClassEntity.setWeight(resultSet.getInt("weight"));
                memberOfClassEntity.setStatus1(resultSet.getInt("status1"));

                memberOfClassEntity.setClassCourse(cDAO.getClassById(resultSet.getInt("IDClass")));
                memberOfClassEntity.setCourse(dao.getYouthTrainingCourseById(resultSet.getInt("IDClass")));
                classesForMember.add(memberOfClassEntity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return classesForMember;
    }

    public List<MemberOfClass> getClassesForMember(int idMember) {
        YouthTrainingCourseDAO dao = new YouthTrainingCourseDAO();
        ClassDAO cDAO = new ClassDAO();
        String sql = "SELECT [IDMemberOfClass]\n"
                + "      ,[IDAccount]\n"
                + "      ,C.[IDClass]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[NameStudent]\n"
                + "      ,[age]\n"
                + "      ,[height]\n"
                + "      ,[weight]\n"
                + "      ,[status1]\n"
                + "	  ,y.[Information]\n"
                + "	  ,y.Tuition\n"
                + "	  ,y.TimeRegist\n"
                + "	  ,y.TimeStart\n"
                + "	  ,y.TimeCloseRegist\n"
                + "  FROM [dbo].[MemberOfClass] AS MC\n"
                + "  JOIN [dbo].[Class] AS C \n"
                + "  ON MC.[IDClass] = C.[IDClass]\n"
                + "  JOIN [dbo].[YouthTrainingCourse] AS Y\n"
                + "  ON Y.[IDYouthTrainingCourse] = C.[IDYouthTrainingCourse] "
                + "WHERE IDMemberOfClass = ?\n "
                + "ORDER BY status1 ASC";
        List<MemberOfClass> classesForMember = new ArrayList<>();

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, idMember);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                MemberOfClass memberOfClassEntity = new MemberOfClass();
                memberOfClassEntity.setIdMemberOfClass(resultSet.getInt("IDMemberOfClass"));
                memberOfClassEntity.setIdAccount(resultSet.getInt("IDAccount"));
                memberOfClassEntity.setIdClass(resultSet.getInt("IDClass"));
                memberOfClassEntity.setPhoneNumber(resultSet.getString("PhoneNumber"));
                memberOfClassEntity.setNameStudent(resultSet.getString("NameStudent"));
                memberOfClassEntity.setAge(resultSet.getInt("age"));
                memberOfClassEntity.setHeight(resultSet.getInt("height"));
                memberOfClassEntity.setWeight(resultSet.getInt("weight"));
                memberOfClassEntity.setStatus1(resultSet.getInt("status1"));

                memberOfClassEntity.setClassCourse(cDAO.getClassById(resultSet.getInt("IDClass")));
                memberOfClassEntity.setCourse(dao.getYouthTrainingCourseById(resultSet.getInt("IDClass")));
                classesForMember.add(memberOfClassEntity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return classesForMember;
    }

    public List<MemberOfClass> getMemberOfClassForList(int idClass) {
        YouthTrainingCourseDAO dao = new YouthTrainingCourseDAO();
        ClassDAO cDAO = new ClassDAO();
        String sql = "SELECT \n"
                + "    MC.[IDMemberOfClass],\n"
                + "    MC.[IDAccount],\n"
                + "    C.[IDClass],\n"
                + "    MC.[PhoneNumber],\n"
                + "    Y.[IDYouthTrainingCourse],\n"
                + "    MC.[NameStudent],\n"
                + "    MC.[age],\n"
                + "    MC.[height],\n"
                + "    MC.[weight],\n"
                + "    MC.[status1],\n"
                + "    Y.[Information],\n"
                + "    Y.Tuition,\n"
                + "    Y.TimeRegist,\n"
                + "    Y.TimeStart,\n"
                + "    Y.TimeCloseRegist\n"
                + "FROM \n"
                + "    [dbo].[MemberOfClass] AS MC\n"
                + "JOIN \n"
                + "    [dbo].[Class] AS C ON MC.[IDClass] = C.[IDClass]\n"
                + "JOIN \n"
                + "    [dbo].[YouthTrainingCourse] AS Y ON Y.[IDYouthTrainingCourse] = C.[IDYouthTrainingCourse]\n"
                + "WHERE \n"
                + "    status1 = 2\n"
                + "and MC.[IDClass] = ?;";
        List<MemberOfClass> classesForMember = new ArrayList<>();

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, idClass);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                MemberOfClass memberOfClassEntity = new MemberOfClass();
                memberOfClassEntity.setIdMemberOfClass(resultSet.getInt("IDMemberOfClass"));
                memberOfClassEntity.setIdAccount(resultSet.getInt("IDAccount"));
                memberOfClassEntity.setIdClass(resultSet.getInt("IDClass"));
                memberOfClassEntity.setPhoneNumber(resultSet.getString("PhoneNumber"));
                memberOfClassEntity.setNameStudent(resultSet.getString("NameStudent"));
                memberOfClassEntity.setAge(resultSet.getInt("age"));
                memberOfClassEntity.setHeight(resultSet.getInt("height"));
                memberOfClassEntity.setWeight(resultSet.getInt("weight"));
                memberOfClassEntity.setStatus1(resultSet.getInt("status1"));

                memberOfClassEntity.setClassCourse(cDAO.getClassById(resultSet.getInt("IDClass")));
                memberOfClassEntity.setCourse(dao.getYouthTrainingCourseById(resultSet.getInt("IDClass")));
                classesForMember.add(memberOfClassEntity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return classesForMember;
    }

    public List<MemberOfClass> getMemberOfClassforWaiting(int idClass) {
        YouthTrainingCourseDAO dao = new YouthTrainingCourseDAO();
        ClassDAO cDAO = new ClassDAO();
        String sql = "SELECT \n"
                + "    MC.[IDMemberOfClass],\n"
                + "    MC.[IDAccount],\n"
                + "    C.[IDClass],\n"
                + "    MC.[PhoneNumber],\n"
                + "    Y.[IDYouthTrainingCourse],\n"
                + "    MC.[NameStudent],\n"
                + "    MC.[age],\n"
                + "    MC.[height],\n"
                + "    MC.[weight],\n"
                + "    MC.[status1],\n"
                + "    Y.[Information],\n"
                + "    Y.Tuition,\n"
                + "    Y.TimeRegist,\n"
                + "    Y.TimeStart,\n"
                + "    Y.TimeCloseRegist\n"
                + "FROM \n"
                + "    [dbo].[MemberOfClass] AS MC\n"
                + "JOIN \n"
                + "    [dbo].[Class] AS C ON MC.[IDClass] = C.[IDClass]\n"
                + "JOIN \n"
                + "    [dbo].[YouthTrainingCourse] AS Y ON Y.[IDYouthTrainingCourse] = C.[IDYouthTrainingCourse]\n"
                + "WHERE \n"
                + "    status1 = 1\n"
                + "and MC.[IDClass] = ?;";

        List<MemberOfClass> classesForMember = new ArrayList<>();

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, idClass);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                MemberOfClass memberOfClassEntity = new MemberOfClass();
                memberOfClassEntity.setIdMemberOfClass(resultSet.getInt("IDMemberOfClass"));
                memberOfClassEntity.setIdAccount(resultSet.getInt("IDAccount"));
                memberOfClassEntity.setIdClass(resultSet.getInt("IDClass"));
                memberOfClassEntity.setPhoneNumber(resultSet.getString("PhoneNumber"));
                memberOfClassEntity.setNameStudent(resultSet.getString("NameStudent"));
                memberOfClassEntity.setAge(resultSet.getInt("age"));
                memberOfClassEntity.setHeight(resultSet.getInt("height"));
                memberOfClassEntity.setWeight(resultSet.getInt("weight"));
                memberOfClassEntity.setStatus1(resultSet.getInt("status1"));

                memberOfClassEntity.setClassCourse(cDAO.getClassById(resultSet.getInt("IDClass")));
                memberOfClassEntity.setCourse(dao.getYouthTrainingCourseById(resultSet.getInt("IDClass")));
                classesForMember.add(memberOfClassEntity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return classesForMember;
    }

    public MemberOfClass getClassByIdMember(int idMember) {
        String sql = "	select IDClass\n"
                + "	from MemberOfClass\n"
                + "	where IDMemberOfClass = ?";
        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, idMember);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                MemberOfClass memberOfClassEntity = new MemberOfClass();
                memberOfClassEntity.setIdClass(resultSet.getInt("IDClass"));
                return memberOfClassEntity;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;

    }

    public List<MemberOfClass> getMemberOfClass(int idClass) {
        YouthTrainingCourseDAO dao = new YouthTrainingCourseDAO();
        ClassDAO cDAO = new ClassDAO();
        String sql = "SELECT \n"
                + "    MC.[IDMemberOfClass],\n"
                + "    MC.[IDAccount],\n"
                + "    C.[IDClass],\n"
                + "    MC.[PhoneNumber],\n"
                + "    Y.[IDYouthTrainingCourse],\n"
                + "    MC.[NameStudent],\n"
                + "    MC.[age],\n"
                + "    MC.[height],\n"
                + "    MC.[weight],\n"
                + "    MC.[status1],\n"
                + "    Y.[Information],\n"
                + "    Y.Tuition,\n"
                + "    Y.TimeRegist,\n"
                + "    Y.TimeStart,\n"
                + "    Y.TimeCloseRegist\n"
                + "FROM \n"
                + "    [dbo].[MemberOfClass] AS MC\n"
                + "JOIN \n"
                + "    [dbo].[Class] AS C ON MC.[IDClass] = C.[IDClass]\n"
                + "JOIN \n"
                + "    [dbo].[YouthTrainingCourse] AS Y ON Y.[IDYouthTrainingCourse] = C.[IDYouthTrainingCourse]\n"
                + "WHERE \n"
                + " MC.[IDClass] = ?;";

        List<MemberOfClass> classesForMember = new ArrayList<>();

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, idClass);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                MemberOfClass memberOfClassEntity = new MemberOfClass();
                memberOfClassEntity.setIdMemberOfClass(resultSet.getInt("IDMemberOfClass"));
                memberOfClassEntity.setIdAccount(resultSet.getInt("IDAccount"));
                memberOfClassEntity.setIdClass(resultSet.getInt("IDClass"));
                memberOfClassEntity.setPhoneNumber(resultSet.getString("PhoneNumber"));
                memberOfClassEntity.setNameStudent(resultSet.getString("NameStudent"));
                memberOfClassEntity.setAge(resultSet.getInt("age"));
                memberOfClassEntity.setHeight(resultSet.getInt("height"));
                memberOfClassEntity.setWeight(resultSet.getInt("weight"));
                memberOfClassEntity.setStatus1(resultSet.getInt("status1"));

                memberOfClassEntity.setClassCourse(cDAO.getClassById(resultSet.getInt("IDClass")));
                memberOfClassEntity.setCourse(dao.getYouthTrainingCourseById(resultSet.getInt("IDClass")));
                classesForMember.add(memberOfClassEntity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return classesForMember;
    }

    public boolean deleteMemberOfClass(int idMemberOfClass) {
        String sql = "DELETE FROM [dbo].[MemberOfClass] WHERE IDMemberOfClass = ?";

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, idMemberOfClass);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addMember(int accountId, int classId, String phoneNumber, String nameStudent, int age, int height, int weight) {

        String sql = "INSERT INTO [dbo].[MemberOfClass] (IDAccount, IDClass, PhoneNumber, NameStudent, age, height,weight,status1) VALUES (?, ?, ?, ?, ?,?,?,1)";
        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, accountId);
            preparedStatement.setInt(2, classId);
            preparedStatement.setString(3, phoneNumber);
            preparedStatement.setString(4, nameStudent);
            preparedStatement.setInt(5, age);
            preparedStatement.setInt(6, height);
            preparedStatement.setInt(7, weight);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void approveMember(int idMember) throws ClassNotFoundException {
        String sql = "update MemberOfClass\n"
                + "  set status1 = 2\n"
                + "where IDMemberOfClass = ?";
        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, idMember);
            ResultSet resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
        }
    }

    public boolean updateMember(String phoneNumber, String nameStudent, int age, int height, int weight, int idMemberOfClass) {
        String sql = "UPDATE [FBK74_Duy].[dbo].[MemberOfClass]\n"
                + "SET \n"
                + "    [PhoneNumber] = ?,\n"
                + "    [NameStudent] = ?,\n"
                + "    [age] = ?,\n"
                + "    [height] = ?,\n"
                + "    [weight] = ?,\n"
                + "    [status1] = 1\n"
                + "WHERE IDMemberOfClass = ?;";
        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, phoneNumber);
            preparedStatement.setString(2, nameStudent);
            preparedStatement.setInt(3, age);
            preparedStatement.setInt(4, height);
            preparedStatement.setInt(5, weight);
            preparedStatement.setInt(6, idMemberOfClass);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void cancelMember(int idMember) throws ClassNotFoundException {
        String sql = "update MemberOfClass\n"
                + "  set status1 = 3\n"
                + "where IDMemberOfClass = ?";
        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, idMember);
            ResultSet resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
        }
    }

    public MemberOfClass getFirstClassForAccount(int accountID, int idClass) {
        String sql = "SELECT TOP 1 MC.*, MC.IDAccount AS IDAccount1 FROM [dbo].[MemberOfClass] MC\n"
                + "WHERE MC.IDAccount1 = ? AND MC.IDClass = ?";

        MemberOfClass memberOfClassEntity = null;

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, accountID);
            preparedStatement.setInt(2, idClass);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                memberOfClassEntity = new MemberOfClass();
                memberOfClassEntity.setIdMemberOfClass(resultSet.getInt("IDMemberOfClass"));
                memberOfClassEntity.setIdAccount(resultSet.getInt("IDAccount1"));
                memberOfClassEntity.setIdClass(resultSet.getInt("IDClass"));
                memberOfClassEntity.setPhoneNumber(resultSet.getString("PhoneNumber"));
                memberOfClassEntity.setNameStudent(resultSet.getString("NameStudent"));
                memberOfClassEntity.setAge(resultSet.getInt("age"));
                memberOfClassEntity.setHeight(resultSet.getInt("height"));
                memberOfClassEntity.setWeight(resultSet.getInt("weight"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return memberOfClassEntity;
    }

    public static void main(String[] args) {
        MemberOfClassDAO dao = new MemberOfClassDAO();
//        try {
//            dao.approveMember(2);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(MemberOfClassDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
        try {
            dao.cancelMember(17);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MemberOfClassDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        //        List<MemberOfClass> list = dao.getClassesForAccount(1);
//        for (MemberOfClass o : list) {
//            System.out.println(o);
//        }
//        List<MemberOfClass> list = dao.getClassesForMember(1);
//        for (MemberOfClass o : list) {
//            System.out.println(o);
//        }
//        try {
//            System.out.println(dao.addMember(1, 1, "123", "tung123"));
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//        System.out.println(dao.getMemberOfClass());
//        System.out.println(dao.addMember(1, 1, "123", "tung"));
//        System.out.println(dao.getMemberOfClass());
        dao.addMember(1, 3, "0123456789", "Nhat123", 1, 1, 1);
//        try {
//            dao.approveMember(1);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(MemberOfClassDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//dao.updateMember( "0123456789", "Nhat123456", 1, 1,1, 1);
//        System.out.println(dao.getClassByIdMember(1));
    }
}
