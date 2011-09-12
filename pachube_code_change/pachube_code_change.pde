import processing.serial.*;
import cc.arduino.*;
import eeml.*;
import pachuino.*;

Pachuino p;
float lastUpdate;

void setup(){    
    p = new Pachuino(this, Arduino.list()[1], 57600);    
    p.manualUpdate("http://www.pachube.com/api/35484.xml"); // change URL -- this is the feed you want to update
    p.setKey("");    

    // local sensors    
    p.addLocalSensor("analog", 0,"lightSensor");
}

void draw(){
        if ((millis() - lastUpdate) > 10000){
           float tempVal1 = p.localSensor[0].value;
           println(tempVal1);
            p.analogWrite(0, p.localSensor[0].value);
            //p.debug();
            lastUpdate = millis();
        }
}



// you don't need to change any of these

void onReceiveEEML(DataIn d){  
    p.updateRemoteSensors(d); 
}

