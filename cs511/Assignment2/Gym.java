package Assignment2;
import Assignment2.WeightPlateSize;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.util.concurrent.*;

public class Gym implements Runnable
{
	private static final int GYM_SIZE = 30;
	private static final int GYM_REGISTERED_CLIENTS = 10000;
	private Map<WeightPlateSize, Integer> noOfWeightPlates;
	private Set<Integer> clients; //generating fresh client ids
	private ExecutorService executor;
	private Semaphore example;


	public void run()
	{

	}

	public Gym()
	{

	}
}
