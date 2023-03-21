///librerias usadas...
///https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json
#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h> ///https://github.com/bblanchon/ArduinoJson
#include <Adafruit_Fingerprint.h> ///https://github.com/adafruit/Adafruit-Fingerprint-Sensor-Library
#include <HardwareSerial.h>

const int pBuzzer = 23;
///const int sensorPin = 2;
// int cuarto = 1000 / 4;
// int octavo = 1000 / 8;
// double pausa = 1.30;

///Notas para el buzzer
int NOTA_C4 = 262;
int NOTA_A4 = 440;
int NOTA_E5 = 659;
int NOTA_B4 = 493.883;
int NOTA_AB4 = 466.164;
int NOTA_GB4 = 415.305;
 
Adafruit_Fingerprint finger = Adafruit_Fingerprint(&Serial2);

//Constantes para redes

const char* ssid[] = {"WENDY", "LAPTOP-TOB1OK0R 5797","ITSA.STAFFv2","CASTRILLON","ITSA.STUDENTSv2" };
const char* password[] = {"1001943165","12345678a","2017quality.45","DaEMIs753XL@","estA1754*" };
int length;
boolean desconectado = true; 

///Conexion a la Api
//const char* Api_rest = "http://192.168.20.55:5000/create_log_ingresos";
const char* Api_rest = "http://192.168.1.12:5000/insert_Ingreso";
char jsonOutput[128];


int ID_USUARIO;
int TIPO_INGRESO = 0;

void setup() {
  delay(5000);
  Serial.begin(115200);
  length = sizeof(ssid)/sizeof(ssid[ 0 ]);
  Serial.print("Length: ");
  Serial.println( length );

  while(desconectado == true){
    for(int i = 0; i < length ; i++ ){
      if(desconectado){
        Serial.println( ssid[i]);
        Serial.println( password[i]);

        WiFi.begin(ssid[i], password[i]);

        Serial.print("Conectando...");
        delay(15000);
        if(WiFi.status() == WL_CONNECTED){
          Serial.println("");
          Serial.print("Conectado con éxito, con la IP:");
          Serial.println(WiFi.localIP());
          desconectado = false;   
        }
      delay(1000);        
      }   
    }     
  } 

  pinMode(22, OUTPUT);
  pinMode(LED_BUILTIN, OUTPUT); 
  pinMode(pBuzzer, OUTPUT);

  while (!Serial);       //  Yun/Leo/Micro/Zero/...
  delay(100);
  Serial.println("BPASS-C...");

  // set the data rate for the sensor serial port
  finger.begin(57600);  // inicializa comunicacion con sensor a 57600 Baudios
  delay(5);
  if (finger.verifyPassword()) {
    Serial.println("Detectado un sensor de huella!");
  } else {
    Serial.println("No hay comunicacion con el sensor de huella");
    Serial.println("Revise las conexiones");
    while (1) { delay(1); }
  }

  finger.getTemplateCount();
  Serial.print("El sensor contiene "); Serial.print(finger.templateCount); Serial.println(" plantillas");
  Serial.println("Esperando por una huella valida..."); 
  
   
}
 
void loop() {
   
  if (WiFi.status() == WL_CONNECTED) { 

    ID_USUARIO = getFingerprintIDez();
    if(ID_USUARIO > 0){
      abrirPuerta();      
    }    
    
  }else{
    Serial.print("No estas conectado...");  
  }
  
  delay(50);
}/// End loop

void abrirPuerta() {
  Serial.println(" AUTORIZADA *** "+ String(ID_USUARIO)); 
  // digitalWrite(LED_BUILTIN, HIGH);   // turn the LED off by making the voltage LOW
  // digitalWrite(22, HIGH);   // Abrir la cerradura  
  // tone(pBuzzer, NOTA_B4, cuarto);   // Suena el buzzer para indicar que se va a cerrar la puerta
  // delay(cuarto*pausa);
  // tone(pBuzzer, NOTA_AB4, cuarto);   // Suena el buzzer para indicar que se va a cerrar la puerta
  // delay(cuarto*pausa);     // cierra la cerradura 
  // tone(pBuzzer, NOTA_GB4, octavo);   // Suena el buzzer para indicar que se va a cerrar la puerta
  // delay(octavo*pausa);  
  // tone(pBuzzer, NOTA_E5, octavo);   // Suena el buzzer para indicar que se va a cerrar la puerta
  // delay(octavo*pausa);  
  // delay(2000);
  digitalWrite(LED_BUILTIN, LOW);
  digitalWrite(22, LOW);   // CERRAR la cerradura  

  TIPO_INGRESO = 1;

  HTTPClient http;
  http.begin(Api_rest);
  http.addHeader("Content-Type", "application/json");

  const size_t CAPACITY = JSON_OBJECT_SIZE(2);
  StaticJsonDocument<CAPACITY> doc;

  JsonObject object = doc.to<JsonObject>();  
  object["ID_USUARIO"] = ID_USUARIO;
  object["TIPO_INGRESO"] = TIPO_INGRESO;


  serializeJson (doc, jsonOutput);      

  int cod_res = http.POST(String(jsonOutput));

  if(cod_res > 0 ){
    Serial.println("Código HTTP: " + String(cod_res)); 

    if(cod_res == 200){
      String res = http.getString();
      Serial.println("El servidor respondio..");
      Serial.println(res);                          
    }
  }else{    
    Serial.println("ERROR Código HTTP: " + String(cod_res)); 
  }
}

void Mal_Registro() {  
  // Activa el Buzzer 2 veces por tarjeta no autorizada
  Serial.println("Huella no valida");
  // tone(pBuzzer, NOTA_E5, cuarto);   // Suena el buzzer para indicar que se va a cerrar la puerta
  // delay(cuarto*pausa);
  // tone(pBuzzer, NOTA_A4, octavo);   // Suena el buzzer para indicar que se va a cerrar la puerta
  // delay(octavo*pausa);
  ID_USUARIO = getFingerprintIDez();
}

int getFingerprintIDez() {

  Serial.print(".");

  uint8_t p = finger.getImage();
  if (p != FINGERPRINT_OK)  return -1;

  p = finger.image2Tz();
  if (p != FINGERPRINT_OK)  return -1;

  p = finger.fingerFastSearch();
  if (p != FINGERPRINT_OK) { 
    Mal_Registro();
    return -1;
  }
  // Si hay coincidencias de huella
  Serial.print("ID #"); Serial.print(finger.fingerID); 
  Serial.print(" coincidencia del "); Serial.println(finger.confidence);

  Serial.println("BIENVENIDO usuario "); Serial.print(finger.fingerID); 
  
   
  return finger.fingerID; 
}

