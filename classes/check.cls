public class check{
public static void GetAllEmails(String a_Value)
{
    final String EMAIL_PATTERN = '[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@'
        + '[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})';

    List<String> result = null;

    Matcher m =  Pattern.compile(EMAIL_PATTERN).matcher(a_Value);

    if (m.find())
    {
        result = new List<String>();
        result.add(m.group());

        while(m.find())
        {
            result.add(m.group());
        }
    }
    System.debug('asdfg777777777777777asdfg '+result);
}
}