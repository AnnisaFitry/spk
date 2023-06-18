<?php 
function maxSubkriteria($data_calon, $kriteria)
{
    $max_value = 0;
    foreach ($data_calon as $calon) {
        $subkriteria = $calon['kriteria'][$kriteria]['bobot_subkriteria'];
        if ($subkriteria > $max_value) {
            $max_value = $subkriteria;
        }
    }
    return $max_value;
}

 ?>