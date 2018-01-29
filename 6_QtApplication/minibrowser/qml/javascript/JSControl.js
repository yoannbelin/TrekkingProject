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
