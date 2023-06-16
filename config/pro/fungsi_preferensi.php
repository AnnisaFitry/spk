<?php 
function NilaiPreferensiPrometheeII($jka, $bobot) {
    $nilai_pref = 0;

    if ($jka < 0) {
        $nilai_pref = 0;
    } elseif ($jka > 0) {
        $nilai_pref = $jka;
        // $nilai_pref = 1;
    }

    $nilai_pref *= $bobot;

    return $nilai_pref;
}

 ?>