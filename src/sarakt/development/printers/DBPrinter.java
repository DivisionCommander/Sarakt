package sarakt.development.printers;

import java.sql.Connection;

import sarakt.development.addingData.ArticleToAdd;
import sarakt.exceptions.SomethingGoesWrongException;

public abstract class DBPrinter {
	protected static final String FAILED_TO_BUILD = "Failed to build List: ";
	protected Connection connection;
	
	
	protected DBPrinter() throws SomethingGoesWrongException{
		try{
			this.connection = PrinterDBConnection.GetPrinterConnection();
			
		} catch (Exception exc){
			throw new SomethingGoesWrongException("Cannot initialize DB Printer!", exc);
		}
	}
	
	protected abstract void printToDB(ArticleToAdd article) throws SomethingGoesWrongException;
	protected abstract void buildList() throws Exception;
	protected abstract boolean checkIfContain(ArticleToAdd newEntry);

	
}
