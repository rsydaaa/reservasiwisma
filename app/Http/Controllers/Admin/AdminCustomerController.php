<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customer;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class AdminCustomerController extends Controller
{
    public function index()
    {
        $customers = Customer::get();
        return view('admin.customer', compact('customers'));
    }
    public function add()
    {
        $all_customer = Customer::get();
        return view('admin.customer_add',compact('all_customer'));
    }

    public function store(Request $request)
    { 
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:customers',
            'password' => 'required',
            'retype_password' =>'required|same:password'
        ]);


        $token = hash('sha256', time());
        $password = Hash::make($request->password);
        $verification_link = url('signup-verify/'.$request->email.'/'.$token);

        $obj = new Customer();
        $obj->name = $request->name;
        $obj->email = $request->email;
        $obj->password = $password;
        $obj->token = $token;
        $obj->status = 1;
        $obj->save();

        // Send email
        $subject = 'Sign Up Verification';
        $message = 'Please click on the link below to confirm sign up process:<br>';
        $message .= '<a href="'.$verification_link.'">';
        $message .= $verification_link;
        $message .= '</a>';

        //Mail::to($request->email)->send(new Websitemail($subject,$message));

        return redirect()->back()->with('success', 'To complete the signup, please check your email and click on the link');

    }
    

    public function change_status($id)
    {
        $customer_data = Customer::where('id',$id)->first();
        if($customer_data->status == 1) {
            $customer_data->status = 0;
        } else {
            $customer_data->status = 1;
        }
        $customer_data->update();
        return redirect()->back()->with('success', 'Status is changed successfully.');
    }
}
