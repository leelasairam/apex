Map<Integer, String> m1 = new Map<Integer, String>();
m1.put(1, 'First item');
m1.put(2, 'Second item');
List<String> l1 = new List<String>();
l1.add('First item');
l1.add('Second item');
//System.debug(m1);
//System.debug(l1);
List<Account> ls = [select Id,Name from Account Limit 5];
Map<Id, Account> m = new Map<Id, Account>(ls);
for(Id i : m.keySet()){
    system.debug(m.get(i).Name);
}


Map<String, String> countriesToCapitals = new Map<String, String> {
    'England' => 'London',
    'USA' => 'Washington',
    'Netherlands' => 'Amsterdam'
  };
  
String dutchCapital = contriesToCapitals.get('Netherlands'); // Get the value of the key "Netherlands" which sets the String as "Amsterdam".
  
 System.debug(dutchCapital);



 
List<Account> ls = [select Id,Name from Account Limit 5];
Map<Id, Account> m = new Map<Id, Account>(ls);
system.debug(m);
String jsonString = JSON.serialize(m);
System.debug(jsonString);

Map<Id,SObject>deserializedAcc = (Map<Id,SObject>) JSON.deserialize(jsonString, Map<Id, SObject>.class);
System.debug(deserializedAcc);



String jsonInput = '{"item": 4, "change":  "40", "limit": 400}';  
Map<String, Object> m =   (Map<String, Object>) JSON.deserializeUntyped(jsonInput);
System.debug(m);
Object i = m.get('item');
System.debug(i);
Integer a =  (Integer)m.get('item');
System.debug('item:' + a); 
String c = (String)m.get('change');
System.debug('change:' + c);



String payload = '{"data": [{"s": "a", "i": 1}]}';
Map<String, Object> deserialized = (Map<String, Object>)JSON.deserializeUntyped(payload);
List<Map<String, Object>> data = new List<Map<String, Object>>();
for (Object instance : (List<Object>)deserialized.get('data')){
    system.debug(instance);
    data.add((Map<String, Object>)instance); 
}
system.debug(data);