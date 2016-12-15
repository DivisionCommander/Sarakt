package sarakt.game.characters;

import sarakt.exceptions.InitializationException;
import sarakt.exceptions.SomethingGoesWrongException;
import sarakt.tools.Checkers;
import sarakt.tools.Constants;

public abstract class GameCharacter {

	private String name;
	private String classname;
	private String title;

	//
	private long expericence;
	private int money;
	//
	// private int hitPoints;
	// private int actingPoints;
	//
	// private int strength;
	// private int dexterity;
	// private int vitality;
	// private int stamina;
	// private int willpower;
	// private int wisdom;
	// private int intellect;
	// private int spirit;

	// Constructor for new characters!
	public GameCharacter(String name, String className) throws SomethingGoesWrongException {
		try {
			if (!this.changeName(name)) {
				throw new InitializationException("Unallowed name!");
			}
			if (!this.changeClass(className)) {
				throw new InitializationException("Invalid Class!");
			}

			this.title = Constants.EMPTY_TITLE;
			this.money = Constants.ZERO;
			this.expericence = Constants.ZERO;
		} catch (Exception exc) {
			throw new SomethingGoesWrongException("Cannot create character!", exc);
		}
	}

	// Constructor for existing characters!
	public GameCharacter(String name, String className, String title) throws SomethingGoesWrongException {
		this(name, className);
		try {
			if (!this.applyTitle(title)) {
				throw new InitializationException("Cannot asign such title!");
			}
		} catch (Exception exc) {
			throw new SomethingGoesWrongException("Unable to build character!", exc);
		}
	}

	public void increaseExperience(long recievedExperience) {
		if (recievedExperience > Constants.ZERO) {
			this.expericence += recievedExperience;
		}
	}

	public boolean applyTitle(String newTitle) {
		if (Checkers.isValidTitle(newTitle)) {
			this.title = newTitle;
			return true;
		}
		return false;
	}

	public boolean changeClass(String classname) {
		if (Checkers.isValidClass(classname)) {
			this.classname = classname;
			return true;
		}
		return false;
	}

	public boolean changeName(String newName) {
		if (Checkers.isValidName(newName)) {
			this.name = newName;
			return true;
		}
		return false;
	}

	public String getTitle() {
		return this.title;
	}

	public String getName() {
		return this.name;
	}

	public String getClassname() {
		return this.classname;
	}

	public long getCharacterExcperience() {
		return this.expericence;
	}

	public int getCharacterMoney() {
		return this.money;
	}

	public GameCharacter() {
	}
}
