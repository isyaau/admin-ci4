<?php

namespace App\Controllers;

use \Myth\Auth\Models\UserModel;
use \Myth\Auth\Password;

class Users extends BaseController
{

    public function index()
    {
        $userModel = new UserModel();
        $data['users'] = $userModel->findAll();

        $data['title'] = 'Users';
        return view('users/index', $data);
    }
    public function add()
    {
        $data['title'] = 'Create';
        return view('users/create', $data);
    }

    public function activate()
    {
        $userModel = new UserModel();

        $data = [
            'activate_hash' => null,
            'active' => $this->request->getVar('active') == '0' || '' ? '1' : '0',
        ];
        $userModel->update($this->request->getVar('id'), $data);

        return redirect()->to(base_url('/users'));
    }

    public function changePassword($id = null)
    {
        if ($id == null) {
            return redirect()->to(base_url('/users/index'));
        } else {
            $data = [
                'id' => $id,
                'title' => 'Update Password',
            ];
            return view('users/set_password', $data);
        }
    }

    public function setPassword()
    {
        $id = $this->request->getVar('id');
        $rules = [
            'password'     => 'required|strong_password',
            'pass_confirm' => 'required|matches[password]',
        ];

        if (!$this->validate($rules)) {
            $data = [
                'id' => $id,
                'title' => 'Update Password',
                'validation' => $this->validator,
            ];

            return view('users/set_password', $data);
        } else {
            $userModel = new UserModel();
            $data = [
                'password_hash' => Password::hash($this->request->getVar('password')),
                'reset_hash' => null,
                'reset_at' => null,
                'reset_expires' => null,
            ];
            $userModel->update($this->request->getVar('id'), $data);

            return redirect()->to(base_url('/users/index'));
        }
    }
}
