package Assignment2;
import java.util.Random;

public class test{
	private static Random rnd = new Random();

	public static void main(String[] args)
	{
		ApparatusType test = ApparatusType.rndApparatus();
		System.out.println(test);
	}	
}
