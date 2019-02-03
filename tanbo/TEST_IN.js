"use strict";
var soundCount=0;
var command;
var last_command_id=0;
var head;
var lmp_SOU = document.getElementById("SOUND");

window.addEventListener(
  "load",
  function() {
    mainFunction();
    //SoundFunction();
  },
  false
);

async function mainFunction() {
  try {

　  //インプット制御
    var i2cAccess = await navigator.requestI2CAccess();
    var gpioAccess = await navigator.requestGPIOAccess();

    var port = i2cAccess.ports.get(1);
    var adt7410 = new ADT7410(port, 0x48);
    var groveLight = new GROVELIGHT(port, 0x29);

    await adt7410.init();	//温度センサ
    await groveLight.init();	//光センサ

      var port_SOU = gpioAccess.ports.get(24);
      await port_SOU.export("in");

          //アウトプット制御
          
          var port_R = gpioAccess.ports.get(12);
          var port_G = gpioAccess.ports.get(16);
          var port_B = gpioAccess.ports.get(20);
          var port_P = gpioAccess.ports.get(21);
          await port_R.export("out");
          await port_G.export("out");
          await port_B.export("out");
          await port_P.export("out");

  port_SOU.onchange = (val)=>{
	  lmp_SOU.style.backgroundColor = (val)? "green" : "black";
	  if (val==1){soundCount ++ ;}
  }


    while (1) {
      var ondo_value = await adt7410.read();
      var light_value = await groveLight.read();



//       console.log('ondo_value:', ondo_value);
//       console.log('light_value:', light_value);


       post_log(ondo_value,light_value,soundCount); //田んぼアプリにログを送信
       get_command();
//       console.log('command:', command);
//       console.log('last_command_id:', last_command_id);

       //お仕事スタート
       if (command != undefined){
         if (last_command_id != command.id){
          last_command_id = command.id;
          //alert("お仕事スタート:" + last_command_id);

          var blue_value = command.blue_led ? 1 :0;
          var green_value = command.green_led ? 1 :0;
	  var red_value = command.red_led ? 1 :0;
	  var pump_value = command.mizu ? 1 :0;

	  port_B.write(blue_value);
          port_G.write(green_value);
	  port_R.write(red_value);
	  port_P.write(pump_value);

         };
       }
      //console.log('soundCount:', soundCount);
      soundCount = 0;
      await sleep(500);
    }
  } catch (error) {
    console.error("error", error);
  }
}



async function SoundFunction() {
	soundCount++;
  	var port_SOU = gpioAccess.ports.get(24);
  	await port_SOU.export("in");
  	console.log('sound:', port_SOU);
	$("#SOUND").html(port_SOU.value);
}


function sleep(ms) {
  return new Promise(function(resolve) {
    setTimeout(resolve, ms);
  });
}

function post_log(ondo,light,oto){
 $.ajax({
      type: "POST",
      url: "http://192.168.8.103:3000/logs",
      data: {
        "tanbo_id": 1,
        "shitsudo": 2.1,
        "oto": oto,
        "ondo": ondo,
        "camera": 1.4,
        "light": light,
        "loged_at": Date.now()
      },
      success: function(j_data){
 //       console.log('success')
      }
    });
}

function get_command(){
 $.ajax({
      type: "GET",
      url: "http://192.168.8.103:3000/commands",
      dataType:'json',
      success: function(json){
        command = json;
//	console.log('inner-command:', command);
      }
    });
 
}

