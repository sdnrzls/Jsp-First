package com.address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AddressDAO {
	private  static AddressDAO 
	                     instance = new AddressDAO();
	
	public static AddressDAO getInstance() {
		return instance;
	}
	
	//��񿬰�
	private Connection getConnection() 
			      throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	}
	
	//�߰�
	public void addrInsert(Address ad) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con =getConnection();
			String sql ="insert into address "
					+ "values(address_seq.nextval,?,?,?,?)";
			ps= con.prepareStatement(sql);
			ps.setString(1, ad.getName());		
			ps.setString(2, ad.getZipcode());	
			ps.setString(3, ad.getAddr());	
			ps.setString(4, ad.getTel());	
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con,ps);
		}
		
	}
	
	
	//����
	public void addrUpdate(Address ad) {
		Connection con = null;
		PreparedStatement ps =null;
		
		try {
			con =getConnection();
			String sql = "update address "
					+ " set name=?, zipcode=?, addr =?, tel=?"
					+ " where num =? "; 
			ps = con.prepareStatement(sql);
			ps.setString(1, ad.getName());
			ps.setString(2, ad.getZipcode());
			ps.setString(3, ad.getAddr());
			ps.setString(4, ad.getTel());
			ps.setLong(5, ad.getNum());
			ps.executeUpdate();
		} catch (Exception e) {
				e.printStackTrace();
		}finally {
			closeConnection(con, ps);
		}
	}
	//�������ϱ�
	public int getCount(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		
		try {
			con = getConnection();
		    if(word.equals("")) {//�˻��� �ƴ�
		    	sql = "select count(*) from address";
		    }else { //�˻�
		    	sql = "select count(*) from address where "+field+"  like '%"+word+"%'";
		    }
		    st = con.createStatement();
		    rs = st.executeQuery(sql);
		    if(rs.next()) {
		    	count = rs.getInt(1);
		    }
		} catch (Exception e) {
				e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return count;
	}
	
	//��ü����
	public ArrayList<Address> addrList(String field, String word){
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Address> arr = new ArrayList<>();
		String sql ="";
		try {
			con = getConnection();
			if(word.equals("")) { //�˻��ƴ�
				sql ="select * from address";
			}else { //�˻�
				sql="select * from address where "+field+"  like '%"+word+"%'";
				//sql="select * from address where tel like '%010%'";
			}
			 
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Address ad= new Address();
				ad.setAddr(rs.getString("addr"));
				ad.setName(rs.getString("name"));
				ad.setNum(rs.getLong("num"));
				ad.setTel(rs.getString("tel"));
				ad.setZipcode(rs.getString("zipcode"));
				arr.add(ad);
			}
		} catch (Exception e) {
				e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return arr;
		
	}
	
	//�󼼺���
	public Address addrDetail(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Address ad= null;
		
		try {
			con = getConnection();
			String sql = "select * from address where num="+num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				ad =new  Address();
				ad.setAddr(rs.getString("addr"));
				ad.setName(rs.getString("name"));
				ad.setNum(rs.getLong("num"));
				ad.setTel(rs.getString("tel"));
				ad.setZipcode(rs.getString("zipcode"));
			}
		} catch (Exception e) {
				e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return ad;
	}
	
	
	//����
	public void addrDelete(int num) {
		Connection con = null;
		Statement st = null;
    	try {
			con = getConnection();
			String sql = "delete from address where num="+num;
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, null);
		}
	}
	//�����ȣ �˻�
	public ArrayList<ZipCodeBean>  zipcodeRead(String dong) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<ZipCodeBean> zipArr = new ArrayList<>();
		
		try {
			con = getConnection();
			//select * from zipcode where dong like '%����%';
			String sql="select * from zipcode "
					+ " where dong like '%"+dong+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ZipCodeBean zip = new ZipCodeBean();
				zip.setBunji(rs.getString("bunji"));
				zip.setDong(rs.getString("dong"));
				zip.setGugun(rs.getString("gugun"));
				zip.setSeq(rs.getInt("seq"));
				zip.setSido(rs.getString("sido"));
				zip.setZipcode(rs.getString("zipcode"));
				zipArr.add(zip);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return zipArr;
		
	}
	
	
	
	
	
	//�ݱ�
	private void closeConnection(Connection con, 
			     PreparedStatement ps) {
		try {
			if(ps!=null)  	ps.close();
			if(con!=null ) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private void closeConnection(Connection con, 
			Statement st , ResultSet  rs) {
		try {
			if(rs!=null) rs.close();
			if(st!=null)  	st.close();
			if(con!=null ) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
