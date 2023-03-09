class ApiConfig {
  static const baseUrl =
      "https://api.weatherapi.com/v1/current.json?key=8be21ca63d5a4352aa5135443230903";

  //api Types
  // Post: Pass data from front end and get a response. Note: data is hidden
  // Get: Pass data as query parameters and get response based on that
  // Put: To edit something or update something
  // Delete: Delete something
}

class Endpoint {
  static const londonEndpoint = "&q=London&aqi=no";
}
