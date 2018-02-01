function call_window(window) {

    webPage.visible = false
    trekPage.visible = false
    currentTrekPage.visible = false
    photoPage.visible = false
    uploadPage.visible = false
    window.visible = true

}

function lastLat(){
    return  MyContext.myTrek.path[MyContext.myTrek.path.length-1].latitude
}

function lastLng(){
    return MyContext.myTrek.path[MyContext.myTrek.path.length-1].longitude
}

function pathwayToJSon(){
    var pathway = [];
    var index = 0;

    while(index < MyContext.myTrek.path.length)
    {
        pathway.push( {  latitude : MyContext.myTrek.path[index].latitude ,
                         longitude :MyContext.myTrek.path[index].longitude });
        index++
    }

    return pathway
}


function timeToString(timeInMs){

    var cents = parseInt( timeInMs/10, 10 ) ;

    var seconds = parseInt( cents/100, 10 ) ;
    cents %= 100 ;

    var minutes = parseInt( seconds/60, 10 ) ;
    seconds %= 60 ;

    var hours = parseInt( minutes/60, 10 ) ;
    minutes %= 60 ;

    var numToString = function( number ){
        var numString = number.toString();
        if(number < 10)
        {
            numString = "0" + number.toString();
        }
        return numString;
    };

    var timeInString =  numToString(hours) + ":" +
                        numToString(minutes) + ":" +
                        numToString(seconds);
                        // + ":" + numToString(cents)

    return timeInString;
}

