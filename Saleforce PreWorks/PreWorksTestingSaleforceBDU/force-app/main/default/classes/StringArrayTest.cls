public with sharing class StringArrayTest {

    public static List<String> generateStringArray(Integer n) {
        List<String> Test = new List<String>();
        for (Integer i=0; i<n;i++) {
            Test.add('Test ' + i);
            system.debug(Test[i]);
        }

        return Test;
    }
}