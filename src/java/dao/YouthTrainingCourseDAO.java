/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.YouthTrainingCourse;

public class YouthTrainingCourseDAO extends DBContext {

    public void createYouthTrainingCourse(YouthTrainingCourse course) {
        try ( Connection connection = getConnection()) {
            String sql = "INSERT INTO YouthTrainingCourse (Image,NameYouthTrainingCourse, TimeRegist, TimeCloseRegist, TimeStart, Tuition, Information,IdYouthTrainingCourse) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?,?)";
            try ( PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, course.getImage());
                preparedStatement.setString(2, course.getNameYouthTrainingCourse());
                preparedStatement.setDate(3, new java.sql.Date(course.getTimeRegist().getTime()));
                preparedStatement.setDate(4, new java.sql.Date(course.getTimeCloseRegist().getTime()));
                preparedStatement.setDate(5, new java.sql.Date(course.getTimeStart().getTime()));
                preparedStatement.setDouble(6, course.getTuition());
                preparedStatement.setString(7, course.getInformation());
                preparedStatement.setInt(8, course.getIdYouthTrainingCourse());

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateYouthTrainingCourse(YouthTrainingCourse course) {
        try ( Connection connection = getConnection()) {
            String sql = "UPDATE YouthTrainingCourse SET "
                    + "Image = ?, "
                    + "NameYouthTrainingCourse = ?, "
                    + "TimeRegist = ?, "
                    + "TimeCloseRegist = ?, "
                    + "TimeStart = ?, "
                    + "Tuition = ?, "
                    + "Information = ? "
                    + "WHERE IDYouthTrainingCourse = ?";

            try ( PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, course.getImage());
                preparedStatement.setString(2, course.getNameYouthTrainingCourse());
                preparedStatement.setDate(3, new java.sql.Date(course.getTimeRegist().getTime()));
                preparedStatement.setDate(4, new java.sql.Date(course.getTimeCloseRegist().getTime()));
                preparedStatement.setDate(5, new java.sql.Date(course.getTimeStart().getTime()));
                preparedStatement.setDouble(6, course.getTuition());
                preparedStatement.setString(7, course.getInformation());
                preparedStatement.setInt(8, course.getIdYouthTrainingCourse());

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions, log or throw as appropriate
        }
    }

    

    public List<YouthTrainingCourse> getAllYouthTrainingCourses() {
        List<YouthTrainingCourse> courses = new ArrayList<>();
        try ( Connection connection = getConnection()) {
            String sql = "SELECT IDYouthTrainingCourse,Image,NameYouthTrainingCourse, TimeRegist, TimeCloseRegist, TimeStart, Tuition, Information FROM YouthTrainingCourse";
            try ( Statement statement = connection.createStatement();  ResultSet resultSet = statement.executeQuery(sql)) {
                while (resultSet.next()) {
                    YouthTrainingCourse course = new YouthTrainingCourse();
                  course.setIdYouthTrainingCourse(resultSet.getInt("IDYouthTrainingCourse"));
                   course.setImage(resultSet.getString("Image"));
                    course.setNameYouthTrainingCourse(resultSet.getString("NameYouthTrainingCourse"));
                    course.setTimeRegist(resultSet.getDate("TimeRegist"));
                    course.setTimeCloseRegist(resultSet.getDate("TimeCloseRegist"));
                    course.setTimeStart(resultSet.getDate("TimeStart"));
                    course.setTuition(resultSet.getDouble("Tuition"));
                    course.setInformation(resultSet.getString("Information"));

                    courses.add(course);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    // Other CRUD methods (update, delete) can be implemented similarly
    public static void main(String[] args) {
        YouthTrainingCourseDAO dao = new YouthTrainingCourseDAO();

        // Test create
        YouthTrainingCourse newCourse = new YouthTrainingCourse();
        newCourse.setNameYouthTrainingCourse("Java Programming");
        newCourse.setTimeRegist(Date.valueOf("2024-02-20")); // Example: set the registration time to the current date
        newCourse.setTimeCloseRegist(Date.valueOf("2024-02-20")); // Example: set the close registration time to the current date
        newCourse.setTimeStart(Date.valueOf("2024-02-20")); // Example: set the start time to the current date
        newCourse.setTuition(500.0);
        newCourse.setInformation("Learn Java programming.");
        dao.createYouthTrainingCourse(newCourse);

        // Test read
        List<YouthTrainingCourse> courses = dao.getAllYouthTrainingCourses();
        for (YouthTrainingCourse course : courses) {
            System.out.println(course);
        }
    }

    public YouthTrainingCourse getYouthTrainingCourseById(int courseId) {
        YouthTrainingCourse course = null;
        try ( Connection connection = getConnection()) {
            String selectSql = "SELECT IDYouthTrainingCourse, Image,NameYouthTrainingCourse, TimeRegist, TimeCloseRegist, TimeStart, Tuition, Information FROM YouthTrainingCourse WHERE IDYouthTrainingCourse = ?";
            try ( PreparedStatement preparedStatement = connection.prepareStatement(selectSql)) {
                preparedStatement.setInt(1, courseId);
                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        course = new YouthTrainingCourse();
                     course.setIdYouthTrainingCourse(resultSet.getInt("IDYouthTrainingCourse"));
                        course.setImage(resultSet.getString("image"));
                        course.setNameYouthTrainingCourse(resultSet.getString("NameYouthTrainingCourse"));
                        course.setTimeRegist(resultSet.getDate("TimeRegist"));
                        course.setTimeCloseRegist(resultSet.getDate("TimeCloseRegist"));
                        course.setTimeStart(resultSet.getDate("TimeStart"));
                        course.setTuition(resultSet.getDouble("Tuition"));
                        course.setInformation(resultSet.getString("Information"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions, log or throw as appropriate
        }
        return course;
    }

    public void deleteYouthTrainingCourse(int courseId) {
        try ( Connection connection = getConnection()) {
            String deleteSql = "DELETE FROM YouthTrainingCourse WHERE IDYouthTrainingCourse = ?";
            try ( PreparedStatement preparedStatement = connection.prepareStatement(deleteSql)) {
                preparedStatement.setInt(1, courseId);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<YouthTrainingCourse> getAllYouthTrainingCoursesAvaiable() {
        List<YouthTrainingCourse> courses = new ArrayList<>();
        java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis()); // Lấy ngày hiện tại
        try ( Connection connection = getConnection()) {
            String sql = "SELECT IDYouthTrainingCourse, Image,NameYouthTrainingCourse, TimeRegist, TimeCloseRegist, TimeStart, Tuition, Information FROM YouthTrainingCourse";
            try ( Statement statement = connection.createStatement();  ResultSet resultSet = statement.executeQuery(sql)) {
                while (resultSet.next()) {
                    YouthTrainingCourse course = new YouthTrainingCourse();
                    course.setIdYouthTrainingCourse(resultSet.getInt("IDYouthTrainingCourse"));
                    course.setImage(resultSet.getString("Image"));
                    course.setNameYouthTrainingCourse(resultSet.getString("NameYouthTrainingCourse"));
                    course.setTimeRegist(resultSet.getDate("TimeRegist"));
                    course.setTimeCloseRegist(resultSet.getDate("TimeCloseRegist"));
                    course.setTimeStart(resultSet.getDate("TimeStart"));
                    course.setTuition(resultSet.getDouble("Tuition"));
                    course.setInformation(resultSet.getString("Information"));

                    // Kiểm tra nếu currentDate < TimeCloseRegist, thì mới thêm vào danh sách
                    if (currentDate.before(course.getTimeCloseRegist())) {
                        courses.add(course);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public Object getClassesForAccount(int idAccount) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
