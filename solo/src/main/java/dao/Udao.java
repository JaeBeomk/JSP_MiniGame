package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.jdbc.Driver;

import dto.User;

public class Udao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public Udao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/solo?" + "useUnicode=true&characterEncoding=UTF-8";
			String dbUser = "soloid";
			String dbPass = "solopw";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}
	//삭제 한다...
	public void uDelete(String uid) throws SQLException  {
		System.out.println("aeiou");
		
		pstmt = conn.prepareStatement(
				"DELETE FROM user WHERE userID=?");
		pstmt.setString(1, uid);
		System.out.println(pstmt+"삭제드가자~~");
		int result=pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		
		pstmt.close();
		conn.close();
	}
	// 검색처리
	public User uSelect(String uid) throws SQLException {

		pstmt = conn.prepareStatement("SELECT * FROM user WHERE userID=?");
		pstmt.setString(1, uid);
		System.out.println(pstmt);
		rs = pstmt.executeQuery();
		System.out.println(rs);
		User u = new User();
		if (rs.next()) {
			u.setUserID(rs.getString("userID"));
			u.setUserPassword(rs.getString("userPassword"));
			u.setUserName(rs.getString("userName"));
			u.setUserEmail(rs.getString("userEmail"));
		}
		pstmt.close();
		conn.close();
		rs.close();
		return u;
	}

	// 회원 수정
	public void uUpdate(User u) {
		
		 try { 
			pstmt = conn.prepareStatement(
			"update user set userPassword=?,userName=?,userEmail=? where userID=?");
			pstmt.setString(1, u.getUserPassword()); 
			pstmt.setString(2, u.getUserName());
			pstmt.setString(3, u.getUserEmail()); 
			pstmt.setString(4, u.getUserID());
			pstmt.executeUpdate();
			System.out.println(pstmt + "<-- pstmt"); 
			}
			 catch(Exception e){
				 
			 e.printStackTrace(); 
		 }
		 
	}

	// 회원가입
	public int join(User in) {
		try {
			pstmt = conn.prepareStatement("insert into user values(?,?,?,?,?)");
			pstmt.setString(1, in.getUserID());
			pstmt.setString(2, in.getUserPassword());
			pstmt.setString(3, in.getUserName());
			pstmt.setString(4, in.getUserGender());
			pstmt.setString(5, in.getUserEmail());
			System.out.println(pstmt + "<-- pstmt");
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 로그인 처리
	public int login(String id, String pw) {
		try {
			pstmt = conn.prepareStatement("SELECT userPassword FROM USER WHERE userID =?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			System.out.println(pstmt + "<-- pstmt");
			System.out.println(rs + "<-- rs");
			if (rs.next()) {
				if (rs.getString(1).equals(pw)) {
					return 1;
				} else {
					return 0;
				}
			} else {
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
}
