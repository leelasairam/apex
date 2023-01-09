Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id,Name FROM Account LIMIT 3]);

for(Id key: accountMap.keySet()){
    System.debug('key : '+key+' '+'Account: ' + accountMap.get(key).name);
}

list <Account> A=[SELECT Id,Name FROM Account LIMIT 3];
system.debug(A[0]);