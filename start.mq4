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

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
  Comment(Point);
  bot.setInitialOrder(OP_SELL);
  tob.setInitialOrder(OP_BUY);
  
     

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
      
    