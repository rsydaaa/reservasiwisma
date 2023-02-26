<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Models\Room;
use App\Models\Promo;


class AdminPromoController extends Controller
{
    public function index()
    {
        $promo = Promo::get();
        return view('admin.promo_view', compact('promo'));
    }

    public function add()
    {
        return view('admin.promo_add');
    }

    public function store(Request $request)
    {
        $request->validate([
            'id' => 'required',
            'nama_promo' => 'required',
            'nama_wisma' => 'required',
            'kamar' => 'required',
            'start_date' => 'required',
            'finish_date' => 'required',
            'kuota' => 'required',
            'discount' => 'required',
            'action' => 'required',
            
        ]);

        $obj = new Promo();
        $obj->id = $request->id;
        $obj->nama_promo = $request->nama_promo;
        $obj->nama_wisma = $request->nama_wisma;
        $obj->kamar = $request->produk;
        $obj->start_date = $request->start_date;
        $obj->finish_date = $request->finish_date;
        $obj->kuota = $request->kuota;
        $obj->discount = $request->discount;
        $obj->action = $request->action;
        $obj->save();

        return redirect()->back()->with('success', 'Promo is added successfully.');

    }

    public function promo_edit($id)
    {
        $promo = Promo::get();
        $room = Room::where('id',$id)->first();

        
        return view('admin.promo_edit', compact('room'));
    
    }

    public function promo_update(Request $request)
    {
        $promo = Promo::where('id',$request->id)->first();
        $promo->status = $request->status;
        $promo->save();
        return redirect()->route('admin_promo')->with('success',' Status Promo Updated Successfully');
    }

    public function delete($id)
    {
        $obj = Promo::where('id',$id)->delete();
        

        return redirect()->back()->with('success', 'Promo is deleted successfully');
    }
    public function change_status($id)
    {
        $promo_data = promo::where('id',$id)->first();
        if($promo_data->status == 1) {
            $promo_data->status = 0;
        } else {
            $promo_data->status = 1;
        }
        $promo_data->update();
        return redirect()->back()->with('success', 'Status is changed successfully.');
    }
}
