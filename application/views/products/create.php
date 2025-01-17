<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Manage
      <small>Batches</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Batches</li>
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
            <h3 class="box-title">Add Batches</h3>
          </div>
          <!-- /.box-header -->
          <form role="form" action="<?php base_url('users/create') ?>" method="post" enctype="multipart/form-data">
            <div class="box-body">

              <?php echo validation_errors(); ?>
              <!-- 
                <div class="form-group">

                  <label for="product_image">Image</label>
                  <div class="kv-avatar">
                      <div class="file-loading">
                          <input id="product_image" name="product_image" type="file">
                      </div>
                  </div>
                </div> -->

              <!-- <div class="form-group">
                  <label for="product_name">Package Name</label>
                  <input type="text" class="form-control" id="pname" style='text-transform:uppercase' name="pname" placeholder="Enter Package Name" autocomplete="off"/>
                </div> -->

              <div class="form-group">
                <label for="product_name">Batch Name</label>
                <input type="text" class="form-control" id="product_name" name="product_name"
                  placeholder="Enter Course Name" autocomplete="off" />
                <input type="hidden" class="form-control" id="sku" name="sku" placeholder="Enter Duration" value="0"
                  autocomplete="off" />
                <input type="hidden" class="form-control" id="price" name="price" value="0" autocomplete="off" />
                <input type="hidden" class="form-control" id="qty" name="qty" placeholder="Enter Timing" value="0"
                  autocomplete="off" />
              </div>

              <!-- <div class="form-group">
                  <label for="sku">Duration</label>
                  <input type="text" class="form-control" id="sku" name="sku" placeholder="Enter Duration" value="0" autocomplete="off" />
                </div> -->

              <!--                 
                <div class="form-group">
                  <label for="sku">Timing</label>
                  <input type="text" class="form-control" id="timing" name="timing" placeholder="Enter Time in hrs" autocomplete="off" />
                </div>
          
          -->
              <!-- 
                <div class="form-group">
                  <label for="price">Price</label>
                  <input type="text" class="form-control" id="price" name="price" value="0" autocomplete="off" />
                </div> -->

              <!-- <div class="form-group">
                  <label for="qty">Timing</label>
                  <input type="hidden" class="form-control" id="qty" name="qty" placeholder="Enter Timing" value="0" autocomplete="off" />
                </div> -->

              <div class="form-group">
                <label for="description">Description</label>
                <textarea type="text" class="form-control" id="description" name="description" placeholder="Enter 
                  description" autocomplete="off">
                  </textarea>
              </div>



              <div class="form-group">
                <label for="brands">Courses</label>
                <select class="form-control select_group" id="brands" name="brands[]" multiple="multiple">
                  <?php foreach ($brands as $k => $v): ?>
                    <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                  <?php endforeach ?>
                </select>
              </div>



              <div class="form-group">
                <label for="store">Branch</label>
                <select class="form-control select_group" id="store" name="store">
                  <?php foreach ($stores as $k => $v): ?>
                    <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                  <?php endforeach ?>
                </select>
              </div>

              <div class="form-group">
                <label for="store">Availability</label>
                <select class="form-control" id="availability" name="availability">
                  <option value="1">Yes</option>
                  <option value="2">No</option>
                </select>
              </div>

            </div>
            <!-- /.box-body -->

            <div class="box-footer">
              <button type="submit" class="btn btn-primary">Save Changes</button>
              <a href="<?php echo base_url('products/') ?>" class="btn btn-warning">Back</a>
            </div>
          </form>
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

<script type="text/javascript">
  $(document).ready(function () {
    $(".select_group").select2();
    $("#description").wysihtml5();

    $("#mainProductNav").addClass('active');
    $("#addProductNav").addClass('active');

    var btnCust = '<button type="button" class="btn btn-secondary" title="Add picture tags" ' +
      'onclick="alert(\'Call your custom code here.\')">' +
      '<i class="glyphicon glyphicon-tag"></i>' +
      '</button>';
    $("#product_image").fileinput({
      overwriteInitial: true,
      maxFileSize: 1500,
      showClose: false,
      showCaption: false,
      browseLabel: '',
      removeLabel: '',
      browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>',
      removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
      removeTitle: 'Cancel or reset changes',
      elErrorContainer: '#kv-avatar-errors-1',
      msgErrorClass: 'alert alert-block alert-danger',
      // defaultPreviewContent: '<img src="/uploads/default_avatar_male.jpg" alt="Your Avatar">',
      layoutTemplates: { main2: '{preview} ' + btnCust + ' {remove} {browse}' },
      allowedFileExtensions: ["jpg", "png", "gif"]
    });

  });
</script>