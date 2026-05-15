# Student-results-portal
Student Result Portal

A Student Result Portal developed using Java and MySQL to manage student records, marks, and results efficiently.

Project Description

This application helps educational institutions manage student academic results.
Administrators can:

Add student details
Enter subject marks
Calculate total and percentage
Generate grades
View student results
Update or delete student records
Features

✔ Student Registration
✔ Marks Entry
✔ Result Calculation
✔ Grade Generation
✔ Search Student by Roll Number
✔ Update Student Details
✔ Delete Records
✔ Database Storage

Technologies Used
Java
JDBC
MySQL
NetBeans IDE / Eclipse IDE
Project Structure
StudentResultPortal/
│
├── src/
│   ├── DBConnection.java
│   ├── Student.java
│   ├── ResultCalculator.java
│   ├── StudentDAO.java
│   ├── Main.java
│
├── database.sql
├── README.md
Database Setup

Create database:

CREATE DATABASE student_portal;

USE student_portal;

CREATE TABLE students(
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(50),
   roll_no VARCHAR(20),
   subject1 INT,
   subject2 INT,
   subject3 INT,
   total INT,
   percentage DOUBLE,
   grade VARCHAR(5)
);
Database Connection (DBConnection.java)
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/student_portal";

    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public static Connection getConnection() {

        try {
            return DriverManager.getConnection(
                    URL, USER, PASSWORD);

        } catch(Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
How to Run
1. Install Software
Java JDK
MySQL
NetBeans IDE or Eclipse IDE
2. Import Project

Open project in IDE.

3. Configure Database

Create database and table using SQL script.

4. Update Credentials

Edit:

USER = "root";
PASSWORD = "your_password";
5. Run Project

Run:

Main.java
Sample Output
===== STUDENT RESULT PORTAL =====

Enter Student Name : Shalini
Enter Roll Number : 22CS101

Enter Subject 1 Marks : 90
Enter Subject 2 Marks : 85
Enter Subject 3 Marks : 88

Total : 263
Percentage : 87.6
Grade : A
Future Enhancements
Login system
Admin dashboard
PDF result generation
Email notification
Web-based portal

This README is ready to paste into your GitHub project.
