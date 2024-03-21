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
import model.ClassEntity;

public class ClassDAO extends DBContext {

    // Create a new class record
    public boolean createClass(ClassEntity classEntity) {
        String sql = "INSERT INTO [dbo].[Class] (IDYouthTrainingCourse, CoachName, CoachPhoneNumber, NumberOfStudent, status) VALUES (?, ?, ?, ?,1)";

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, classEntity.getIdYouthTrainingCourse());
            preparedStatement.setString(2, classEntity.getCoachName());
            preparedStatement.setString(3, classEntity.getCoachPhoneNumber());
            preparedStatement.setInt(4, classEntity.getNumberOfStudent());
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Retrieve a class record by ID
    public ClassEntity getClassById(int idClass) {
        String sql = "SELECT * FROM [dbo].[Class] WHERE IDClass = ?";

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, idClass);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                ClassEntity classEntity = new ClassEntity();
                classEntity.setIdClass(resultSet.getInt("IDClass"));
                classEntity.setIdYouthTrainingCourse(resultSet.getInt("IDYouthTrainingCourse"));
                classEntity.setCoachName(resultSet.getString("CoachName"));
                classEntity.setCoachPhoneNumber(resultSet.getString("CoachPhoneNumber"));
                classEntity.setNumberOfStudent(resultSet.getInt("NumberOfStudent"));
                return classEntity;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public List<ClassEntity> getClassAvaiable(int idYouthTrainingCourse) {
        List<ClassEntity> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Class] WHERE IDYouthTrainingCourse = ? and status = 1";
        ClassEntity classEntity = null;

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, idYouthTrainingCourse);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                classEntity = new ClassEntity();
                classEntity.setIdClass(resultSet.getInt("IDClass"));
                classEntity.setIdYouthTrainingCourse(resultSet.getInt("IDYouthTrainingCourse"));
                classEntity.setCoachName(resultSet.getString("CoachName"));
                classEntity.setCoachPhoneNumber(resultSet.getString("CoachPhoneNumber"));
                classEntity.setNumberOfStudent(resultSet.getInt("NumberOfStudent"));
                classEntity.setStatus(resultSet.getInt("status"));
                list.add(classEntity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public ClassEntity getClassAvaiable1(int idYouthTrainingCourse) {
        String sql = "SELECT * FROM [dbo].[Class] WHERE IDYouthTrainingCourse = ?";
        ClassEntity classEntity = null;

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, idYouthTrainingCourse);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                classEntity = new ClassEntity();
                classEntity.setIdClass(resultSet.getInt("IDClass"));
                classEntity.setIdYouthTrainingCourse(resultSet.getInt("IDYouthTrainingCourse"));
                classEntity.setCoachName(resultSet.getString("CoachName"));
                classEntity.setCoachPhoneNumber(resultSet.getString("CoachPhoneNumber"));
                classEntity.setNumberOfStudent(resultSet.getInt("NumberOfStudent"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return classEntity;
    }

    // Update a class record
    public boolean updateClass(ClassEntity classEntity) {
        String sql = "UPDATE [dbo].[Class] SET  CoachName = ?, CoachPhoneNumber = ?, NumberOfStudent = ? WHERE IDClass = ?";

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setString(1, classEntity.getCoachName());
            preparedStatement.setString(2, classEntity.getCoachPhoneNumber());
            preparedStatement.setInt(3, classEntity.getNumberOfStudent());
            preparedStatement.setInt(4, classEntity.getIdClass());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete a class record
    public boolean deleteClass(int idClass) {
        String sql = "DELETE FROM [dbo].[Class] WHERE IDClass = ?";

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, idClass);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void cancelClass(int idClass) throws ClassNotFoundException {
        String sql = "update Class\n"
                + "  set status = 2\n"
                + "where IDClass = ?";
        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, idClass);
            ResultSet resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
        }
    }

    // Retrieve all class records
    public List<ClassEntity> getAllClasses() {
        String sql = "SELECT * FROM [dbo].[Class]";
        List<ClassEntity> classes = new ArrayList<>();

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                ClassEntity classEntity = new ClassEntity();
                classEntity.setIdClass(resultSet.getInt("IDClass"));
                classEntity.setIdYouthTrainingCourse(resultSet.getInt("IDYouthTrainingCourse"));
                classEntity.setCoachName(resultSet.getString("CoachName"));
                classEntity.setCoachPhoneNumber(resultSet.getString("CoachPhoneNumber"));
                classEntity.setNumberOfStudent(resultSet.getInt("NumberOfStudent"));
                classes.add(classEntity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return classes;
    }

    public List<ClassEntity> getAllClassesByIDCourse(int idcourse) {
        String sql = "SELECT * FROM [dbo].[Class] WHERE IDYouthTrainingCourse = ?";
        List<ClassEntity> classes = new ArrayList<>();

        try ( PreparedStatement preparedStatement = getConnection().prepareStatement(sql)) {
            preparedStatement.setInt(1, idcourse);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                ClassEntity classEntity = new ClassEntity();
                classEntity.setIdClass(resultSet.getInt("IDClass"));
                classEntity.setIdYouthTrainingCourse(resultSet.getInt("IDYouthTrainingCourse"));
                classEntity.setCoachName(resultSet.getString("CoachName"));
                classEntity.setCoachPhoneNumber(resultSet.getString("CoachPhoneNumber"));
                classEntity.setNumberOfStudent(resultSet.getInt("NumberOfStudent"));
                classes.add(classEntity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return classes;
    }

    public static void main(String[] args) {
        ClassDAO dao = new ClassDAO();

//        ClassEntity newCourse = new ClassEntity();
//        newCourse.setIdYouthTrainingCourse(1);
//        newCourse.setCoachName("Nguyen Van A ");
//        newCourse.setCoachPhoneNumber("0123456789");
//        newCourse.setNumberOfStudent(15);

//        dao.updateClass(newCourse);
//        dao.createClass(newCourse);

        List<ClassEntity> list = dao.getClassAvaiable(2);
        for (ClassEntity o : list) {
            System.out.println(o);
        }
//        List<ClassEntity> list = dao.getAllClassesByIDCourse(1);
//        for (ClassEntity o : list) {
//            System.out.println(o);
//        }
//       try {
//dao.cancelClass(5);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(ClassDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }
}
