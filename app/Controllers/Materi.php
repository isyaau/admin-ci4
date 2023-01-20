<?php

namespace App\Controllers;

class Materi extends BaseController
{

    public function index()
    {
        $materiModel = $this->materiModel;
        $data['materi'] = $materiModel->findAll();

        $data['title'] = 'Materi';
        return view('materi/index', $data);
    }
    public function add()
    {
        $data['title'] = 'Create';
        return view('users/create', $data);
    }

    public function activate()
    {
        $materiModel = $this->materiModel;

        $data = [
            'active_hash' => null,
            'active' => $this->request->getVar('active') == '0' || '' ? '1' : '0',
        ];
        $materiModel->update($this->request->getVar('id'), $data);

        return redirect()->to(base_url('/materi'));
    }
}
