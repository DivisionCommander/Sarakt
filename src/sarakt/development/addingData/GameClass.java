package sarakt.development.addingData;

import sarakt.exceptions.ModificationException;
import sarakt.tools.Checkers;
import sarakt.tools.Constants;

public class GameClass extends ArticleToAdd {

	private int id;
	private String desc;

	public GameClass(String name, int id)  {
		super(name, id);
	}

	public void addDescription(String description) {
		if (!Checkers.invalidText(description)) {
			this.desc = (description);
		}
	}

	public String getName() {
		return this.name;
	}

	public int getID() {
		return this.id;
	}

	protected void setID(int id) throws ModificationException {
		if (id < Constants.ZERO) {
			throw new ModificationException("Cannot set negative ID");
		}
		this.id = id;
	}
}
