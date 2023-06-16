<?php 

// function NilaiPreferensi($tp='', $f_jka, $f_q, $f_p='', $f_bobot)
// {
// 	$f_np = 0;

// 	switch ($tp) {
// 		case '2':
// 			if($f_jka < -$f_q | $f_jka > $f_q){
// 				$f_np = 1;
// 			}else{
// 				$f_np = 0;
// 			}

// 			break;
// 		case '4':
// 			if($f_jka > $f_p){
// 				$f_np = 1;
// 			}
// 			else if($f_jka <= $f_q){
// 				$f_np = 0;
// 			}else{
// 				$f_np = 0.5;
// 			}

// 			break;
		
// 		default:
// 			# code...
// 			break;
// 	}

// 	$hasil = $f_np*$f_bobot;

// 	return $hasil;
// }
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