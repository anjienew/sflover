public class StringArrayTest {
    public static List<String> generateStringArray(Integer n){

        List<String> testN = new List<String>();
        for (integer i=0;i<n;i++)
        {
            testN.add('Test '+i);
            System.debug(testN[i]);
        }
      return testN;
    }
}