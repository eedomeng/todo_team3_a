let getBackgroundImage = async () => {
    let clientId = 'pyW1cr0rmWwD6MFvlUP6rFqAdp0M-8vY5CPXua5a6Yc';
    let url = 'https://api.unsplash.com/photos/random?'

    let params = {
        client_id: clientId,
        'orientation': 'landscape',
        query: 'landscape'
    }

    let res = await fetch(url + getQueryString(params));
    let imgData = res.json();

    console.dir(imgData);

    return imgData;
}

let createUnsplashToken = async () => {
    let imgData = await getBackgroundImage();

    let imgURL = imgData.urls.regular;
    let location = imgData.location.name?imgData.location.name:'with multicampus...';

    let expirationDate = new Date();
    expirationDate.setDate(expirationDate.getDate()+1);
    
    let unsplashToken = {
        url: imgURL,
        'location': location,
        expiresOn: expirationDate.getTime()
    }

    localStorage.setItem('unsplashToken', JSON.stringify(unsplashToken));

    return unsplashToken;
}

let getUnsplashToken = async () => {
    let token = JSON.parse(localStorage.getItem('unsplashToken'));

    let now = new Date().getTime();
    if(token && token.expiresOn > now) return token;

    return await createUnsplashToken();
}

(async () => {
    let unsplashToken = await getUnsplashToken();

    $('body').style.backgroundImage = `url(${unsplashToken.url})`;
    let bgSpan = createElement('span', {text:unsplashToken.location});
    $('.bg-location').append(bgSpan);
})();