package sarakt.development.addingData;

import sarakt.exceptions.InitializationException;
import sarakt.exceptions.ModificationException;
import sarakt.tools.Checkers;

public class GameClass extends ArticleToAdd {

	private static final String CANNOT_APPLY_ROLE = "Cannot apply role";
	private String mainRole;
	private String secRole;

	protected GameClass(String name) throws InitializationException {
		super(name);
	}

	public GameClass(String name, int id) throws InitializationException {
		super(name, id);
	}

	public GameClass(String name, int id, String description) throws InitializationException {
		super(name, id, description);
	}

	public String getMainRole() {
		return mainRole;
	}

	public void setMainRole(String mainRole) throws ModificationException {
		if (Checkers.invalidText(mainRole)) {
			throw new ModificationException(CANNOT_APPLY_ROLE);
		}
		this.mainRole = mainRole;
	}

	public String getSecondaryRole() {
		return secRole;
	}

	public void setSecondaryRole(String secondaryRole) throws ModificationException {
		if (Checkers.invalidText(secondaryRole)) {
			throw new ModificationException(CANNOT_APPLY_ROLE);
		}
		this.secRole = secondaryRole;
	}

}
