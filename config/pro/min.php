<?php 
function minSubkriteria($data_calon, $kriteria)
{
    $min_value = PHP_FLOAT_MAX;
    foreach ($data_calon as $calon) {
        $subkriteria = $calon['kriteria'][$kriteria]['bobot_subkriteria'];
        if ($subkriteria < $min_value) {
            $min_value = $subkriteria;
        }
    }
    return $min_value;
}

 ?>