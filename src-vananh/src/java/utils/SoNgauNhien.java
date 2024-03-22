package utils;

import java.util.Random;

/**
 * Utility class for generating random numbers.
 * Created by Van Anh.
 */
public class SoNgauNhien {

    private static final Random random = new Random();

    /**
     * Generates a random integer between 0 (inclusive) and the specified bound (exclusive).
     * @param bound the upper bound (exclusive) for the random number
     * @return the generated random integer
     */
    public static int generateRandomInteger(int bound) {
        return random.nextInt(bound);
    }

    /**
     * Generates a random 6-digit verification code as a String.
     * @return the generated verification code
     */
    public static String generateVerificationCode() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            sb.append(generateRandomInteger(10));
        }
        return sb.toString();
    }
    
    // Additional random number generation methods can be added here
}
