public with sharing class NewsClass {
    public NewsClass() {

    }
    @AuraEnabled(cacheable=true)
    public static list<object> GetNews(String Country, String Category){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        if(Country=='' && Category==''){
            request.setEndpoint('https://newsapi.org/v2/top-headlines?language=en&apiKey=c61cdd58146c4813aa0d466ba1a30348');
        }
        else if(Country!='' && Category==''){
            request.setEndpoint('https://newsapi.org/v2/top-headlines?country='+Country+'&language=en&apiKey=c61cdd58146c4813aa0d466ba1a30348');
        }
        else if(Country=='' && Category!=''){
            request.setEndpoint('https://newsapi.org/v2/top-headlines?category='+Category+'&language=en&apiKey=c61cdd58146c4813aa0d466ba1a30348');
        }
        else{
            request.setEndpoint('https://newsapi.org/v2/top-headlines?country='+Country+'&category='+Category+'&language=en&apiKey=c61cdd58146c4813aa0d466ba1a30348');
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
        request.setEndpoint('http://api.weatherapi.com/v1/forecast.json?key=849974a6644d4f7a85394252220102&q='+Area+'&days=3&aqi=no&alerts=no');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        Object Info = JSON.deserializeUntyped(response.getBody());
        return Info;
    }
}