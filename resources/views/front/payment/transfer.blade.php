@extends('front.layout.app')

@section('main_content')

<div class="page-top">
    <div class="bg"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{{ $global_page_data->payment_heading }}</h2>
            </div>
        </div>
    </div>
</div>
<div class="page-content">
    <div class="container">
        <div class="row  mb-2 text-center">
            @foreach ($rekening as $key)
                <div class="col-md-3">
                    <div class="card text-white bg-info mb-3 "
                        style="max-width: 18rem;">
                        <div class="card-header">{{ $key->bank_name }}</div>
                        <div class="card-body">
                            <h5 class="card-title">{{ $key->no_rekening }}</h5>
                            <p class="card-text">Atas Nama {{ $key->atas_nama }}</p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 checkout-left mb_30">
                @php
                $arr_cart_room_id = array();
                $i=0;
                foreach(session()->get('cart_room_id') as $value) {
                    $arr_cart_room_id[$i] = $value;
                    $i++;
                }
                $arr_cart_checkin_date = array();
                $i=0;
                foreach(session()->get('cart_checkin_date') as $value) {
                    $arr_cart_checkin_date[$i] = $value;
                    $i++;
                }
                $arr_cart_checkout_date = array();
                $i=0;
                foreach(session()->get('cart_checkout_date') as $value) {
                    $arr_cart_checkout_date[$i] = $value;
                    $i++;
                }
                $arr_cart_adult = array();
                $i=0;
                foreach(session()->get('cart_adult') as $value) {
                    $arr_cart_adult[$i] = $value;
                    $i++;
                }
                $arr_cart_children = array();
                $i=0;
                foreach(session()->get('cart_children') as $value) {
                    $arr_cart_children[$i] = $value;
                    $i++;
                }
                $total_price = 0;
                for($i=0;$i<count($arr_cart_room_id);$i++)
                {
                    $room_data = DB::table('rooms')->where('id',$arr_cart_room_id[$i])->first();
                    $d1 = explode('/',$arr_cart_checkin_date[$i]);
                    $d2 = explode('/',$arr_cart_checkout_date[$i]);
                    $d1_new = $d1[2].'-'.$d1[1].'-'.$d1[0];
                    $d2_new = $d2[2].'-'.$d2[1].'-'.$d2[0];
                    $t1 = strtotime($d1_new);
                    $t2 = strtotime($d2_new);
                    $diff = ($t2-$t1)/60/60/24;
                    $total_price = $total_price+($room_data->price*$diff);
                }
                @endphp
                    <div class="mt_20">
                        <h4>Metode Pembayaran Bank Transfer</h4>
                        <span class="mt_20">Anda boleh menutup halaman ini. Upload bukti transfer juga tersedia di menu Transaksi.</span>

                        @php

                        use App\Models\BookedRoom;
                        use App\Models\Room;
                        use App\Models\Customer;
                        use App\Models\Order;
                        use App\Models\OrderDetail;

                        $cents = $total_price;
                        $customer_email = Auth::guard('customer')->user()->email;
                        $stripe_publishable_key = 'SB-Mid-client-q-f6xn-itJmypXeD';
                        $order_no = time();
                        $params = array(
                            'transaction_details' => array(
                                'order_id' => $order_no,
                                'gross_amount' => $cents,
                            ),
                            'customer_details' => array(
                                'first_name'    => Auth::guard('customer')->user()->name,
                                'last_name'     => Auth::guard('customer')->user()->name,
                                'email' => $customer_email,
                                'phone'         => Auth::guard('customer')->user()->phone,
                            ),
                        );

                        $statement = DB::select("SHOW TABLE STATUS LIKE 'orders'");
                        $ai_id = $statement[0]->Auto_increment;

                        $obj = new Order();
                        $obj->customer_id = Auth::guard('customer')->user()->id;
                        $obj->order_no = $order_no;
                        $obj->transaction_id = $order_no;
                        $obj->payment_method = 'Bank Transfer';
                        $obj->snap_token = '';
                        $obj->card_last_digit = '';
                        $obj->paid_amount = $cents;
                        $obj->booking_date = date('d/m/Y');
                        $obj->status = 'Pending';
                        $obj->save();

                        $arr_cart_room_id = array();
                        $i=0;
                        foreach(session()->get('cart_room_id') as $value) {
                            $arr_cart_room_id[$i] = $value;
                            $i++;
                        }

                        $arr_cart_checkin_date = array();
                        $i=0;
                        foreach(session()->get('cart_checkin_date') as $value) {
                            $arr_cart_checkin_date[$i] = $value;
                            $i++;
                        }

                        $arr_cart_checkout_date = array();
                        $i=0;
                        foreach(session()->get('cart_checkout_date') as $value) {
                            $arr_cart_checkout_date[$i] = $value;
                            $i++;
                        }

                        $arr_cart_adult = array();
                        $i=0;
                        foreach(session()->get('cart_adult') as $value) {
                            $arr_cart_adult[$i] = $value;
                            $i++;
                        }

                        $arr_cart_children = array();
                        $i=0;
                        foreach(session()->get('cart_children') as $value) {
                            $arr_cart_children[$i] = $value;
                            $i++;
                        }

                        for($i=0;$i<count($arr_cart_room_id);$i++)
                        {
                            $r_info = Room::where('id',$arr_cart_room_id[$i])->first();
                            $d1 = explode('/',$arr_cart_checkin_date[$i]);
                            $d2 = explode('/',$arr_cart_checkout_date[$i]);
                            $d1_new = $d1[2].'-'.$d1[1].'-'.$d1[0];
                            $d2_new = $d2[2].'-'.$d2[1].'-'.$d2[0];
                            $t1 = strtotime($d1_new);
                            $t2 = strtotime($d2_new);
                            $diff = ($t2-$t1)/60/60/24;
                            $sub = $r_info->price*$diff;

                            $obj = new OrderDetail();
                            $obj->order_id = $ai_id;
                            $obj->room_id = $arr_cart_room_id[$i];
                            $obj->order_no = $order_no;
                            $obj->checkin_date = $arr_cart_checkin_date[$i];
                            $obj->checkout_date = $arr_cart_checkout_date[$i];
                            $obj->adult = $arr_cart_adult[$i];
                            $obj->children = $arr_cart_children[$i];
                            $obj->subtotal = $sub;
                            $obj->save();

                            while(1) {
                                if($t1>=$t2) {
                                    break;
                                }

                                $obj = new BookedRoom();
                                $obj->booking_date = date('d/m/Y',$t1);
                                $obj->order_no = $order_no;
                                $obj->room_id = $arr_cart_room_id[$i];
                                $obj->save();

                                $t1 = strtotime('+1 day',$t1);
                            }

                        }

                @endphp
                <form action="{{ route('kirimbukti') }}"
                    method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group mt-4">
                        <label for="">Upload Bukti Pembayaran sekarang.</label>
                        <input type="hidden" name="order_no" value="{{ $order_no }}">
                        <input type="file" name="bukti_pembayaran" id=""
                            class="form-control" required>
                    </div>
                    <div class="text-right mt-4">
                        <button type="submit" class="btn btn-primary">Kirim</button>
                    </div>
                </form>
            </div>

            </div>
            <div class="col-lg-4 col-md-4 checkout-right">
                <div class="inner">
                    <h4 class="mb_10">Billing Details</h4>
                    <div>
                        Name: {{ session()->get('billing_name') }}
                    </div>
                    <div>
                        Email: {{ session()->get('billing_email') }}
                    </div>
                    <div>
                        Phone: {{ session()->get('billing_phone') }}
                    </div>
                    <div>
                        Country: {{ session()->get('billing_country') }}
                    </div>
                    <div>
                        Address: {{ session()->get('billing_address') }}
                    </div>
                    <div>
                        State: {{ session()->get('billing_state') }}
                    </div>
                    <div>
                        City: {{ session()->get('billing_city') }}
                    </div>
                    <div>
                        Zip: {{ session()->get('billing_zip') }}
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 checkout-right">
                <div class="inner">
                    <h4 class="mb_10">Cart Details</h4>
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                                @php
                                $arr_cart_room_id = array();
                                $i=0;
                                foreach(session()->get('cart_room_id') as $value) {
                                    $arr_cart_room_id[$i] = $value;
                                    $i++;
                                }

                                $arr_cart_checkin_date = array();
                                $i=0;
                                foreach(session()->get('cart_checkin_date') as $value) {
                                    $arr_cart_checkin_date[$i] = $value;
                                    $i++;
                                }

                                $arr_cart_checkout_date = array();
                                $i=0;
                                foreach(session()->get('cart_checkout_date') as $value) {
                                    $arr_cart_checkout_date[$i] = $value;
                                    $i++;
                                }

                                $arr_cart_adult = array();
                                $i=0;
                                foreach(session()->get('cart_adult') as $value) {
                                    $arr_cart_adult[$i] = $value;
                                    $i++;
                                }

                                $arr_cart_children = array();
                                $i=0;
                                foreach(session()->get('cart_children') as $value) {
                                    $arr_cart_children[$i] = $value;
                                    $i++;
                                }

                                $total_price = 0;
                                for($i=0;$i<count($arr_cart_room_id);$i++)
                                {
                                    $room_data = DB::table('rooms')->where('id',$arr_cart_room_id[$i])->first();
                                    @endphp

                                    <tr>
                                        <td>
                                            {{ $room_data->name }}
                                            <br>
                                            ({{ $arr_cart_checkin_date[$i] }} - {{ $arr_cart_checkout_date[$i] }})
                                            <br>
                                            Adult: {{ $arr_cart_adult[$i] }}, Children: {{ $arr_cart_children[$i] }}
                                        </td>
                                        <td class="p_price">
                                            @php
                                                $d1 = explode('/',$arr_cart_checkin_date[$i]);
                                                $d2 = explode('/',$arr_cart_checkout_date[$i]);
                                                $d1_new = $d1[2].'-'.$d1[1].'-'.$d1[0];
                                                $d2_new = $d2[2].'-'.$d2[1].'-'.$d2[0];
                                                $t1 = strtotime($d1_new);
                                                $t2 = strtotime($d2_new);
                                                $diff = ($t2-$t1)/60/60/24;
                                                echo 'Rp. '.$room_data->price*$diff;
                                            @endphp
                                        </td>
                                    </tr>
                                    @php
                                    $total_price = $total_price+($room_data->price*$diff);
                                }
                                @endphp
                                <tr>
                                    <td><b>Total:</b></td>
                                    <td class="p_price"><b>Rp. {{ $total_price }}</b></td>
                                </tr>
                            </tbody>
                        </table>
                        @php
                            $order_id = Order::where('order_no', $order_no)->orderBy('id','desc')->first();
                            if ($order_id) {
                                Session::forget('cart_room_id');
                                Session::forget('cart_checkin_date');
                                Session::forget('cart_checkout_date');
                                Session::forget('cart_adult');
                                Session::forget('cart_children');
                            } else {
                                //
                            }
                        @endphp
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
