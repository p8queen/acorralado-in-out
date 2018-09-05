//+------------------------------------------------------------------+
//|                                                   Acorralado.mqh |
//|                                  Copyright 2018, Gustavo Carmona |
//|                                           http://www.awtt.com.ar |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, Gustavo Carmona"
#property link      "http://www.awtt.com.ar"
#property version   "1.00"
#property strict


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Acorralado
  {
private:
   string name;
   double deltaTips, lots, deltaStTp, deltaOrders;
   double priceBuys, priceSells;
   int magicNumber;
   
public:
                     Acorralado(string robotName, int robotMagicNumber);
                    ~Acorralado();
  void               setInitialOrder(int OP);                    
  
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Acorralado::Acorralado(string robotName, int robotMagicNumber)
  {
   name = robotName+"-"+Symbol();
   magicNumber = robotMagicNumber;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Acorralado::~Acorralado()
  {
  }
//+------------------------------------------------------------------+

void Acorralado::setInitialOrder(int OP){
   double price, st, tp;
   deltaTips = 500*Point;
   deltaStTp = 5*Point;
   deltaOrders = 5*Point;
   lots = 0.01;
      
   if(OP==OP_BUY){
      price = Ask;
      priceBuys = price;
      st = priceBuys - 2*deltaTips;
      tp = priceBuys + deltaTips - deltaStTp;
      OrderSend(Symbol(),OP_BUY,lots,price,10,st,tp,name,magicNumber);
      
      priceBuys=tp;
      st = priceBuys + 2*deltaTips;
      tp = price;
      OrderSend(Symbol(),OP_SELLLIMIT,lots,priceBuys,10,st,tp,name,magicNumber);
      }
   else{
      price = Bid;
      priceSells = Ask;
      st = priceSells + 2*deltaTips;
      tp = priceSells - deltaTips + deltaStTp;
      OrderSend(Symbol(),OP_SELL,lots,price,10,st,tp,name,magicNumber);
      
      priceSells = tp;
      st = priceSells - 2*deltaTips;
      tp = price;
      OrderSend(Symbol(),OP_BUYLIMIT,lots,priceSells,10,st,tp,name,magicNumber);
      }
   
   
   lots += 0.02;
   
   if(OP==OP_BUY){ 
      priceSells = Ask-deltaTips;  
      st = priceSells+2*deltaTips;
      tp = priceSells-deltaTips + deltaStTp;
      OrderSend(Symbol(),OP_SELLSTOP,lots,priceSells,10,st,tp,name,magicNumber);
  }else{
      priceBuys = Ask+deltaTips;
      st = priceBuys-2*deltaTips;
      tp = priceBuys+deltaTips - deltaStTp;
      OrderSend(Symbol(),OP_BUYSTOP,lots,priceBuys,10,st,tp,name,magicNumber);
      }
   

    
   }
 
 