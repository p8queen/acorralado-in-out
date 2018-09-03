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
   double balance;
   bool botIsOpen;
   int firstOrderOP;
   int magicNumber;
   
public:
                     Acorralado(string robotName, int robotMagicNumber);
                    ~Acorralado();
  void               setInitialValues();
  void               setInitialOrder(int OP);                    
  void               setPendingOrder();                    
  void               closePendingOrder();                    
  double             getBalance();
  bool               getBotIsOpen(){ return botIsOpen;}
  void               closeWhenFirstOrderTakeProfit();
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
void Acorralado::setInitialValues(void){
   balance = 0;
   botIsOpen = true;
  }

void Acorralado::setInitialOrder(int OP){
   double price, st, tp;
   setInitialValues();
   deltaTips = 500*Point;
   deltaStTp = 1*Point;
   deltaOrders = 5*Point;
   lots = 0.01;
   firstOrderOP = OP;
   
   if(OP==OP_BUY){
      price = Ask;
      priceBuys = price;
      st = priceBuys - 2*deltaTips;
      tp = priceBuys + deltaTips - deltaStTp;
      priceSells = priceBuys - deltaTips;
      OrderSend(Symbol(),OP_BUY,lots,price,10,st,tp,name,magicNumber);
      }
   else{
      price = Ask;
      priceSells = Ask;
      st = priceSells + 2*deltaTips;
      tp = priceSells - deltaTips + deltaStTp;
      priceBuys = priceSells + deltaTips;
      OrderSend(Symbol(),OP_SELLLIMIT,lots,price,10,st,tp,name,magicNumber);
      }
   
   
   lots += 0.02;
   
   if(OP==OP_BUY){   
      st = priceSells+2*deltaTips;
      tp = priceSells-deltaTips + deltaStTp;
      OrderSend(Symbol(),OP_SELLSTOP,lots,priceSells,10,st,tp,name,magicNumber);
  }else{
      st = priceBuys-2*deltaTips;
      tp = priceBuys+deltaTips - deltaStTp;
      OrderSend(Symbol(),OP_BUYSTOP,lots,priceBuys,10,st,tp,name,magicNumber);
      }
   

    
   }
 
 