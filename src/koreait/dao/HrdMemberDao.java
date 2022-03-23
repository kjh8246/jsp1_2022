package koreait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day1.OracleConnectUtil;
import koreait.vo.HrdMember;

public class HrdMemberDao {
		private static HrdMemberDao dao = new HrdMemberDao();
		private HrdMemberDao() {}
		public static HrdMemberDao getInstance() {
			return dao;
		}
		
		public HrdMember selectOne(int custno) {   //기본키 값으로 조회
			Connection conn=OracleConnectUtil.connect();
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			String sql="select * from member_tbl_02 where custno = ?";
			HrdMember result = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, custno);
				rs = pstmt.executeQuery();
				
				if(rs.next())
					result = new HrdMember(rs.getInt(1), 
							rs.getString(2), 
							rs.getString(3), 
							rs.getString(4), 
							rs.getDate(5), 
							rs.getString(6), 
							rs.getString(7));
				pstmt.close();
			}catch (SQLException e) {
				System.out.println("HrdMemberDao selectOne 오류 : " + e.getMessage());
			}
			
			OracleConnectUtil.close(conn);
			return result;
		}
		
		
		public List<HrdMember> selectAll(){
			Connection conn = OracleConnectUtil.connect();
			ResultSet rs =null;
			PreparedStatement pstmt=null;
			String sql = "select * from member_tbl_02";
			List<HrdMember> list = new ArrayList<HrdMember>();
			try {
				pstmt = conn.prepareStatement(sql);
				//매개변수 값이 필요없는 sql : set메소드 없음.
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					//테이블 조회된 컬럼을 자바 객체로 생성해서 저장.(매핑)
					list.add(new HrdMember(rs.getInt(1), 
							rs.getString(2), 
							rs.getString(3), 
							rs.getString(4), 
							rs.getDate(5), 
							rs.getString(6), 
							rs.getString(7)));
				}
				
			}catch (SQLException e) {
				System.out.println("HrdMemberDao selectAll 오류 : " + e.getMessage());
			}
			
			return list;
		}
		
}
