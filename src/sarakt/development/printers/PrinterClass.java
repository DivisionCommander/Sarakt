package sarakt.development.printers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import sarakt.development.addingData.ArticleToAdd;
import sarakt.development.addingData.GameClass;
import sarakt.development.tools.*;
import sarakt.exceptions.*;

public class PrinterClass extends DBPrinter {

	private List<GameClass> classList;

	protected PrinterClass() throws SomethingGoesWrongException {
		super();
		try {
			this.classList = new ArrayList<GameClass>();
			this.buildList();
		} catch (Exception e) {
			throw new SomethingGoesWrongException();
		}
	}

	public boolean checkIfContain(ArticleToAdd newEntry) {
		try {
			if (newEntry == null) {
				throw new InvalidClassException("Nothing to check!");
			}
			if (!(newEntry instanceof GameClass)) {
				throw new InvalidClassException("Cannot check for such class");
			}
			for (GameClass gameClass : classList) {
				if (gameClass.getName().equalsIgnoreCase(newEntry.getName())) {
					return true;
				}
			}
			return false;
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
	}

	protected void buildList() throws SomethingGoesWrongException {
		try {
			PreparedStatement getData = this.connection
					.prepareStatement(String.format(DevConst.SELECT_ALL, Tables.CLASSES.table()));
			ResultSet result = getData.executeQuery();
			while (result.next()) {
				int id = result.getInt(DevConst.FIRST_COLUMN);
				String name = result.getString(DevConst.SECOND_COLUMN);
				this.classList.add(new GameClass(name, id));
			}
		} catch (Exception e) {
			throw new SomethingGoesWrongException(FAILED_TO_BUILD + Tables.CLASSES.getDisplay(), e);
		}

	}

	@Override
	protected void printToDB(ArticleToAdd article) throws SomethingGoesWrongException {
		try {
			GameClass newClass = null;
			if (article == null) {
				throw new ModificationException("Cannot find class!");
			}
			if (article instanceof GameClass) {
				newClass = (GameClass) article;
			} else {
				throw new InvalidClassException("Article is not supported class!");
			}

			if (this.checkIfContain(newClass)) {
				System.out.println("Already in list");
				return;
			}
			int indexOfNewClass = 0;
			String prepared = String.format(DevConst.SELECT_MAX, DevConst.COLUMN_ID_CLASSES, Tables.CLASSES.table());
			PreparedStatement inserting = this.connection.prepareStatement(prepared.toString());
			ResultSet result = inserting.executeQuery();
			if (result.next()) {
				indexOfNewClass = result.getInt(DevConst.FIRST_COLUMN);
				indexOfNewClass++;
			}
			prepared = String.format(DevConst.INSERT_NEW_CLASS, Tables.CLASSES.table());
			inserting = this.connection.prepareStatement(prepared);
			inserting.setInt(DevConst.FIRST_COLUMN, indexOfNewClass);
			inserting.setString(DevConst.SECOND_COLUMN, newClass.getName());
			System.out.println(inserting.executeUpdate());
		} catch (Exception exc) {
			System.out.println("ka-buuuuum");
			throw new SomethingGoesWrongException("Fail to add into DB", exc);
		}

	}
}
