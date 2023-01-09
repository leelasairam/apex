//Server

@RestResource(urlMapping='/getLead/*')
global class WSClass {
    @HttpGet
    global static Lead getCaseById() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String LeadId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Lead val =  [SELECT id, Name FROM Lead WHERE Id = :LeadId];
        return val;
    }
}


//Client

public class WSClasssClient {
    public static void getLead(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://cunning-moose-jiskq7-dev-ed.my.salesforce.com/services/oauth2/token?grant_type=password&client_id=3MVG9fe4g9fhX0E6XtrGDRVSeePrH8fHqultTRrjRUwtpEal1x9KnB3mLpm27OFaKa91PnoAkDkrs5011gZxu&client_secret=D7D0D1D5E5BC3CD605F02D5EC613E343C185223B1AB067170C973B15FDFF0892&username=saikodavali0948@cunning-moose-jiskq7.com&password=12345HCL@.com');
        req.setMethod('POST');
        HttpResponse res = new HttpResponse();
        res=http.send(req);
        system.debug(res.getBody());
        Oauth objAuthInfo = (Oauth)JSON.deserialize(res.getBody(), Oauth.class);
        if(objAuthInfo != null){
            Http httpnew = new Http();
            HttpRequest reqnew = new HttpRequest();
            reqnew.setEndpoint('https://cunning-moose-jiskq7-dev-ed.my.salesforce.com/services/data/v55.0/query/?q=SELECT+Id,name+from+Account+LIMIT+5');
            //reqnew.setEndpoint('https://cunning-moose-jiskq7-dev-ed.my.salesforce.com/services/apexrest/getLead/00Q5g000007HgNeEAK');
            reqnew.setMethod('GET');
            reqnew.setHeader('Content-Type', 'application/json;charset=UTF-8');
            reqnew.setHeader('Authorization', 'Bearer '+objAuthInfo.access_token);
            HttpResponse resnew = new HttpResponse();
            resnew=httpnew.send(reqnew);
            Object A = resnew.getBody();
            system.debug(A);   
        }       
    }
    public class Oauth{
            public String access_token{get;set;}
            public String instance_url{get;set;}
            public String id{get;set;}
            public String token_type{get;set;}
            public String issued_at{get;set;}
            public String signature{get;set;}
    }    
}