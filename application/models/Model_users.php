<?php

class Model_users extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	public function getUserData($userId = null)
	{
		if ($userId) {
			$sql = "SELECT * FROM `users` WHERE id  = ? order by id desc";
			$query = $this->db->query($sql, array($userId));
			return $query->row_array();
		}

		$sql = "SELECT * FROM `users` WHERE id <> ? order by id desc";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	public function getUserDataById($userId = null)
	{
		if ($userId) {
			$sql = "SELECT * FROM `users` WHERE id  = ? order by id desc";
			$query = $this->db->query($sql, array($userId));
			return $query->row_array();
		}
		return array();
	}
	public function getUserGroup($userId = null)
	{
		if ($userId) {
			$sql = "SELECT * FROM user_group WHERE user_id  = ? order by id desc";
			$query = $this->db->query($sql, array($userId));
			$result = $query->row_array();

			$group_id = $result['group_id'];
			$g_sql = "SELECT * FROM `groups` WHERE id  = ? order by id desc";
			$g_query = $this->db->query($g_sql, array($group_id));
			$q_result = $g_query->row_array();
			return $q_result;
		}
	}

	public function create($data = '', $group_id = null)
	{

		if ($data && $group_id) {
			$create = $this->db->insert('users', $data);

			$user_id = $this->db->insert_id();

			$group_data = array(
				'user_id' => $user_id,
				'group_id' => $group_id
			);

			$group_data = $this->db->insert('user_group', $group_data);

			return ($create == true && $group_data) ? true : false;
		}
	}

	//update for user email and password 30/4/19
	public function update_user($data = '', $group_id = null, $email = null)
	{

		if ($data && $group_id && $email) {
			$this->db->where('email', $email);
			$create = $this->db->update('users', $data);

			return ($create == true) ? true : false;
		}
	}


	public function edit($data = array(), $id = null, $group_id = null)
	{
		$this->db->where('id', $id);
		$update = $this->db->update('users', $data);

		if ($group_id) {
			// user group
			$update_user_group = array('group_id' => $group_id);
			$this->db->where('user_id', $id);
			$user_group = $this->db->update('user_group', $update_user_group);
			return ($update == true && $user_group == true) ? true : false;
		}

		return ($update == true) ? true : false;
	}

	public function delete($id)
	{
		$this->db->where('id', $id);
		$delete = $this->db->delete('users');
		return ($delete == true) ? true : false;
	}

	public function countTotalUsers()
	{
		$sql = "SELECT * FROM users order by id desc";
		$query = $this->db->query($sql);
		return $query->num_rows();
	}


	public function getSingleUserData($email = null)
	{
		if ($email) {
			$sql = "SELECT id FROM users WHERE email  = ? order by id desc";
			$query = $this->db->query($sql, array($email));
			$data = $query->result_array();
			foreach ($data as $v) {
				$sql = "SELECT group_id FROM user_group WHERE id  = ? order by id desc";
				$query = $this->db->query($sql, array($v));
				return $query->result_array();
			}

		}
	}


	public function getStaffData()
	{
		$sql = "SELECT * FROM users join user_group on users.id=user_group.user_id WHERE group_id  = ? order by users.id desc";
		$query = $this->db->query($sql, array(19));
		return $query->result_array();
	}

	public function getStudentData()
	{
		$sql = "SELECT * FROM users join user_group on users.id=user_group.user_id WHERE group_id  = ? order by users.id desc";
		$query = $this->db->query($sql, array(15));
		return $query->result_array();
	}

}