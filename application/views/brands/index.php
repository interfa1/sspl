<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Manage
      <small>Courses</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Course</li>
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

        <?php if (in_array('createBrand', $user_permission)): ?>
          <button class="btn btn-primary" data-toggle="modal" data-target="#addBrandModal">Add Course</button>
          <br /> <br />
        <?php endif; ?>

        <div class="box">
          <div class="box-header">
            <h3 class="box-title">Manage Course</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table id="manageTable" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Course Name</th>
                  <th>Project Name</th>
                  <!--<th>Price</th>-->
                  <th>Duration In Month</th>
                  <th>Duration In Hours</th>
                  <th>Status</th>
                  <?php if (in_array('updateBrand', $user_permission) || in_array('deleteBrand', $user_permission)): ?>
                    <th>Action</th>
                  <?php endif; ?>
                </tr>
              </thead>

            </table>
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
      <!-- col-md-12 -->
    </div>
    <!-- /.row -->


  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<?php if (in_array('createBrand', $user_permission)): ?>
  <!-- create brand modal -->
  <div class="modal fade" tabindex="-1" role="dialog" id="addBrandModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
              aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Add Course</h4>
        </div>

        <form role="form" action="<?php echo base_url('brands/create') ?>" method="post" id="createBrandForm">

          <div class="modal-body">

            <div class="form-group">
              <label for="project_id">Select Project</label>
              <select name="project_id" id="project_id" type="text" class="form-control">
                <?php

                $sql = "SELECT * FROM stores WHERE active  = ? order by id desc";
                $query = $this->db->query($sql, array(1));
                $branch = $query->result_array();

                foreach ($branch as $v) {
                  ?>
                  <option value="<?php echo $v['id'] ?>">
                    <?php echo $v['name']; ?>
                  </option>
                <?php } ?>
              </select>
            </div>
            <div class="form-group">
              <label for="brand_name">Course Name</label>
              <input type="text" class="form-control" id="brand_name" name="brand_name" placeholder="Enter Course name"
                autocomplete="off">
            </div>

            <div class="row">
              <div class="form-group col-md-6">
                <label for="brand_name">Duration In Month</label>
                <input type="text" class="form-control" id="duration_in_months" name="duration_in_months"
                  placeholder="Duration In Month" autocomplete="off">
              </div>
              <div class="form-group col-md-6">
                <label for="brand_name">Duration In Hours</label>
                <input type="text" class="form-control" id="duration_in_hours" name="duration_in_hours"
                  placeholder="Duration In Hours" autocomplete="off">
              </div>
            </div>


            <div class="form-group">
              <label for="active">Status</label>
              <select class="form-control" id="active" name="active">
                <option value="1">Active</option>
                <option value="2">Inactive</option>
              </select>
            </div>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Add Course</button>
          </div>

        </form>


      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
<?php endif; ?>

<?php if (in_array('updateBrand', $user_permission)): ?>
  <!-- edit brand modal -->
  <div class="modal fade" tabindex="-1" role="dialog" id="editBrandModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
              aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Edit Course</h4>
        </div>

        <form role="form" action="<?php echo base_url('brands/update') ?>" method="post" id="updateBrandForm">

          <div class="modal-body">
            <div id="messages"></div>

            <div class="form-group">
              <label for="update_project_id">Select Project</label>
              <select name="project_id" id="update_project_id" class="form-control" type="text">
                <?php

                $sql = "SELECT * FROM stores WHERE active  = ? order by id desc";
                $query = $this->db->query($sql, array(1));
                $branch = $query->result_array();

                foreach ($branch as $v) {
                  ?>
                  <option value="<?php echo $v['id'] ?>">
                    <?php echo $v['name']; ?>
                  </option>
                <?php } ?>
              </select>
            </div>
            <div class="form-group">
              <label for="edit_brand_name">Course Name</label>
              <input type="text" class="form-control" id="edit_brand_name" name="edit_brand_name"
                placeholder="Enter brand name" autocomplete="off">
            </div>

            <!--  Added new coures 3-28-19 -->
            <!--<div class="form-group">-->
            <!--  <label for="brand_name">Price</label>-->
            <!--  <input type="text" class="form-control" id="rate" name="rate" placeholder="Enter price" autocomplete="off">-->
            <!--</div>-->

            <!--<div class="form-group">-->
            <!--  <label for="brand_name">Timing</label>-->
            <!--  <input type="text" class="form-control" id="timing" name="timing" placeholder="Enter Time" autocomplete="off">-->
            <!--</div>-->
            <div class="form-group">
              <label for="brand_name">Duration In Month</label>
              <input type="text" class="form-control" id="update_duration_in_months" name="duration_in_months"
                placeholder="Enter Time" autocomplete="off">
            </div>
            <div class="form-group">
              <label for="brand_name">Duration In Hours</label>
              <input type="text" class="form-control" id="update_duration_in_hours" name="duration_in_hours"
                placeholder="Enter Time" autocomplete="off">
            </div>





            <div class="form-group">
              <label for="edit_active">Status</label>
              <select class="form-control" id="edit_active" name="edit_active">
                <option value="1">Active</option>
                <option value="2">Inactive</option>
              </select>
            </div>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Update Course</button>
          </div>

        </form>


      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
<?php endif; ?>

<?php if (in_array('deleteBrand', $user_permission)): ?>
  <!-- remove brand modal -->
  <div class="modal fade" tabindex="-1" role="dialog" id="removeBrandModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
              aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Remove Course</h4>
        </div>

        <form role="form" action="<?php echo base_url('brands/remove') ?>" method="post" id="removeBrandForm">
          <div class="modal-body">
            <p>Do you really want to remove?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Save changes</button>
          </div>
        </form>


      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
<?php endif; ?>



<script type="text/javascript">
  var manageTable;

  $(document).ready(function () {

    $("#brandNav").addClass('active');

    // initialize the datatable 
    manageTable = $('#manageTable').DataTable({
      'ajax': 'fetchBrandData',
      'order': [],
      buttons: [
        'copy', 'csv', 'excel', 'pdf', 'print'
      ]
    });

    // submit the create from 
    $("#createBrandForm").unbind('submit').on('submit', function () {
      var form = $(this);

      // remove the text-danger
      $(".text-danger").remove();

      $.ajax({
        url: form.attr('action'),
        type: form.attr('method'),
        data: form.serialize(), // /converting the form data into array and sending it to server
        dataType: 'json',
        success: function (response) {

          manageTable.ajax.reload(null, false);

          if (response.success === true) {
            $("#messages").html('<div class="alert alert-success alert-dismissible" role="alert">' +
              '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
              '<strong> <span class="glyphicon glyphicon-ok-sign"></span> </strong>' + response.messages +
              '</div>');


            // hide the modal
            $("#addBrandModal").modal('hide');

            // reset the form
            $("#createBrandForm")[0].reset();
            $("#createBrandForm .form-group").removeClass('has-error').removeClass('has-success');

          } else {

            if (response.messages instanceof Object) {
              $.each(response.messages, function (index, value) {
                var id = $("#" + index);

                id.closest('.form-group')
                  .removeClass('has-error')
                  .removeClass('has-success')
                  .addClass(value.length > 0 ? 'has-error' : 'has-success');

                id.after(value);

              });
            } else {
              $("#messages").html('<div class="alert alert-warning alert-dismissible" role="alert">' +
                '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
                '<strong> <span class="glyphicon glyphicon-exclamation-sign"></span> </strong>' + response.messages +
                '</div>');
            }
          }
        }
      });

      return false;
    });


  });

  function editBrand(id) {
    $.ajax({
      url: 'fetchBrandDataById/' + id,
      type: 'post',
      dataType: 'json',
      success: function (response) {

        $("#edit_brand_name").val(response.name);
        $("#rate").val(response.rate);
        $("#update_duration_in_months").val(response.duration_in_months);
        $("#update_duration_in_hours").val(response.duration_in_hours);
        $("#update_project_id").val(response.project_id);
        $("#edit_active").val(response.active);

        // submit the edit from 
        $("#updateBrandForm").unbind('submit').bind('submit', function () {
          var form = $(this);

          // remove the text-danger
          $(".text-danger").remove();

          $.ajax({
            url: form.attr('action') + '/' + id,
            type: form.attr('method'),
            data: form.serialize(), // /converting the form data into array and sending it to server
            dataType: 'json',
            success: function (response) {

              manageTable.ajax.reload(null, false);

              if (response.success === true) {
                $("#messages").html('<div class="alert alert-success alert-dismissible" role="alert">' +
                  '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
                  '<strong> <span class="glyphicon glyphicon-ok-sign"></span> </strong>' + response.messages +
                  '</div>');


                // hide the modal
                $("#editBrandModal").modal('hide');
                // reset the form 
                $("#updateBrandForm .form-group").removeClass('has-error').removeClass('has-success');

              } else {

                if (response.messages instanceof Object) {
                  $.each(response.messages, function (index, value) {
                    var id = $("#" + index);

                    id.closest('.form-group')
                      .removeClass('has-error')
                      .removeClass('has-success')
                      .addClass(value.length > 0 ? 'has-error' : 'has-success');

                    id.after(value);

                  });
                } else {
                  $("#messages").html('<div class="alert alert-warning alert-dismissible" role="alert">' +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
                    '<strong> <span class="glyphicon glyphicon-exclamation-sign"></span> </strong>' + response.messages +
                    '</div>');
                }
              }
            }
          });

          return false;
        });

      }
    });
  }

  function removeBrand(id) {
    if (id) {
      $("#removeBrandForm").on('submit', function () {

        var form = $(this);

        // remove the text-danger
        $(".text-danger").remove();

        $.ajax({
          url: form.attr('action'),
          type: form.attr('method'),
          data: { brand_id: id },
          dataType: 'json',
          success: function (response) {

            manageTable.ajax.reload(null, false);

            if (response.success === true) {
              $("#messages").html('<div class="alert alert-success alert-dismissible" role="alert">' +
                '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
                '<strong> <span class="glyphicon glyphicon-ok-sign"></span> </strong>' + response.messages +
                '</div>');

              // hide the modal
              $("#removeBrandModal").modal('hide');

            } else {

              $("#messages").html('<div class="alert alert-warning alert-dismissible" role="alert">' +
                '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
                '<strong> <span class="glyphicon glyphicon-exclamation-sign"></span> </strong>' + response.messages +
                '</div>');
            }
          }
        });

        return false;
      });
    }
  }


</script>