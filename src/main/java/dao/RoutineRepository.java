package dao;

import java.util.ArrayList;
import dto.Routine;

public class RoutineRepository {
	private ArrayList<Routine> listOfRoutines = new ArrayList<Routine>();
	private static RoutineRepository instance = new RoutineRepository();
	
	public static RoutineRepository getInstance() {
		return instance;
	}
	
	public RoutineRepository() {
		Routine number1 = new Routine("R1", "런닝머신");
		number1.setMinutes(60);
		number1.setSeconds(30);
		number1.setMemo1("속도 4");
		number1.setMemo2("경사 5");
		
		Routine number2 = new Routine("R2", "레그 익스텐션");
		number2.setNumber(15);
		number2.setSets(3);
		number2.setMemo1("의자 3");
		
		listOfRoutines.add(number1);
		listOfRoutines.add(number2);
	}
	
	public void addRoutine(Routine routine) {
		listOfRoutines.add(routine);
	}
	
	public ArrayList<Routine> getAllRoutines() {
		return listOfRoutines;
	}
	
	public Routine getRoutineById(String routineId) {
		Routine routineById = null;
		
		for (int i = 0; i < listOfRoutines.size(); i++) {
			Routine routine = listOfRoutines.get(i);
			if (routine != null && routine.getId() != null && routine.getId().equals(routineId)) {
				routineById = routine;
				break;
			}
		}
		return routineById;
	}
}
