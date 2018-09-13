package Assignment2;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

public class Client
{
	private int id;
	private List<Exercise> routine;

	public Client(int id)
	{
		this.id = id;
		routine = new ArrayList<>();
	}

	public void addExercise(Exercise e)
	{
	 	routine.add(e); 
	}

	public static Client generateRandom(int id, Map<WeightPlateSize, Integer> noOfWeightPlates)
	{
		//todo: impement
		return null;
	}
}
