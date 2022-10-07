import java.security.NoSuchAlgorithmException;

public class Test {
    public static void main(String[] args) {
        System.out.println("Tổng 2 số: " + Calculator.sum(5, 9));
        System.out.println("Hiệu 2 số: " + Calculator.sub(5, 9));
        System.out.println("Tích 2 số: " + Calculator.mul(5, 9));
        try {
            System.out.println("Thương 2 số: " + Calculator.divide(10, 5));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
}
