<!DOCTYPE html>
<html lang="en">

<head>
    <?php include "../component/helmet.php" ?>
    <title>History</title>
</head>

<body>
    <?php include "../process/getAdminLoginData.php" ?>
    <?php include "../component/admin/sidebaropen.php" ?>

    <div class="card">
        <div class="card-body">
            <h1 class="card-title">Mahasiswa
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#tambah_siswa">Tambah Mahasiswa</button>
            </h1>

            <div class="collapse mb-4" id="tambah_siswa">
                <form action="../actions/siswa_baru.php" method="post">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label for="nama_siswa">Nama Mahasiswa</label>
                                <input type="text" class="form-control" name="nama" id="nama_siswa" required>
                            </div>

                            <div class="form-group">
                                <label for="kelamin">Kelamin </label>
                                <select class="form-control" id="kelamin" name="kelamin" required>
                                    <option value="laki-laki">Laki-Laki</option>
                                    <option value="perempuan">Perempuan</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label for="email_siswa">Email </label>
                                <input type="email" class="form-control" name="email" id="email_siswa" required>
                            </div>

                            <div class="form-group">
                                <label for="tingkatan">Tingkatan </label>
                                <select class="form-control" id="tingkatan" name="tingkatan" required>
                                    <!-- <option value="I">I</option>
                                    <option value="II">II</option>
                                    <option value="III">III</option>
                                    <option value="IV">IV</option>
                                    <option value="V">V</option>
                                    <option value="VI">VI</option> -->
                                    <option value="VII">S1</option>
                                    <option value="VIII">S2</option>
                                    <option value="IV">S3</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label for="kelas_siswa">Kelas </label>
                                <input type="text" class="form-control" name="kelas" id="kelas_siswa" required>
                            </div>

                            <div class="form-group">
                                <label for="jurusan_siswa">Jurusan </label>
                                <input type="text" class="form-control" name="jurusan" id="jurusan_siswa" required>
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label for="nisn_siswa">No Bp</label>
                                <input type="text" class="form-control" name="nisn" id="nisn_siswa" required>
                            </div>

                            <div class="form-group">
                                <label for="saldo_awal_siswa">Saldo Awal </label>
                                <input type="number" class="form-control uang" name="saldo" id="saldo_awal_siswa" value="0" required>
                            </div>
                        </div>
                    </div>

                    <input type="hidden" name="idsekolah" value="<?=$data["id_sekolah"]?>">
                    <input type="hidden" name="adminid" value="<?=$data["id"]?>">

                    <input type="submit" class="btn btn-primary" value="Masukan">
                </form>
            </div>

            <div class="card card-body">
                <?php 
                $siswa = $db->getSeluruhSiswa($data["id_sekolah"]);
                if ($siswa) {
                    ?>

                <div class="table-responsive">
                    <table id="listSiswa" class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tanggal Pendaftaran</th>
                                <th>Nama</th>
                                <th>Kelamin</th>
                                <th>Email</th>
                                <th>Kelas</th>
                                <th>No Bp</th>
                                <th>Saldo</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach ($siswa as $siswa) {
                                ?>

                            <tr>
                                <td><?= $siswa->id ?></td>
                                <td><?= $siswa->tanggal_pendaftaran ?></td>
                                <td><?= ucwords($siswa->nama) ?></td>
                                <td><?= $siswa->kelamin ?></td>
                                <td><?= $siswa->email ?></td>
                                <td><?= "$siswa->jurusan $siswa->kelas" ?></td>
                                <td><?= $siswa->nisn ?></td>
                                <td data-sort="<?=$siswa->saldo?>"><?= rupiah($siswa->saldo) ?></td>
                                <td><a href="detail_siswa.php?id=<?=$siswa->id?>" class="btn btn-primary">Detail</a></td>
                            </tr>

                            <?php

                        }
                        ?>

                        </tbody>
                    </table>
                </div>

                <?php

            } else {
                echo "<p class='card-text'>Tidak ada siswa yang dapat ditampilkan</p>";
            }
            ?>
            </div>
        </div>

    </div>

    <?php include "../component/siswa/sidebarclose.php" ?>
    <?php include "../component/scripts.php" ?>
    <?php require "../component/scrollTop.php" ?>

    <script>
        $(document).ready(function() {
            $('#listSiswa').DataTable({
                "order": [
                    [1, "desc"]
                ],
                "language": {
                    "lengthMenu": "Tampilkan _MENU_ siswa per halaman",
                    "zeroRecords": "Maaf, tidak dapat menemukan apapun",
                    "info": "Menampilkan halaman _PAGE_ dari _PAGES_ halaman",
                    "infoEmpty": "Tidak ada siswa yang dapat ditampilkan",
                    "infoFiltered": "(tersaring dari _MAX_ total siswa)",
                    "search": "Cari:",
                    "paginate": {
                        "first": "Pertama",
                        "last": "Terakhir",
                        "next": "Berikutnya",
                        "previous": "Sebelumnya"
                    },
                }
            });
        });
    </script>
</body>

</html> 