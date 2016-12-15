package sarakt.exceptions;

public class InvalidClassException extends SomethingGoesWrongException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3310337033279613583L;

	public InvalidClassException(Exception exception) {
		super(exception);
	}

	public InvalidClassException(String errorMessage, Exception exception) {
		super(errorMessage, exception);
	}

	public InvalidClassException(String errorMessage) {
		super(errorMessage);
	}

}
