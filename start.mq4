//+------------------------------------------------------------------+
//|                                            acorralado-in-out.mq4 |
//|                                  Copyright 2018, Gustavo Carmona |
//|                                          https://www.awtt.com.ar |
//+------------------------------------------------------------------+



//+
#property copyright "Copyright 2018, Gustavo Carmona"
#property link      "https://www.awtt.com.ar"
#property version   "1.00"
#property strict
#include "start.mqh"

//          (name, magicNumber)
Acorralado bot("bot",1500), tob("tob",1600);
enum choice{
   bbot = 0,  //bot
   btob = 1,  //tob
   both = 2,  //both
   };
enum io{
   buy = OP_BUY, //buy
   sell = OP_SELL, //sell
   };
input choice botToStart=2;
input io InitialOrder = OP_BUY;    
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
  Comment("Point: ",Point);
  if(botToStart == 2){
     bot.setInitialOrder(OP_SELL);
     tob.setInitialOrder(OP_BUY);
     }else{
         if(botToStart==0)
            bot.setInitialOrder(InitialOrder);
         else
            tob.setInitialOrder(InitialOrder);   
         }
  
     

  return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick(){
 
      
}      
      
    