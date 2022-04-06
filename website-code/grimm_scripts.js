function loadDoc(num) {
    const storylist =["iron_heinrich_1812", "iron_heinrich_1857", "rapunzel_1812", "rapunzel_1857", "hansel_and_gretal_1812", "hansel_and_gretal_1857", "frau_holle_1812", "frau_holle_1857", "little_red_cap_1812", "little_red_cap_1857", "the_singing_bone_1812one", "the_singing_bone_1819", "girl_without_hands_1812", "girl_without_hands_1857", "the_robber_bridegroom_1812", "the_robber_bridegroom_1857", "little_brier_rose_1812", "little_brier_rose_1857", "little_snow_white_1812", "little_snow_white_1857", "rumpelstiltskin_1812", "rumpelstiltskin_1857", "hans_my_hedgehog_1815", "hans_my_hedgehog_1857"];   
var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("demo").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", storylist[num - 1] + ".xhtml", true);
    xhttp.send();
	document.getElementById("storyMore").style.display="block";
}