        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Tambah Data</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->

                <div class="row">
                	<div class="col-lg-12">
                		<div class="panel panel-green">
                			<div class="panel-heading">
                				Form Calon Penerima Kredit
                			</div>
                			<div class="panel-body">
                				<form action="config/calon/proses_simpan.php" method="post">
                                    <?php include 'halaman/calon/form.php'; ?>

                					<div class="form-group">
										<div class="col-lg-12">
											<button type="submit" class="btn btn-md btn-success"><i class="fa fa-save"></i> Simpan</button>
											<button type="reset" class="btn btn-md btn-warning"><i class="fa fa-undo"></i> Ulangi</button>
										</div>
									</div>

                				</form>
                			</div>
                		</div>
                	</div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->