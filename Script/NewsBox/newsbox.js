/**
 * Created by Federico on 21/11/2016.
 */
$(function () {
    $(".ultimi_avvisi").bootstrapNews({
        newsPerPage: 4,
        navigation: true,
        autoplay: true,
        direction: 'up', // up or down
        animationSpeed: 'normal',
        newsTickerInterval: 4000, //4 secondi
        pauseOnHover: true,
        onStop: null,
        onPause: null,
        onReset: null,
        onPrev: null,
        onNext: null,
        onToDo: null
    });
});