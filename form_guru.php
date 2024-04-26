<!DOCTYPE html>
<html>
<head>
    <title>Data Siswa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .center {
            text-align: center;
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
        .edit-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            text-align: center;
            display: inline-block;
            text-decoration: none;
            cursor: pointer;
        }
        .edit-btn:hover {
            background-color: #45a049;
        }
        .delete-btn {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            text-align: center;
            display: inline-block;
            text-decoration: none;
            cursor: pointer;
        }
        .delete-btn:hover {
            background-color: #da190b;
        }
        .back-btn {
            background-color: #008CBA;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }
        .back-btn:hover {
            background-color: #005f6b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="center">Form Data SISWA</h2>
        <form action="simpan_guru.php" method="post">
            <label>NIP:</label>
            <input type="text" name="nip"><br>
            <label>Nama:</label>
            <input type="text" name="nama"><br>
            <input type="submit" value="Simpan">
        </form>
        <hr>
        <h2 class="center">Listing Data SISWA</h2>
        <table>
            <tr>
                <th>No</th>
                <th>NIP</th>
                <th>Nama</th>
                <th>Aksi</th>
            </tr>
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

            // Query untuk mengambil data guru
            $sql = "SELECT * FROM guru";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                $no = 1;
                // Output data dari setiap baris
                while($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $no++ . "</td>";
                    echo "<td>" . $row['nip'] . "</td>";
                    echo "<td>" . $row['nama'] . "</td>";
                    echo "<td class='center'><a class='edit-btn' href='edit_guru.php?id=" . $row['id'] . "'>Edit</a> | <a class='delete-btn' href='hapus_guru.php?id=" . $row['id'] . "'>Hapus</a></td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='4' class='center'>Tidak ada data guru</td></tr>";
            }

            // Tutup koneksi
            $conn->close();
            ?>
        </table>
        <br>
        <!-- <p class="center"><a class="back-btn" href="form_guru.php">Kembali ke Form Data Guru</a></p> -->
    </div>
</body>
</html>
