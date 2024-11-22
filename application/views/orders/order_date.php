<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Manage
      <small>Enrollment</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Enrollment</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">

      <div class="col-md-12 col-xs-12">

        <div id="messages"></div>

        <?php if ($this->session->flashdata('success')): ?>
          <div class="alert alert-success alert-dismissible" role="alert">
            <button type="submit" onclick="errorSessionDestory();" class="close" data-dismiss="alert"
              aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <?php echo $this->session->flashdata('success'); ?>
          </div>
        <?php endif; ?>
        <?php if ($this->session->flashdata('error')): ?>
          <div class="alert alert-error alert-dismissible" role="alert">
            <button type="submit" onclick="errorSessionDestory();" class="close" data-dismiss="alert"
              aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <?php echo $this->session->flashdata('error'); ?>
          </div>
        <?php endif; ?>


        <div class="box">
          <div class="box-header">
            <h3 class="box-title">Manage Enrollment</h3>
          </div>
          <!-- /.box-header -->


          <div class="box-body">
            <table id="manageTable" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>location</th>
                  <th>Branch</th>
                  <th>Edu Qulification</th>
                  <th>Student Name</th>
                  <th>Student Phone</th>
                  <th>Date </th>
                  <th>Batch</th>
                  <th>Courses</th>
                  <th>Total Amount</th>
                  <th>Remaining</th>
                  <th>Paid</th>
                  <th>Paid status</th>

                </tr>
              </thead>

              <?php if ($order_data) {
                foreach ($order_data as $v) { ?>
                  <tr>
                    <?php foreach ($v as $key => $r) {

                      ?>

                      <td><?php echo $r; ?></td>

                    <?php } ?>
                  </tr>
                <?php }
              } ?>


            </table>
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
      <!-- col-md-12 -->
    </div>






    <div class="box-footer">
      <!-- /.row -->
      <a href="<?php echo base_url('orders/date_wise') ?>" class="btn btn-warning">Back</a>
    </div>
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->


<script type="text/javascript">
  var manageTable;
  var base_url = "<?php echo base_url(); ?>";

  $(document).ready(function () {

    $("#mainOrdersNav").addClass('active');
    $("#manageOrdersNav").addClass('active');

    // initialize the datatable 
    manageTable = $('#manageTable').DataTable({
      scrollY: true,
autoWidth: false,
      "scrollX": false,
      dom: 'Bfrtip',
      buttons: [
        'copy', 'csv', 'excel', 'pdf', 'print'
      ]
    });


  });




</script>