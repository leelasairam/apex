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
        req.setEndpoint('');
        req.setMethod('POST');
        HttpResponse res = new HttpResponse();
        res=http.send(req);
        system.debug(res.getBody());
        Oauth objAuthInfo = (Oauth)JSON.deserialize(res.getBody(), Oauth.class);
        if(objAuthInfo != null){
            Http httpnew = new Http();
            HttpRequest reqnew = new HttpRequest();
            reqnew.setEndpoint('');
            //reqnew.setEndpoint('');
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
