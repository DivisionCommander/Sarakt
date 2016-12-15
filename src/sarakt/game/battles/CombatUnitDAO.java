package sarakt.game.battles;

import sarakt.tools.Constants;

public class CombatUnitDAO {

	public static boolean isFirstSlower(CombatUnit first, CombatUnit second	){
		int difference = first.getQuickness() - second.getQuickness();
		while(difference == Constants.ZERO){
			difference = (int)(((first.getQuickness() * Math.random())) - (second.getQuickness()*Math.random()));
		}
		return ((difference < 0)? true : false);
	}
}
