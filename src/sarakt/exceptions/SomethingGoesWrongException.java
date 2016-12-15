package sarakt.exceptions;

public class SomethingGoesWrongException extends Exception {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4307441247112630756L;
	
	private Exception catchedException = null;
	private String catchedErrorMessage = null;
	
	public SomethingGoesWrongException() {
		super();
	}

	public SomethingGoesWrongException(String errorMessage, Exception exception) {
		super(errorMessage, exception);
		this.catchedException = exception;
		this.catchedErrorMessage = errorMessage;
	}

	public SomethingGoesWrongException(String errorMessage) {
		super(errorMessage);
		this.catchedErrorMessage = errorMessage;
	}

	public SomethingGoesWrongException(Exception exception) {
		super(exception);
		this.catchedException = exception;
	}
	
	public Exception rootOfProblem(){
		return this.catchedException;
	}
	public String errorMessage(){
		return this.catchedErrorMessage;
	}
}
