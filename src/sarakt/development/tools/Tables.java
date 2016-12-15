package sarakt.development.tools;

public enum Tables {
	
	ABILITIES("Ability", "abilities"),
	CHARACTERS("Character", "characters"),
	CLASSES("Class", "character_classes"),
	CHAR_TYPES("Type Char", "character_types"),
	CLASS_TYPES("Type Class", "class_types"),
	SKILLS("Skill", "skills");

	private final  String visualName;
	private final  String columnName;
	
	private Tables(String visual, String column){
		this.visualName = visual;
		this.columnName = column;
	}
	
	public String table(){
		return this.columnName;
	}
	public String getDisplay(){
		return this.visualName;
	}
}
