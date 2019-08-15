public class testCaller {
    
    public void testo()
    {
        List<String> ls = new List<String>();
        ls.add('a');
        ls.add('b');
        
        testReceiver tr = new testReceiver();
        tr.testo(ls);
        System.debug('ls:'+ls);
            
    }    

}