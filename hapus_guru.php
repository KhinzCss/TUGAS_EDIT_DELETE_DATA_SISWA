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

// Ambil ID guru dari URL
$id = $_GET['id'];

// Hapus data guru dari database
$sql = "DELETE FROM guru WHERE id=$id";

if ($conn->query($sql) === TRUE) {
    // Redirect ke halaman list_guru.php setelah berhasil menghapus data
    header("Location: list_guru.php");
    exit();
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Tutup koneksi
$conn->close();
?>
