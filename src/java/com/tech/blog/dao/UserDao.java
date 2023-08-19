
package com.tech.blog.dao;
import com.tech.blog.entities.User;


import java.sql.*;
public class UserDao {
   private Connection con; 

    public UserDao(Connection con) {
        this.con = con;
    }
    
//    method to inser user to database
    public boolean SaveUser(User user) {
    boolean success = false;
    try {
        String query = "insert into user (name, email, password, gender, about) values (?,?,?,?,?) ";
        PreparedStatement pstmt = this.con.prepareStatement(query);
        pstmt.setString(1, user.getName());
        pstmt.setString(2, user.getEmail());
        pstmt.setString(3, user.getPassword());
        pstmt.setString(4, user.getGender());
        pstmt.setString(5, user.getAbout());
        pstmt.executeUpdate();
        success = true;
    } catch (SQLException e) {
        System.out.println("SQLException: " + e.getMessage());
        System.out.println("SQLState: " + e.getSQLState());
        System.out.println("VendorError: " + e.getErrorCode());
    }
    return success;
}

//    get user by useremail and password 
    public User getUserByEmaiAndPassword(String email , String password) throws SQLException{
       
        User user = null;
        
        try {
              String query = "select * from user where email=? and password= ?";
        
        PreparedStatement pstmt = con.prepareStatement(query);
        
        pstmt.setString(1, email);
        pstmt.setString(2, password);
        
      ResultSet rs = pstmt.executeQuery();
      if(rs.next()){
          user = new User();
          
//          data from db

     String name = rs.getString("name"); // this is one method 
     user.setName(name); //         set to user object 


//      second method is 

    user.setId(rs.getInt("id"));
    user.setEmail(rs.getString("email"));
    user.setPassword(rs.getString("password"));
    user.setGender(rs.getString("gender"));
    user.setAbout(rs.getString("about"));
    user.setDateTime(rs.getTimestamp("rdate"));
    user.setProfile(rs.getString("profile"));
     }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return user;
    }
    
    
    
    public boolean updateUser(User user){
         boolean flag = false;
        try {
            String query = "update user set name=? , email=? , password=?, about=?, profile=?  where id=?";
        
            PreparedStatement pstmt = con.prepareStatement(query);
           
            pstmt.setString(1,user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
//            pstmt.setString(4,user.getGender());
            pstmt.setString(4, user.getAbout());
            pstmt.setString(5, user.getProfile());
            pstmt.setInt(6, user.getId());
              pstmt.executeUpdate();
            
            flag = true;
        System.out.println("Executing query: " + query);
        } catch (SQLException e) {
           e.printStackTrace();
        }
        
        return flag;
        
    }
    
}
