package Delete;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class deleteDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

	// 생성자
	public deleteDAO() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// connection (데이터 베이스 연결)
	public Connection getConnection() {
		Connection conn = null;

		try {
			conn = DriverManager.getConnection(url, "hr", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	// delete (삭제)
	public void Delete(deleteDTO deletedto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from notice where notice_no = ?";
		conn = getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, deletedto.getNotice_no());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}
}


//Connection : DB 연결
//PreparedStatement : 파라미터화 된 Sql를 실행
//ResultSet : sql 실행 후 반환된 데이터를 처리하는 객체
