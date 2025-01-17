<?php 

class Model_products extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	/* get the brand data */
	public function getProductData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM products where id  = ? order by id desc";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM products ORDER BY id DESC";
		$query = $this->db->query($sql);
		return $query->result_array();
	}




	// public function getProductColor($id = null)
	// { 
	// 	if($id) {
	// 		$sql = "SELECT attribute_value_id FROM products where id  = ? order by id desc";
	// 		$query = $this->db->query($sql, array($id));
	// 		//return $query->row_array();
	// 		$data[30];
	// 		$i=0;
	// 		foreach($query->result() as $row)
	// 		{
	// 		  $sql = "SELECT value FROM attribute_value where id  = ? order by id desc";
	// 		  $query = $this->db->query($sql, $row->id);
	// 		  $data[$i]=$query->row_array();
	// 		}
	// 		return $data;
	// 	}

	// }
	public function getActiveProductData()
	{
		$sql = "SELECT * FROM products WHERE availability = ? ORDER BY id DESC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}


	public function getcolor()
	{
		$sql = "SELECT * FROM attribute_value WHERE attribute_value_id=2 order by id desc";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('products', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('products', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('products');
			return ($delete == true) ? true : false;
		}
	}

	public function countTotalProducts()
	{
		$sql = "SELECT * FROM products order by id desc";
		$query = $this->db->query($sql);
		return $query->num_rows();
	}


	public function brandinfo($val)
	{
		
		
	}

}