<?php
// Konfigurasi koneksi ke database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "spk_pro";

// Buat koneksi ke database
$conn = new mysqli($servername, $username, $password, $dbname);

// Periksa koneksi
if ($conn->connect_error) {
    die("Koneksi ke database gagal: " . $conn->connect_error);
}

// Ambil data dari tabel kriteria
$sql = "SELECT * FROM kriteria";
$result = $conn->query($sql);

$kriteria = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $kriteria[$row["id"]] = array(
            "nama" => $row["nama"],
            "bobot" => $row["bobot"],
            "jenis" => $row["jenis"]
        );
    }
}

// Ambil data dari tabel subkriteria
$sql = "SELECT * FROM subkriteria";
$result = $conn->query($sql);

$subkriteria = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $subkriteria[$row["id"]] = array(
            "kriteria_id" => $row["kriteria_id"],
            "nama" => $row["nama"],
            "bobot" => $row["bobot"]
        );
    }
}

// Ambil data dari tabel calon
$sql = "SELECT * FROM calon";
$result = $conn->query($sql);

$calon = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $calon[$row["id"]] = array(
            "nama" => $row["nama"],
            "jenis_kelamin" => $row["jenis_kelamin"],
            "kecamatan" => $row["kecamatan"]
        );
    }
}

// Ambil data dari tabel calon_subkriteria
$sql = "SELECT * FROM calon_subkriteria";
$result = $conn->query($sql);

$calon_subkriteria = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $calon_subkriteria[$row["calon_id"]][$row["subkriteria_id"]] = $row["bobot"];
    }
}

// Normalisasi bobot kriteria
$total_bobot = array_sum(array_column($kriteria, "bobot"));
foreach ($kriteria as $kriteria_id => $data_kriteria) {
    $kriteria[$kriteria_id]["bobot"] = $data_kriteria["bobot"] / $total_bobot;
}

// Normalisasi bobot subkriteria
foreach ($subkriteria as $subkriteria_id => $data_subkriteria) {
    $kriteria_id = $data_subkriteria["kriteria_id"];
    $subkriteria[$subkriteria_id]["bobot"] = $data_subkriteria["bobot"] * $kriteria[$kriteria_id]["bobot"];
}

// Inisialisasi variabel jarak_kriteria, h_d, ranking, hasil
$jarak_kriteria = array();
$h_d = array();
$ranking = array();
$hasil = array();

// Perhitungan jarak kriteria dan h_d
foreach ($kriteria as $kriteria_id => $data_kriteria) {
    $bobot = $data_kriteria["bobot"];

    // Inisialisasi variabel jka dan nilai_pref
    $jka = array();
    $nilai_pref = array();

    foreach ($calon as $calon_id => $data_calon) {
        $jka[$calon_id] = array();
        $nilai_pref[$calon_id] = array();

        foreach ($calon as $other_calon_id => $other_data_calon) {
            if ($calon_id == $other_calon_id) {
                continue;
            }

            $jka_value = 0;

            foreach ($subkriteria as $subkriteria_id => $data_subkriteria) {
                $calon_subkriteria_bobot = $calon_subkriteria[$calon_id][$subkriteria_id];
                $other_calon_subkriteria_bobot = $calon_subkriteria[$other_calon_id][$subkriteria_id];

                $jka_value += abs($calon_subkriteria_bobot - $other_calon_subkriteria_bobot);
            }

            $jka[$calon_id][$other_calon_id] = $jka_value;

            // Menggunakan nilai preferensi Promethee II tanpa tipe kriteria dan parameter p dan q
            $nilai_pref[$calon_id][$other_calon_id] = nilaiPreferensiPrometheeII($jka_value, $bobot);
        }
    }

    $jarak_kriteria[$kriteria_id] = $jka;
    $h_d[$kriteria_id] = $nilai_pref;
}

// Perhitungan ranking dan hasil
foreach ($calon as $calon_id => $data_calon) {
    $ranking[$calon_id] = array_sum($h_d) / (count($calon) - 1);

    $hasil[$calon_id]["leaving"] = array_sum($ranking[$calon_id]) / (count($calon) - 1);
}

foreach ($calon as $calon_id => $data_calon) {
    $tmp_entering = 0;
    foreach ($calon as $other_calon_id => $other_data_calon) {
        $tmp_entering += $ranking[$other_calon_id][$calon_id];
    }
    $hasil[$calon_id]["entering"] = $tmp_entering / (count($calon) - 1);
    $hasil[$calon_id]["net_flow"] = $hasil[$calon_id]["leaving"] - $hasil[$calon_id]["entering"];
    $hasil[$calon_id]["status"] = $hasil[$calon_id]["net_flow"] < 0 ? "Ditolak" : "Diterima";
}

// Fungsi untuk menghitung nilai preferensi Promethee II
function nilaiPreferensiPrometheeII($jka, $bobot)
{
    // Sesuaikan dengan rumus yang ingin Anda gunakan
    return $jka * $bobot;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Hasil Promethee II</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Hasil Promethee II</h1>
    <table>
        <tr>
            <th>Calon</th>
            <th>Leaving Flow</th>
            <th>Entering Flow</th>
            <th>Net Flow</th>
            <th>Status</th>
        </tr>
        <?php foreach ($hasil as $calon_id => $data_hasil): ?>
        <tr>
            <td><?php echo $calon[$calon_id]["nama"]; ?></td>
            <td><?php echo $data_hasil["leaving"]; ?></td>
            <td><?php echo $data_hasil["entering"]; ?></td>
            <td><?php echo $data_hasil["net_flow"]; ?></td>
            <td><?php echo $data_hasil["status"]; ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>
