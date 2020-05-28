<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class ApiLoginController extends RestController {

	function __construct()
    {
        // Construct the parent class
        parent::__construct();
        $this->load->model('ApiLoginModel');
    }

    public function users_post()
    {
        $this->form_validation->set_rules('username', 'Username', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');

        $this->form_validation->set_message('required', '%s tidak boleh di kosongkan.');
        if ($this->form_validation->run() == FALSE)
        {
            // Set the response and exit
            $this->response( [
                'status' => false,
                'message' => empty($this->input->post('username'))?'Username tidak boleh kosong':'Password tidak boleh kosong'
            ], 200 );
        }else{
            $status = $this->ApiLoginModel->checkLogin($this->post('username'), $this->post('password'));
            if ($status == 'EMPTY') :
                $this->response( [
                    'status' => false,
                    'message' => 'User tidak ditemukan.'
                ], 200 );
            elseif($status == 'EMPTY_PASSWORD'):
                $this->response( [
                    'status' => false,
                    'message' => 'Password salah.'
                ], 200 );
            elseif($status == 'INACTIVE'):
                $this->response( [
                    'status' => false,
                    'message' => 'User sudah tidak memiliki akses.'
                ], 200 );
            else:
                $this->response( [
                    'status' => true,
                    'message' => 'Berhasil Login.',
                    'data' => $this->ApiLoginModel->getUsers($this->post('username'))
                ], 200 );
            endif;
        }
    }

}

/* End of file ApiLoginController.php */
/* Location: ./application/controllers/Peternak/ApiLoginController.php */