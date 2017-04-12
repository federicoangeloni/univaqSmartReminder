/**
 * Created by Federico on 21/11/2016.
 */

$(document).ready(function () {

    setInterval(function () {
        var seconds = new Date().getSeconds(); //secondi prelevati dal sistema NB:il webservice fornisce solo ore e minuti! ne va trovato uno migliore
        var sdegree = seconds * 6;
        var srotate = "rotate(" + sdegree + "deg)";

        $("#sec").css({ "-moz-transform": srotate, "-webkit-transform": srotate });

    }, 1000);


    setInterval(function () {
        //var hours = document.getElementById("hours_webservice").valueOf; //ore prelevate dal webservice
        //var mins = document.getElementById("mins_webservice").valueOf; //minuti prelevati dal webservice
        var hours = new Date().getHours(); //ore prelevate dal sistema
        var mins = new Date().getMinutes(); //minuti prelevati dal sistema
        var hdegree = hours * 30 + (mins / 2);
        var hrotate = "rotate(" + hdegree + "deg)";

        $("#hour").css({ "-moz-transform": hrotate, "-webkit-transform": hrotate });

    }, 1000);


    setInterval(function () {
        //var mins = document.getElementById("mins_webservice").valueOf; //minuti prelevati dal webservice
        var mins = new Date().getMinutes(); //minuti prelevati dal sistema
        var mdegree = mins * 6;
        var mrotate = "rotate(" + mdegree + "deg)";

        $("#min").css({ "-moz-transform": mrotate, "-webkit-transform": mrotate });

    }, 1000);

});