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
                        <h4>Metode Pembayaran Midtrans</h4>
                        <div id="midtrans-button"></div>
                        @php
                        use Midtrans\Snap;
                        use Midtrans\Config;
                        use Midtrans\Notification;
                        use App\Models\BookedRoom;
                        use App\Models\Room;
                        use App\Models\Customer;
                        use App\Models\Order;
                        use App\Models\OrderDetail;
                        // Konfigurasi midtrans
                        Config::$serverKey = config('services.midtrans.serverKey');
                        Config::$isProduction = config('services.midtrans.isProduction');
                        Config::$isSanitized = config('services.midtrans.isSanitized');
                        Config::$is3ds = config('services.midtrans.is3ds');
                        $cents = $total_price;
                        $customer_email = Auth::guard('customer')->user()->email;
                        $midtrans_client_key = config('services.midtrans.clientKey');
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
                        $snapToken = Snap::getSnapToken($params);

                        $statement = DB::select("SHOW TABLE STATUS LIKE 'orders'");
                        $ai_id = $statement[0]->Auto_increment;

                        $obj = new Order();
                        $obj->customer_id = Auth::guard('customer')->user()->id;
                        $obj->order_no = $order_no;
                        $obj->transaction_id = $order_no;
                        $obj->payment_method = 'Midtrans';
                        $obj->snap_token = $snapToken;
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
                {{-- <form action="{{ route('midtrans',$total_price) }}" method="post"> --}}
                    @csrf
                    <button id="midtrans-btn" class="btn btn-group-sm btn-success midtrans-btn">Bayar</button>
                    {{-- <pre><div id="result-json">JSON result will appear here after payment:<br></div></pre> --}}
                    <script src="https://app.sandbox.midtrans.com/snap/snap.js" data-client-key="{{ $midtrans_client_key }}"></script>
                        <script type="text/javascript">
                            document.getElementById('midtrans-btn').onclick = function(){
                                // SnapToken acquired from previous step
                                snap.pay('{{$snapToken}}', {
                                    // Optional
                                    onSuccess: function(result){
                                        document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
                                    },
                                    // Optional
                                    onPending: function(result){
                                        document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
                                    },
                                    // Optional
                                    onError: function(result){
                                    document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
                                    }
                                });
                            };
                    </script>
                {{-- </form> --}}
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
