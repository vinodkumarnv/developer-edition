Public class jsonuntyped
{
      public void abc()
      {
        String jsonInput = '{\n' +
        ' "description" :"An appliance",\n' +
        ' "accessories" : [ "powerCord", ' + 
          '{ "right":"door handle1", ' + 
            '"left":"door handle2" } ],\n' +
        ' "dimensions" : ' + 
          '{ "height" : 5.5 , ' + 
            '"width" : 3.0 , ' + 
            '"depth" : 2.2 },\n' +
        ' "type" : null,\n' +
        ' "inventory" : 2000,\n' +
        ' "price" : 1023.45,\n' +
        ' "isShipped" : true,\n' +
        ' "modelNumber" : "123"\n' +
        '}';
        
        Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(jsonInput);
        
        System.assertEquals('An appliance', m.get('description'));
                
        List<Object> a = (List<Object>)m.get('accessories');
        System.assertEquals('powerCord', a[0]);        
        Map<String, Object> a2 = (Map<String, Object>)a[1];
        System.assertEquals('door handle1', a2.get('right'));
        System.assertEquals('door handle2', a2.get('left'));
        
        Map<String, Object> dim = (Map<String, Object>)m.get('dimensions');
        System.assertEquals(5.5, dim.get('height'));
        System.assertEquals(3.0, dim.get('width'));
        System.assertEquals(2.2, dim.get('depth'));
                
        System.assertEquals(null, m.get('type'));
        System.assertEquals(2000, m.get('inventory'));
        System.assertEquals(1023.45, m.get('price'));
        System.assertEquals(true, m.get('isShipped'));
        System.assertEquals('123', m.get('modelNumber'));
        
    }
}