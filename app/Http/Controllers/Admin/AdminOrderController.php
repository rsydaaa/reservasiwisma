<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Models\Customer;
use App\Models\Order;
use App\Models\Room;
use App\Models\OrderDetail;
use Collective\Html\FormFacade as Form;

class AdminOrderController extends Controller
{
    public function index()
    {
        $orders = Order::get();
        return view('admin.orders', compact('orders'));
    }

    public function add()
    {
        $all_order = Order::get();
        $all_customer = Customer::get();
        $all_room = Room::get();
        return view('admin.order_add',compact('all_order','all_customer','all_room'));
    }

    public function store(Request $request)
    {
        $room = '';
        $i=0;
        if(isset($request->arr_room)) {
            foreach($request->arr_room as $item) {
                if($i==0) {
                    $room .= $item;
                } else {
                    $room .= ','.$item;
                }            
                $i++;
            }
        }

        $customer = '';
        $i=0;
        if(isset($request->arr_customer)){
            foreach($request->arr_customer as $name){
                if($i==0) {
                    $customer .= $name;
                } else {
                    $customer .= ','.$name;
                }
                $i++;
                }
            }
        

        $request->validate([
            'customer_id' => 'required',
            'room_id' => 'required',
            'order_no' => 'required',

        ]);

        $obj = new Order();
        $obj->customer_id = $customer;
        $obj->order_no = $request->description;
        $obj->checkin_date = $request->checkin_date;
        $obj->checkout_date = $request->checkout_date;
        $obj->adult = $request->adult;
        $obj->children = $request->childern;
        $obj->price = $request->price;
        $obj->subtotal = $request->subtotal;
       
        $obj->save();

        return redirect()->back()->with('success', 'Room is added successfully.');

    }

    public function invoice($id)
    {
        $order = Order::where('id',$id)->first();
        $order_detail = OrderDetail::where('order_id',$id)->get();
        $customer_data = Customer::where('id',$order->customer_id)->first();
        return view('admin.invoice', compact('order','order_detail','customer_data'));
    }

    public function invoice_edit($id)
    {
        $order = Order::where('id',$id)->first();
        $order_detail = OrderDetail::where('order_id',$id)->get();
        $customer_data = Customer::where('id',$order->customer_id)->first();
        return view('admin.invoice_edit', compact('order','order_detail','customer_data'));
    }

    public function invoice_update(Request $request)
    {
        $order = Order::where('id',$request->order_id)->first();
        $order->status = $request->status;
        $order->save();
        return redirect()->route('admin_orders')->with('success','Order Status Updated Successfully');
    }

    public function delete($id)
    {
        $obj = Order::where('id',$id)->delete();
        $obj = OrderDetail::where('order_id',$id)->delete();

        return redirect()->back()->with('success', 'Order is deleted successfully');
    }
}
