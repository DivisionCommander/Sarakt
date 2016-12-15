package sarakt.development.printers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public final class PrinterDBConnection {

	private static PrinterDBConnection connection;
	private Connection mainConnection;

	private static final String JDBC_MYSQL = "jdbc:mysql://";
	private static final String DB_HOSTNAME = "localhost";
	private static final String DB_PORT = "3306";
	private static final String DATABASE = "game";
	private static final String DB_USER = "Byzantian";
	private static final String DB_PASSWORD = "Bl@ckW@tch";

	private Connection getDBConnection() {

		return mainConnection;
	}

	public static synchronized Connection GetPrinterConnection() {
		return PrinterDBConnection.connection.getDBConnection();
	}

	private PrinterDBConnection() {

		Properties properties = new Properties();
		properties.setProperty("user", DB_USER);
		properties.setProperty("password", DB_PASSWORD);
		properties.setProperty("useSSL", "false");
		properties.setProperty("autoReconnect", "true");
		String url = JDBC_MYSQL + DB_HOSTNAME + ":" + DB_PORT + "/" + DATABASE;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.mainConnection = DriverManager.getConnection(url, properties);

		} catch (Exception exc) {
			System.out.println("Cannot open connection!");
			exc.printStackTrace();
		}
	}
}
