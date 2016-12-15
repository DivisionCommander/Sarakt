package sarakt.development.printers;

import sarakt.development.addingData.ArticleToAdd;
import sarakt.exceptions.SomethingGoesWrongException;

public class PrinterAbility extends DBPrinter {
	

	protected PrinterAbility() throws SomethingGoesWrongException {
		super();
	}

	@Override
	protected void printToDB(ArticleToAdd article) throws SomethingGoesWrongException {
		// TODO Auto-generated method stub

	}

	@Override
	protected void buildList() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	protected boolean checkIfContain(ArticleToAdd newEntry) {
		// TODO Auto-generated method stub
		return false;
	}

}
