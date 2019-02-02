function GroveTouch(i2cPort,address){
  this.i2cPort=i2cPort;
  this.i2cSlave= null;
  this.slaveAddress= address;
}

GroveTouch.prototype = {
  init: function(){
    return new Promise((resolve, reject)=>{
      this.i2cPort.open(this.slaveAddress).then(async function(i2cSlave){
        this.i2cSlave = i2cSlave;
        await this.i2cSlave.write8(0x2b,0x01);
        await this.i2cSlave.write8(0x2c,0x01);
        await this.i2cSlave.write8(0x2d,0x01);
        await this.i2cSlave.write8(0x2e,0x01);
        await this.i2cSlave.write8(0x2f,0x01);
        await this.i2cSlave.write8(0x30,0x01);
        await this.i2cSlave.write8(0x31,0xff);
        await this.i2cSlave.write8(0x32,0x02);
        for(var i=0;i<12*2;i+=2){
//          console.log(i);
          var address = 0x41+i;
//          console.log(address);
          await this.i2cSlave.write8(address,0x0f);
          await this.i2cSlave.write8(address+1,0x0a);
        }
        await this.i2cSlave.write8(0x5d,0x04);
        await this.i2cSlave.write8(0x5e,0x0c);
        resolve();
      });
    });
  },
  read:()=>{
    return new Promise((resolve, reject)=>{
      if(this.i2cSlave == null){
        reject("i2cSlave Address does'nt yet open!");
      }else{
        this.i2cSlave.read16(0x00).then((v)=>{
//          console.log(v);
          var array = [];
          for(var cnt = 0;cnt < 12;cnt ++){
            array.push(((v & (1 << cnt))!=0)?true:false);
          }
          resolve(array);
        }).catch(reject);
      }
    });
  }
};
