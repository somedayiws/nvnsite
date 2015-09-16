package controller;

import java.util.Random;

public class RandomPassword {
	public static String password() {
		String password = "";
		for(int i=0;i<6;i++){
			int tmp = rand(0, 1);
			if(tmp==0){
				password += randomCharacter();
			}
			else{
				password +=rand(0, 10);
			}
		}
		return password;
	}
	 public static int rand(int min, int max) {
	        try {
	            Random rn = new Random();
	            int range = max - min + 1;
	            int randomNum = min + rn.nextInt(range);
	            return randomNum;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return -1;
	        }
	    }
	 public static char randomCharacter() {
	        Random r = new Random();
	        char c = (char) (r.nextInt(26) + 'A');
	        return c;
	    }

}
