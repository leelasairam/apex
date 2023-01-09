public with sharing class NewsClass {
    public NewsClass() {

    }
    @AuraEnabled(cacheable=true)
    public static list<object> GetNews(String Country, String Category){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        if(Country=='' && Category==''){
            request.setEndpoint(url);
        }
        else if(Country!='' && Category==''){
            request.setEndpoint(url);
        }
        else if(Country=='' && Category!=''){
            request.setEndpoint(url);
        }
        else{
            request.setEndpoint(url);
        }
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        List<Object> news = (List<Object>) results.get('articles');  
        return news;
    }

    @AuraEnabled(cacheable=true)
    public static Object GetWeather(String Area){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        Object Info = JSON.deserializeUntyped(response.getBody());
        return Info;
    }
}
