
    import java.security.NoSuchAlgorithmException;

    public class Calculator {

        public static void main(String[] args) {
            // write your code here
        }

        public static int sum(int a, int b) {
            return a + b;
        }

        public static int sub(int a, int b) {
            return a - b;
        }

        public static int mul(int a, int b) {
            return a * b;
        }

        public static int divide(int a, int b) throws NoSuchAlgorithmException {
            if (b == 0) {
                throw new NoSuchAlgorithmException();
            }
            return a / b;
        }
    }
