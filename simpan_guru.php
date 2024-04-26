<?php
// Koneksi ke database
$host = 'localhost'; // Ganti sesuai dengan host Anda
$user = 'root'; // Ganti sesuai dengan username Anda
$password = ''; // Ganti sesuai dengan password Anda
$database = 'data_guru'; // Ganti sesuai dengan nama database Anda

$conn = new mysqli($host, $user, $password, $database);

// Periksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Ambil data dari form
$nama = $_POST['nama'];
$nip = $_POST['nip'];

// Simpan data ke dalam database
$sql = "INSERT INTO guru (nama, nip) VALUES ('$nama', '$nip')";

if ($conn->query($sql) === TRUE) {
    // Redirect ke halaman form_guru.php
    header("Location: form_guru.php");
    exit();
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Tutup koneksi
$conn->close();
?>
