import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MainClass {
	static final String driver = "oracle.jdbc.OracleDriver";
	static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	static final String id = "test";
	static final String pw = "1234";
	
	public static void main(String[] args){
		try {
			//addData();
			//modData();
			delData();
			getData();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public static void addData() throws Exception  {
		
		// JDBC 드라이브 로딩
		Class.forName(driver);
		
		// 오라클 접속
		Connection db = DriverManager.getConnection(url, id, pw);
		
		
		// 쿼리문
		String sql = "insert into test_table (f_idx, f_num, f_str) values (test_seq.nextval,?,?)";
		
		// 쿼리 준비
		PreparedStatement pstmt = db.prepareStatement(sql);
		
		pstmt.setInt(1, 100);//? 1번에 100 세팅
		pstmt.setString(2, "Hello"); //? 2번에 문자열 세팅
		pstmt.execute(); //실행
		
		pstmt.setInt(1, 200);//? 1번에 100 세팅
		pstmt.setString(2, "World"); //? 2번에 문자열 세팅
		pstmt.execute(); //실행
		
		pstmt.close();
		db.close(); // 디비 접속 해제
		
		System.out.println("저장완료");
	}	
	
	public static void getData() throws Exception  {
		Class.forName(driver);
		Connection db = DriverManager.getConnection(url, id, pw);
		
		String sql = "select f_idx, f_num, f_str from test_table";
		
		PreparedStatement stmt = db.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			int idx = rs.getInt("f_idx");
			int num = rs.getInt("f_num");
			String str = rs.getString("f_str");
			
			System.out.printf("%d, %d, %s\n", idx, num, str);
		}
		stmt.close();
		db.close();
		
		
	}
	public static void modData()throws Exception {
		Class.forName(driver);
		Connection db = DriverManager.getConnection(url, id, pw);
		
		String sql = "update test_table set f_num = ?, f_str = ? where f_idx = ?";
		
		PreparedStatement stmt = db.prepareStatement(sql);
		
		stmt.setInt(1, 1000);
		stmt.setString(2, "기러기");
		stmt.setInt(3, 1);
		stmt.executeUpdate(); // 실행
		
		stmt.close();
		db.close();
	}
	public static void delData()throws Exception {
		Class.forName(driver);
		Connection db = DriverManager.getConnection(url, id, pw);
		
		String sql = "delete from test_table where f_idx = ?";
		
		PreparedStatement stmt = db.prepareStatement(sql);
		
		stmt.setInt(1, 4);
	    stmt.executeUpdate();//실행
		stmt.close();
		db.close();
	}
}
