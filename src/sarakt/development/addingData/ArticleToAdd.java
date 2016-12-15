package sarakt.development.addingData;

import sarakt.exceptions.InitializationException;
import sarakt.exceptions.ModificationException;
import sarakt.tools.Checkers;

public abstract class ArticleToAdd {
	
	private final static String CANNOT_ADD = "Cannot add article with name %s";

	private static final int INITIAL_ID = -1;
	
	protected final String name;
	protected int id;
	protected String desc;

	protected ArticleToAdd(String name) throws InitializationException{
		if (Checkers.isValidName(name)){
			this.name = name;
			
		} else{
			throw new InitializationException(String.format(CANNOT_ADD, name));
		}
		this.desc = name;
		this.id = INITIAL_ID;
	}

	protected ArticleToAdd(String name, int id) throws InitializationException{
		this(name);
		this.id = id;
	}

	protected ArticleToAdd(String name, int id, String description)throws InitializationException{
		this(name, id);
		if (!Checkers.invalidText(description)){
			this.desc = description;
		}
	}
	
	public String getName() {
		return this.name;
	}

	public int getID() {
		return this.id;
	}

	public void addDescription(String description) throws ModificationException {
		if (Checkers.invalidText(description)) {
			throw new ModificationException("Invalid description");
		}
		this.desc = description;
	}

	public String getDescription() {
		return this.desc;
	}
}
