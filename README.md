Used free Currency Converter console
https://currencylayer.com/login
- Signup for free account, APIKey is must to get free api response.
- APIKey is available under dashboard.
- To utilize Multiple API seamlesaly need paid subscription plan so just utilised limited plan to access API (100 API call per month)
- Once 100 API call over need to replace API Key with new account ar wait for month to update APIKey
- To update API key in project flow the steps  1. Go to Xcode project under the Project navigator in left panel of Xcode> NetworkManager > Environment> replace the accessKey value of string extension.

Steps to run app:
1. Download the GitHub public repo 
2. Run Xcode project(.xcodeproj)
3. Use simulator iPhone 15pro

Notes:
- Used list of supported Country-currency list provided by “Currencylayer.com”
- On app launch default Target & destination currencies are selected with default amount. To show case default values
- User can tap on Target & destination round buttons to select the currency to convert.
- Once the target and amount is enterd then on selection of destination currency from list the Converter API gets call and converted output displays.

Future Improvements:
- UI can be improve & specified with details
- Can utilize more API from console to provide different functions like 1. "live" - get the most recent exchange rate data (https://api.currencylayer.com/live) 2. ”historical" - get historical rates for a specific day  (https://api.currencylayer.com/historical?date=YYYY-MM-DD) 3. "timeframe" - request exchange rates for a specific period of time  (https://api.currencylayer.com/timeframe?start_date=2015-01-01&end_date=2015-05-01) 4. "change" - request any currency's change parameters (margin, percentage) (https://api.currencylayer.com/change?currencies=USD,EUR)
- Can improve network manager to handle various scenarios os API call like error handling os API responses.
