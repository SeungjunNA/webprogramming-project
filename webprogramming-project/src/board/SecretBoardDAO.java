package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SecretBoardDAO {
	private Connection conn;
	private ResultSet rs;

	public SecretBoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/WEB_PROJECT";
			String dbID = "root";
			String dbPassword = "nsj0316";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public int getNext() {
		String SQL = "SELECT boardID FROM SECRETBOARD ORDER BY boardID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int write(String boardTitle, String userID, String boardContent) {
		String SQL = "INSERT INTO SECRETBOARD VALUES(?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<SecretBoard> getList(int pageNumber) {
		String SQL = "SELECT * FROM SECRETBOARD WHERE boardID < ? ORDER BY boardID DESC LIMIT 10";
		ArrayList<SecretBoard> list = new ArrayList<SecretBoard>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SecretBoard secretBoard = new SecretBoard();
				secretBoard.setBoardID(rs.getInt(1));
				secretBoard.setBoardTitle(rs.getString(2));
				secretBoard.setUserID(rs.getString(3));
				secretBoard.setBoardDate(rs.getString(4));
				secretBoard.setBoardContent(rs.getString(5));
				list.add(secretBoard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM SECRETBOARD WHERE boardID < ? AND ORDER BY boardID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public SecretBoard getBoard(int boardID) {
		String SQL = "SELECT * FROM SECRETBOARD WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SecretBoard secretBoard = new SecretBoard();
				secretBoard.setBoardID(rs.getInt(1));
				secretBoard.setBoardTitle(rs.getString(2));
				secretBoard.setUserID(rs.getString(3));
				secretBoard.setBoardDate(rs.getString(4));
				secretBoard.setBoardContent(rs.getString(5));
				return secretBoard;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int boardID, String boardTitle, String boardContent) {
		String SQL = "UPDATE SECRETBOARD SET boardTitle = ?, boardContent = ? WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int boardID) {
		String SQL = "DELETE FROM SECRETBOARD WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<SecretBoard> getSearchList(int pageNumber, String searchText){
		ArrayList<SecretBoard> list = new ArrayList<SecretBoard>();
		String SQL = "SELECT * FROM SECRETBOARD WHERE boardID < ? AND boardTitle LIKE '%"+searchText+"%' ORDER BY boardID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SecretBoard secretBoard = new SecretBoard();
				secretBoard.setBoardID(rs.getInt(1));
				secretBoard.setBoardTitle(rs.getString(2));
				secretBoard.setUserID(rs.getString(3));
				secretBoard.setBoardDate(rs.getString(4));
				secretBoard.setBoardContent(rs.getString(5));
				list.add(secretBoard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
