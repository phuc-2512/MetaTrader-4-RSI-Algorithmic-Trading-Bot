# InfinityRSI Trader
Welcome to **InfinityRSI Trader**, the ultimate trading expert advisor crafted with care by an 11th-grade prodigy! 🚀 This MQL4 script utilizes the power of the Relative Strength Index (RSI) to execute trades with precision, ensuring you stay ahead in the trading game. Let's dive into the details of this amazing project!

---

## Table of Contents
1. [Introduction](#introduction)
2. [Features](#features)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Configuration](#configuration)
6. [Contributing](#contributing)
7. [License](#license)
8. [Contact](#contact)

---

## Introduction
**InfinityRSI Trader** is a MetaTrader 4 (MT4) Expert Advisor designed to automate trading based on RSI values. This script is perfect for traders looking to implement a systematic approach to their trading strategy, all while leveraging the powerful RSI indicator.

---

## Features
- **Automated Trading**: Opens and closes buy/sell orders based on RSI values.
- **Configurable Parameters**: Customize RSI periods, buy/sell thresholds, take profit (TP), stop loss (SL), and trailing stops.
- **Real-Time Monitoring**: Continuously monitors the RSI values and market conditions to make informed trading decisions.
- **Error Handling**: Provides clear error messages for better debugging and understanding.
- **Fun to Use**: Crafted with a touch of humor and joy, making trading an enjoyable experience.

---

## Installation
To get started with **InfinityRSI Trader**, follow these simple steps:

1. **Download the Script**: Clone or download the repository to your local machine.
   ```bash
   git clone https://github.com/yourusername/InfinityRSI-Trader.git
   ```

2. **Copy the Script**: Place the `InfinityRSI Trader.mq4` file into the `Experts` directory of your MT4 platform.
   ```bash
   C:\Program Files\MetaTrader 4\MQL4\Experts\
   ```

3. **Compile the Script**: Open the MetaEditor, find the `InfinityRSI Trader.mq4` file, and hit the "Compile" button.

4. **Attach to Chart**: In your MT4 platform, go to the Navigator panel, find `InfinityRSI Trader` under the Expert Advisors section, and drag it onto your desired chart.

---

## Usage
Once you have installed **InfinityRSI Trader**, here’s how to use it:

1. **Attach to a Chart**: Open the desired currency pair chart and time frame in MT4.
2. **Enable Algo Trading**: Ensure the "Algo Trading" button is enabled in MT4.
3. **Set Parameters**: Adjust the input parameters to fit your trading strategy.
4. **Monitor**: Let **InfinityRSI Trader** do the magic! Monitor the trades and watch your strategy unfold.

---

## Configuration
**InfinityRSI Trader** comes with several configurable parameters:

```mql4
input int RSI_PERIOD = 14;       // RSI period
input int RSI_BUY = 45;          // RSI buy threshold
input int RSI_SELL = 60;         // RSI sell threshold
input int RSI_EXITBUY = 50;      // RSI exit buy threshold
input int RSI_EXITSELL = 45;     // RSI exit sell threshold
input int tp_distance = 150;     // Take profit distance (points)
input int sl_distance = 100;     // Stop loss distance (points)
input int trailingStop = 50;     // Trailing stop distance (points)
input double volume = 0.1;       // Trade volume
```

Feel free to tweak these settings to suit your trading preferences.

---

## Contributing
We welcome contributions from everyone! If you have suggestions, bug reports, or feature requests, please open an issue or submit a pull request. Let's make **InfinityRSI Trader** even better together!

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contact
For any questions, feedback, or just to say hi, feel free to reach out:

- **GitHub**: https://github.com/phuc-2512
- **Email**: phanvanphuc25122008@gmail.com
- **Linkderdin**: https://www.linkedin.com/in/vwnphuc/
- **Upwork**: https://www.upwork.com/freelancers/~019f361649974209ea

---

Happy Trading! May the RSI be ever in your favor! 😄📈

---

Feel free to copy and paste this README directly into your GitHub repository. It should retain its format without any issues. Enjoy!
