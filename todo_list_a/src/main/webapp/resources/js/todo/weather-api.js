    let $ = function(cssSelector, message){
        let htmlElements = this.document.querySelectorAll(cssSelector);

        if(message){
            htmlElements.forEach(e => {e.innerHTML += message + '<br>'});
        }

        if(htmlElements.length == 1) return htmlElements[0];
        return htmlElements;
   }

let getWeather = async coords => {
    const APP_ID = 'b344b209d712b4007e79b1db11b84827';
    let apiURL = 'https://api.openweathermap.org/data/2.5/weather?';

    let params = {
        lat: coords.lat,
        lon: coords.log,
        appid: APP_ID,
        lang: 'kr',
        units: 'metric'
    }

    let res = await fetch(apiURL+getQueryString(params));
    
    return res.json();
}

// 위도, 경도 받아오기
let getUserCoord = () => {
    return new Promise((resolve, reject) => {
        navigator.geolocation.getCurrentPosition(position => {
            resolve({
                lat: position.coords.latitude,
                log: position.coords.longitude
            });

        }, error => {
            reject(error);
        });
    })
}

(async () => {
    let coords = await getUserCoord();
    let weatherData = await getWeather(coords);

    let weatherDiv = $('.weather');
    let weatherSpan = createElement('span', {text:`${weatherData.main.temp}℃ @ ${weatherData.name}`});
    weatherDiv.append(weatherSpan);
})();