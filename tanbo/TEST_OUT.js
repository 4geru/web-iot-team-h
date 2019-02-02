(async ()=>{
  var btn_RE = document.getElementById("RE");
  var btn_GR = document.getElementById("GR");
  var btn_BL = document.getElementById("BL");
  var btn_PO = document.getElementById("PO");
  
  var lmp_SW1 = document.getElementById("SW1");
  var lmp_SW2 = document.getElementById("SW2");
  var lmp_SOU = document.getElementById("SOUND");
  
  var val_R = 0;
  var val_G = 0;
  var val_B = 0;
  var val_P = 0;
  
  var gpioAccess = await navigator.requestGPIOAccess();
  var port_R = gpioAccess.ports.get(12);
  var port_G = gpioAccess.ports.get(16);
  var port_B = gpioAccess.ports.get(20);
  var port_P = gpioAccess.ports.get(21);
  await port_R.export("out")
  await port_G.export("out")
  await port_B.export("out")
  await port_P.export("out")
  
  var port_SW1 = gpioAccess.ports.get(5);
  var port_SW2 = gpioAccess.ports.get(6);
  var port_SOU = gpioAccess.ports.get(24);
  await port_SW1.export("in");
  await port_SW2.export("in");
  await port_SOU.export("in");
  
/*    
  btn_REDonmousedown = ()=>{
    port_R.write(0);
  };
  btn_RE.onmouseup = ()=>{
    port_R.write(1);
  };
*/
  btn_RE.onclick = ()=>{
    val_R ^= 1;
    port_R.write(val_R);
  };
  
  btn_GR.onclick = ()=>{
    val_G ^= 1;
    port_G.write(val_G);
  };
  
  btn_BL.onclick = ()=>{
    val_B ^= 1;
    port_B.write(val_B);
  };
  
  btn_PO.onclick = ()=>{
    val_P ^= 1;
    port_P.write(val_P);
  };
 
   port_SW1.onchange = (val)=>{
	  lmp_SW1.style.backgroundColor = (val)? "green" : "black";
  }
  
  port_SW2.onchange = (val)=>{
	  lmp_SW2.style.backgroundColor = (val)? "green" : "black";
  }
  
  port_SOU.onchange = (val)=>{
	  lmp_SOU.style.backgroundColor = (val)? "green" : "black";
  }
  
})();