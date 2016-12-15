package sarakt.exceptions;

public class ModificationException extends SomethingGoesWrongException {



	/**
	 * 
	 */
	private static final long serialVersionUID = 6979463557160138475L;

	public ModificationException(Exception exception) {
		super(exception);
		// TODO Auto-generated constructor stub
	}

	public ModificationException(String errorMessage, Exception exception) {
		super(errorMessage, exception);
		// TODO Auto-generated constructor stub
	}

	public ModificationException(String errorMessage) {
		super(errorMessage);
		// TODO Auto-generated constructor stub
	}

}
