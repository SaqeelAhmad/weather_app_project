


const apikey = "fa8690b52dfe2d1a4e45ae7dbc48237f";

String apiURL (var lat, var lon){


  String Url ;
  Url = "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apikey&units=metric&exclude=minutely";
  return Url;
}