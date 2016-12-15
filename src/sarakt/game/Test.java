package sarakt.game;

import java.sql.Connection;
import java.sql.PreparedStatement;

import sarakt.tools.DBConnection;

public class Test {
	
	
	public static void main(String[] args) throws Exception  {
		Connection con = DBConnection.getConnection().getDBConnection();
		PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO abilities VALUE(?,?,null, null)");
		preparedStatement.setInt(1, 0);
		preparedStatement.setString(2, "Strength");
		preparedStatement.executeUpdate();
		
	}
	
}
