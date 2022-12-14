window.addEventListener("message", function(event) {
    if (event.data.type == "open") {
        $("#mainContainer").fadeIn(500);
        frame.openHome();
    } else if (event.data.type == "importeer") {
        data = JSON.parse(event.data.data);

        frame.laadData(data);
    } else if (event.data.type == "gekocht") {
        $("#cardealerinfo").slideUp(500);
        $("#mainContainer").fadeOut(500);
        $.post("https://zb-vliegtuigdealer/sluiten", JSON.stringify({}));
    } else if (event.data.type == "geladen") {
        frame.geladen();
    }
});

document.onkeydown = function(evt) {
    evt = evt || window.event;
    if (evt.key == "Escape") {
        $.post("https://zb-vliegtuigdealer/sluiten", JSON.stringify({}));
        $("#cardealerinfo").slideUp(500);
        $("#mainContainer").fadeOut(500);
    }
}

const app = {
    data() {
        return {
            navCategorie: true, // Navigatie balk onderaan met alle categorieen auto's
            navAutos: false, // Navigatie balk onderaan met alle auto's
            currentCategorie: "planes",

            currentVoeruig: null,
            currentVoertuigNaam: null,
            currentVoertuigPrijs: null,
            currentVoertuigMerk: null,

            autoData: [], // Hier wordt alle auto data in geimporteerd vanaf LUA

            laden: false,
        }
    },

    methods: {
        laadData(data) {
            this.autoData = data;
            this.navAutos = true;
        },

        openCategorie(categorie) {
            this.navCategorie = false;
            this.navAutos = true;
            this.currentCategorie = categorie;
            this.resetScroller();
        },

        openHome() {
            this.navAutos = true;
            $.post("https://zb-vliegtuigdealer/verwijderVoertuig", JSON.stringify({}));
            $("#cardealerinfo").slideUp(500);
            this.resetScroller();
        },

        previewVoertuig(voertuig, keyIndex) {
            // this.autoData["voertuigen"][this.currentCategorie][keyIndex]
            
            // Set data voor links boven informatie dinges
            this.laden = true;
            this.currentVoeruig = voertuig;
            this.currentVoertuigNaam = this.autoData["voertuigen"][this.currentCategorie][keyIndex].naam;
            this.currentVoertuigPrijs = this.autoData["voertuigen"][this.currentCategorie][keyIndex].prijs;
            this.currentVoertuigMerk = this.autoData["voertuigen"][this.currentCategorie][keyIndex].merk; 
            this.currentVoertuigkofferbak = this.autoData["voertuigen"][this.currentCategorie][keyIndex].kofferbak / 1000;


            $("#cardealerinfo").slideUp(300);
            $.post("https://zb-vliegtuigdealer/previewVoertuig", JSON.stringify({
                voertuig: voertuig
            }));
            $("#cardealerinfo").slideDown(300);
        },

        geladen() {
            this.laden = false;
        },

        kopen() {
            // $.post("https://zb-vliegtuigdealer/sluiten", JSON.stringify({}));
            // $("#cardealerinfo").slideUp(500);
            // $("#mainContainer").fadeOut(500);

            $.post("https://zb-vliegtuigdealer/kopen", JSON.stringify({
                voertuig: this.currentVoeruig,
                categorie: this.currentCategorie
            }));
        },

        resetScroller() {
            document.getElementById("scroller").scrollLeft = 0;
        },
    }
}


var frame = Vue.createApp(app).mount("#app");

$(document).ready(function() {
    $('html, body, *').mousewheel(function(e, delta) {
    this.scrollLeft -= (delta * 50);
    // e.preventDefault();
    });
});