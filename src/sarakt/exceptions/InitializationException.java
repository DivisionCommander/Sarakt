package sarakt.exceptions;

public class InitializationException extends SomethingGoesWrongException {
	


	/**
	 * 
	 */
	private static final long serialVersionUID = -1623221629946540668L;

	public InitializationException(Exception exception) {
		super(exception);
	}

	public InitializationException(String errorMessage, Exception exception) {
		super(errorMessage, exception);
	}

	public InitializationException(String errorMessage) {
		super(errorMessage);
	}

}
