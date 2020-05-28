<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ApiLoginModel extends CI_Model {

	public function checkLogin($username, $password)
	{
		$this->db->where('USERNAME', $username);
		$query = $this->db->get('users');
		if ($query->num_rows() > 0):
			$row = $query->row();
			if ($row->ENABLED == 0):
				return 'INACTIVE';
			elseif(!$row->IS_DELETED == 0):
				return 'INACTIVE';
			elseif($row->PASSWORD != md5($password)):
				return 'EMPTY_PASSWORD';
			else:
				$this->db->set('LAST_LOGIN', date('Y-m-d H:i:s'));
				$this->db->where('ID_USER', $row->ID_USER);
				$this->db->update('users');
				return 'SUCCESS';
			endif;
		else:
			return 'EMPTY';
		endif;
	}

	public function getUsers($username)
	{
		$this->db->where('USERNAME', $username);
		$query = $this->db->get('users');
		return $query->row();
	}

}

/* End of file ApiLoginModel.php */
/* Location: ./application/models/Peternak/ApiLoginModel.php */