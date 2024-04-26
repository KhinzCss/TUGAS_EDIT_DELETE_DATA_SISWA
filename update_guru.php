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
$id = $_POST['id'];
$nama = $_POST['nama'];
$nip = $_POST['nip'];

// Update data guru di dalam database
$sql = "UPDATE guru SET nama='$nama', nip='$nip' WHERE id=$id";

if ($conn->query($sql) === TRUE) {
    // Redirect ke halaman list_guru.php setelah berhasil mengupdate data
    header("Location: list_guru.php");
    exit();
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Tutup koneksi
$conn->close();
?>
