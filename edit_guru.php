<!DOCTYPE html>
<html>
<head>
    <title>Edit Data Siswa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px; /* Ubah padding sesuai kebutuhan */
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 style="text-align:center;">Edit Data Siswa</h2>
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

        // Query untuk mengambil data guru berdasarkan ID
        $sql = "SELECT * FROM guru WHERE id=$id";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
        ?>
            <form action="update_guru.php" method="post">
                <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                <label>Nama:</label>
                <input type="text" name="nama" value="<?php echo $row['nama']; ?>"><br>
                <label>NIP:</label>
                <input type="text" name="nip" value="<?php echo $row['nip']; ?>"><br>
                <input type="submit" value="Simpan">
            </form>
        <?php
        } else {
            echo "Data siswa tidak ditemukan";
        }

        // Tutup koneksi
        $conn->close();
        ?>
    </div>
</body>
</html>
