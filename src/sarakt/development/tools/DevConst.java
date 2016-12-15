package sarakt.development.tools;

public class DevConst {

	// Columns
	public static final int FIRST_COLUMN = 1;
	public static final int SECOND_COLUMN = 2;
	
	// Selects
	public static final String SELECT_ALL = "SELECT * FROM %s";
	public static final String SELECT_MAX = "SELECT max(%s) from %s;";

	// Columns
	public static final String COLUMN_ID_CLASSES = "id_classes";
	public static final String INSERT_NEW_CLASS = "INSERT INTO %s VALUES(?, ?);";

}
