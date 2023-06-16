<?php 

$jarak_kriteria = [];
$h_d = [];
$ranking = [];
$hasil = [];

foreach ($data_kriteria['data'] as $key_kriteria => $value_kriteria) {
    $bobot = $value_kriteria['bobot'] / $data_kriteria['ekstra']['total_bobot'];

    $y = 1;
    //Jarak Kriteria
    foreach ($data_calon['data'] as $key_calon_y => $value_calon_y) {
        $tmp_bobot_y = $value_calon_y['kriteria'][$key_kriteria]['nama_subkriteria'] == 'input' ? $value_calon_y['kriteria'][$key_kriteria]['value'] : $value_calon_y['kriteria'][$key_kriteria]['bobot_subkriteria'];

        foreach ($data_calon['data'] as $key_calon_x => $value_calon_x) {
            $tmp_bobot_x = $value_calon_x['kriteria'][$key_kriteria]['nama_subkriteria'] == 'input' ? $value_calon_x['kriteria'][$key_kriteria]['value'] : $value_calon_x['kriteria'][$key_kriteria]['bobot_subkriteria'];

            $jka = $tmp_bobot_x - $tmp_bobot_y;
            $jarak_kriteria[$key_kriteria]['A' . $y][] = $jka;

            //Menggunakan NilaiPreferensiPrometheeII tanpa tipe kriteria dan parameter p dan q
            $nilai_pref = NilaiPreferensiPrometheeII($jka, $bobot);

            $h_d[$key_kriteria]['A' . $y][] = $nilai_pref;
        }
        $y++;
    }
}

for ($i = 0; $i < count($data_calon['data']); $i++) {
    for ($j = 0; $j < count($data_calon['data']); $j++) {
        $tmp_sum = 0;
        foreach ($data_kriteria['data'] as $key => $value) {
            $tmp_sum += $h_d[$key]['A' . ($i + 1)][$j];
        }
        $ranking['A' . ($i + 1)][$j] = $tmp_sum;
    }
    $hasil['A' . ($i + 1)]['entering'] = (array_sum($ranking['A' . ($i + 1)]) / (count($data_calon['data']) - 1)); 
}

$j = 0;
foreach ($data_calon['data'] as $key => $value) {
    $tmp_leaving = 0;
    for ($i = 0; $i < count($data_calon['data']); $i++) {
        $tmp_leaving += $ranking['A' . ($i + 1)][$j];
    }
    $hasil['A' . ($j + 1)]['leaving'] = ($tmp_leaving / (count($data_calon['data']) - 1)); 

    $hasil['A' . ($j + 1)]['net_flow'] = $hasil['A' . ($j + 1)]['leaving'] - $hasil['A' . ($j + 1)]['entering']; 
    $hasil['A' . ($j + 1)]['status'] = $hasil['A' . ($j + 1)]['net_flow'] < 0 ? 'Ditolak' : 'Diterima';
    $hasil['A' . ($j + 1)]['nama'] = $value['nama'];
    $j++;
}

 ?>