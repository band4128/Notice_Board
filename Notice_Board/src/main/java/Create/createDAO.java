package Create;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class createDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

	// 생성자
	public createDAO() {
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

	// insert(생성)
	public void CreateInsert(createDTO createdto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into notice values ((select NVL(max(notice_no), 0) + 1 from notice), ?, ?, ?)";

		conn = getConnection();

		try {
			// ?에 대한 바인딩
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, createdto.getTitle());
			pstmt.setString(2, createdto.getName());
			pstmt.setString(3, createdto.getContent());

			// update
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

// Connection : DB 연결
// PreparedStatement : 파라미터화 된 Sql를 실행
// ResultSet : sql 실행 후 반환된 데이터를 처리하는 객체