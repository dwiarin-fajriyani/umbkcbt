<?php

defined('APLIKASI') or exit('Anda tidak dizinkan mengakses langsung script ini!');

?>

<style type="text/css">
    table {
        font-family: 'OCR A Extended';
        border-collapse: collapse;
        border: 0;
        width: 100%;
        box-shadow: 1px 2px 3px #ccc;
    }

    .center {
        text-align: center;
    }

    .center table {
        margin: 1em auto;
        text-align: left;
    }

    .center th {
        text-align: center !important;
    }

    td,
    th {
        border: 1px solid #666;
        font-size: 90%;
        vertical-align: baseline;
        padding: 4px 5px;
    }

    h1 {
        font-size: 150%;
    }

    h2 {
        font-size: 125%;
    }

    .p {
        text-align: left;
    }

    .e {
        background-color: #F5F5DC;
        width: 300px;
        font-weight: bold;
    }

    .h {
        background-color: #99c;
        font-weight: bold;
    }

    .v {
        background-color: #DCDCDC;
        max-width: 300px;
        overflow-x: auto;
        word-wrap: break-word;
    }

    .v i {
        color: #999;
    }
</style>
<div class='animated flipInX col-md-12'>
                <!-- /.box-header -->
                <div class='box box-solid direct-chat direct-chat-warning'>
                <div class='box-header with-border'>
                    <h3 class='box-title'><i class='fa fa-history'></i> Log Siswa</h3>
                    <div class='box-tools pull-right'>
                        <a href='?pg=<?= $pg ?>&ac=clearlog' class='btn btn-default' title='Bersihkan Log'><i class='fa fa-trash'></i></a>
                    </div>
                </div>
                <div class='box-body'>
                    <div id='log-list'>
                        <p class='text-center'>
                            <br /><i class='fa fa-spin fa-circle-o-notch'></i> Loading....
                        </p>
                    </div>
                </div>
            </div>
</div>

					<?php
					if ($ac == 'clearlog') {
						mysqli_query($koneksi, "TRUNCATE log");
						jump('?pg=informasi');
					}
					?>				
