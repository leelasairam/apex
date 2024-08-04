```
String body;
list<AggregateResult>ContactsCount = [SELECT count(Id)Total,AccountId FROM Contact GROUP BY AccountId];
for(AggregateResult ar : ContactsCount){
    body += (String)ar.get('AccountId') + ',' + (Integer)ar.get('Total') + '\n';
}
String header = 'AccountId,Contacts Count\n';
String csvString = header + body;
Blob csvBlobSuccess = Blob.valueOf(csvString);
String csvBlobEncoded = EncodingUtil.base64Encode(csvBlobSuccess);
system.debug(csvBlobEncoded);
system.debug(EncodingUtil.base64Decode(csvBlobEncoded));
// Create and send the email message
Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
attachment.setFileName('Contacts Count.csv');
attachment.setBody(EncodingUtil.base64Decode(csvBlobEncoded));
Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
email.setToAddresses(new List<String>{ 'saikodavali49@gmail.com' });
email.setSubject('Report : Account wise contacts count');
email.setPlainTextBody('Please find attached the Report');
email.setFileAttachments(new List<Messaging.EmailFileAttachment>{ attachment });
Messaging.SendEmailResult[] results = Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ email });'

```
