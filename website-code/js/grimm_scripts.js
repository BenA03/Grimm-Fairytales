function loadDoc(num) {
    const storylist =[ "iron_heinrich_1812", "iron_heinrich_1857", "rapunzel_1812", "rapunzel_1857", "hansel_and_gretal_1812one", "hansel_and_gretal_1857one", "frau_holle_1812", "frau_holle_1857", "little_red_cap_1812", "little_red_cap_1857", "the_singing_bone_1812one", "the_singing_bone_1819three", "girl_without_hands_1812one", "girl_without_hands_1857one", "the_robber_bridegroom_1812two", "the_robber_bridegroom_1857four", "little_brier_rose_1812", "little_brier_rose_1857", "little_snow_white_1812", "little_snow_white_1857", "rumpelstiltskin_1812", "rumpelstiltskin_1857", "hans_my_hedgehog_1815", "hans_my_hedgehog_1857one"];
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("demo").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "data/readerviews/" + storylist[num - 1] + ".xhtml", true);
    xhttp.send();
    document.getElementById("storyMore").style.display = "block";
    document.getElementById("tooltip").style.display = "block";
    document.getElementById("key").style.display = "block";
    document.getElementById("toggleKey").style.display = "block";
    document.getElementById("jumpStatement").style.display = "block";
    document.getElementById("toggleKey").innerHTML = "<span>Hide the key on the right</span>"
}
function dualDisplay() {
    document.getElementById("storyMore").style.display = "block";
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("dual").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "data/readerviews/story_listFour.xhtml", true);
    xhttp.send();
    document.getElementById("dual").style.display = "block";  
    document.getElementById("dual").style.width = "50%";
    document.getElementById("demo").style.width = "50%";
    document.getElementById("demo").style.marginRight = "5px";
    document.getElementById("dual").style.marginLeft = "5px";

}

function second(num) {
    const storylist =[ "iron_heinrich_1812", "iron_heinrich_1857", "rapunzel_1812", "rapunzel_1857", "hansel_and_gretal_1812one", "hansel_and_gretal_1857one", "frau_holle_1812", "frau_holle_1857", "little_red_cap_1812", "little_red_cap_1857", "the_singing_bone_1812one", "the_singing_bone_1819three", "girl_without_hands_1812one", "girl_without_hands_1857one", "the_robber_bridegroom_1812two", "the_robber_bridegroom_1857four", "little_brier_rose_1812", "little_brier_rose_1857", "little_snow_white_1812", "little_snow_white_1857", "rumpelstiltskin_1812", "rumpelstiltskin_1857", "hans_my_hedgehog_1815", "hans_my_hedgehog_1857one"];

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("dual").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "data/readerviews/" + storylist[num - 1] + ".xhtml", true);
    xhttp.send();
    document.getElementById("closer").style.display = "block";
}

function closeDual() {
    document.getElementById("dual").style.display = "none";    
    document.getElementById("dual").style.width = "0%";
    document.getElementById("demo").style.width = "100%";
    document.getElementById("demo").style.marginRight = "0px";
    document.getElementById("dual").style.marginLeft = "0px";
    document.getElementById("closer").style.display = "none";
}


function toggleKey()
{
    var toggledElement = document.getElementById("key");
    var control = document.getElementById("toggleKey"); 
  if (toggledElement.style.display === "block") {
    toggledElement.style.display = "none";
    control.innerHTML = "<span>Display a key for the highlights</span>"
  } else {
    toggledElement.style.display = "block";
    control.innerHTML = "<span>Hide the key on the right</span>"
  }
}