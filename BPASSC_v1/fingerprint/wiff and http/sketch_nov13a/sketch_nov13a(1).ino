#include <HTTPClient.h>

# include <WiFi.h>


const char* ssid = "CASTRILLON";
const char* password = "DaEMIs753XL@";


const char* Api_rest = "https://www.fitbit.com/apis.json";

String answer;
const int requestInterval = 7000;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  
  WiFi.begin(ssid, password);
  Serial.println("Conentando...");
  while(WiFi.status() != WL_CONNECTED){
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("Conectado a la red la IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();
  
}

void loop() {
  // put your main code here, to run repeatedly:
  if(WiFi.status() == WL_CONNECTED){
    answer = getRequest(Api_rest);
    Serial.println("\nRespuesta de Api");
    Serial.println(answer);

  }

  while(true){}

}


String getRequest(const char* servername){
  HTTPClient http;
  http.begin(servername);
  int httpResponseCode = http.GET();

  String payload = "...";

  if(httpResponseCode > 0){
    Serial.print("Http response code: ");
    Serial.println(httpResponseCode);
    payload = http.getString();
  }else{
    Serial.print("Error code: ");
    Serial.println(httpResponseCode);
  }

  return payload;
}
