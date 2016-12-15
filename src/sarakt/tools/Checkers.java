package sarakt.tools;

public final class Checkers {

	public static boolean isValidName(String name) {
		if (Checkers.invalidText(name)) {
			return false;
		}
		if (name.length() > Constants.MAXIMAL_NAME_LENGHT) {
			return false;
		}
		String checked = name.replaceAll(Constants.DISALLOWED_CHARACTERS, Constants.BLOCK_CHARACTER);
		if (checked.contains(Constants.BLOCK_CHARACTER)) {
			return false;
		}
		return true;
	}

	// ToDo: Extract available from DB
	public static boolean isValidTitle(String name) {
		if (Checkers.invalidText(name)) {
			return false;
		}
		if (name.length() > Constants.MAXIMAL_NAME_LENGHT) {
			return false;
		}

		// Check for disallowed characters; disallowed outside are
		// [^-a-zA-Z\\s]";
		String checked = name.replaceAll(Constants.DISALLOWED_CHARACTERS, Constants.BLOCK_CHARACTER);
		if (checked.contains(Constants.BLOCK_CHARACTER)) {
			return false;
		}
		return true;
	}

	// ToDo: Extract available from DB
	public static boolean isValidClass(String name) {
		if (Checkers.invalidText(name)) {
			return false;
		}
		if (name.length() > Constants.MAXIMAL_NAME_LENGHT) {
			return false;
		}

		// Check for disallowed characters; disallowed outside are
		// [^-a-zA-Z\\s]";
		String checked = name.replaceAll(Constants.DISALLOWED_CHARACTERS, Constants.BLOCK_CHARACTER);
		if (checked.contains(Constants.BLOCK_CHARACTER)) {
			return false;
		}
		return true;
	}

	public static boolean invalidText(String string) {
		if (string == null) {
			return true;
		}
		if (string.length() == Constants.ZERO) {
			return true;
		}
		return false;

	}

	private Checkers() {
	}
}
