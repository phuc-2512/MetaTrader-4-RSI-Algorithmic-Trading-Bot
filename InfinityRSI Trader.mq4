//+------------------------------------------------------------------+
//|                                                         test.mq4 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link "https://www.mql5.com"
#property version "1.00"
#property strict

int RSI_PERIOD = 14;
input int RSI_BUY = 45;
input int RSI_SELL = 60;
input int RSI_EXITBUY = 50;
input int RSI_EXITSELL = 45;
input int tp_distance = 150;
input int sl_distance = 100;
input int trailingStop = 50;
input double volume = 0.1;

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
  //---

  //---
  return (INIT_SUCCEEDED);
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
void OnTick()
{
  //---
  double rsiValue = iRSI(Symbol(), 0, RSI_PERIOD, PRICE_CLOSE, 0);
  Print("current RSI: ", rsiValue);

  double price;
  double sl;
  double tp;

  // lệnh mở mua
  if (rsiValue < RSI_BUY)
  {
    if (!IsOrderOpen(OP_BUY))
    {
      price = Ask;
      sl = price - sl_distance * _Point;
      tp = price + tp_distance * _Point;
      // Open a buy order
      int ticket = OrderSend(Symbol(), OP_BUY, volume, price, 3, sl, tp, "RSI Buy", 0, 0, Blue);
      if (ticket < 0)
      {
        Print("Error opening buy order: ", GetLastError());
      }
      else
      {
        Print("Buy order opened successfully with SL: ", sl, " and TP: ", tp);
      }
    }
  }
  // lệnh đóng mua
  if (rsiValue > RSI_EXITBUY)
  {
    CloseOrders(OP_BUY);
  }
  // lệnh mở sell
  if (rsiValue > RSI_SELL)
  {
    // Check if there are no open sell orders
    if (!IsOrderOpen(OP_SELL))
    {
      price = Bid;
      sl = price + sl_distance * _Point;
      tp = price - tp_distance * _Point;
      // Open a sell order
      int ticket = OrderSend(Symbol(), OP_SELL, volume, price, 3, sl, tp, "RSI Sell", 0, 0, Red);
      if (ticket < 0)
      {
        Print("Error opening sell order: ", GetLastError());
      }
      else
      {
        Print("Sell order opened successfully with SL: ", sl, " and TP: ", tp);
      }
    }
  }
  // lệngh đóng sell
  // Check if RSI is below 45 for exiting sell orders
  if (rsiValue < RSI_EXITSELL)
  {
    CloseOrders(OP_SELL);
  }
}

//+------------------------------------------------------------------+//+------------------------------------------------------------------+
//| Function to check if an order is open                            |
//+------------------------------------------------------------------+
bool IsOrderOpen(int orderType)
{
  for (int i = 0; i < OrdersTotal(); i++)
  {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
    {
      if (OrderType() == orderType && OrderSymbol() == Symbol())
      {
        return (true);
      }
    }
  }
  return (false);
}
//+------------------------------------------------------------------+
//| Function to close all open orders of a specific type             |
//+------------------------------------------------------------------+
void CloseOrders(int orderType)
{
  for (int i = OrdersTotal() - 1; i >= 0; i--)
  {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
    {
      if (OrderType() == orderType && OrderSymbol() == Symbol())
      {
        bool result = false; // Initialize result to false
        if (orderType == OP_BUY)
        {
          result = OrderClose(OrderTicket(), OrderLots(), Bid, 3, clrNONE);
        }
        else if (orderType == OP_SELL)
        {
          result = OrderClose(OrderTicket(), OrderLots(), Ask, 3, clrNONE);
        }
        if (!result)
        {
          Print("Error closing order: ", GetLastError());
        }
        else
        {
          Print("Order closed successfully");
        }
      }
    }
  }
}
//+------------------------------------------------------------------+
//| Function to apply trailing stop loss                             |
//+------------------------------------------------------------------+
void TrailingStopLoss()
{
  for (int i = 0; i < OrdersTotal(); i++)
  {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
    {
      if (OrderSymbol() == Symbol())
      {
        double newSL;
        if (OrderType() == OP_BUY)
        {
          newSL = Bid - trailingStop * _Point;
          if (newSL > OrderStopLoss())
          {
            bool result = OrderModify(OrderTicket(), OrderOpenPrice(), newSL, OrderTakeProfit(), 0, clrNONE);
            if (result)
            {
              Print("Trailing stop modified for buy order: ", OrderTicket(), " new SL: ", newSL);
            }
          }
        }
        else if (OrderType() == OP_SELL)
        {
          newSL = Ask + trailingStop * _Point;
          if (newSL < OrderStopLoss())
          {
            bool result = OrderModify(OrderTicket(), OrderOpenPrice(), newSL, OrderTakeProfit(), 0, clrNONE);
            if (result)
            {
              Print("Trailing stop modified for sell order: ", OrderTicket(), " new SL: ", newSL);
            }
          }
        }
      }
    }
  }
}
//+------------------------------------------------------------------+