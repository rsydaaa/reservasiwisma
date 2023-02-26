@extends('front.layout.app')

@section('main_content')
<div class="page-top">
    <div class="bg"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Detail Transaksi</h2>
            </div>
        </div>
    </div>
</div>
<div class="page-content">
    <div class="container">
        <div class="row cart">
            <div class="col-md-12">
                <div class="invoice">
                    <div class="invoice-print">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="invoice-title">
                                    <h2>Invoice</h2>
                                    <div class="invoice-number">Order #{{ $order->order_no }}</div>
                                    @if($order->status == 'Pending')
                                    <div class="invoice-number">Order Status
                                        <span class="badge badge-warning">Pending</span>
                                    </div>
                                    @elseif($order->status == 'Completed')
                                    <div class="invoice-number">Order Status
                                        <span class="badge badge-success">Completed</span>
                                    </div>
                                    @elseif($order->status == 'Cancel')
                                    <div class="invoice-number">Order Status
                                        <span class="badge badge-danger">Batal</span>
                                    </div>
                                    @endif
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-6">
                                        <address>
                                            <strong>Invoice To</strong><br>
                                            {{ Auth::guard('customer')->user()->name }}<br>
                                            {{ Auth::guard('customer')->user()->address }},<br>
                                            {{ Auth::guard('customer')->user()->state }}, {{ Auth::guard('customer')->user()->city }}, {{ Auth::guard('customer')->user()->zip }}
                                        </address>
                                    </div>
                                    <div class="col-md-6 text-md-right">
                                        <address>
                                            <strong>Invoice Date</strong><br>
                                            {{ $order->booking_date }}
                                        </address>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-md-12">
                                <div class="section-title">Order Summary</div>
                                <p class="section-lead">Hotel room information are given below in detail:</p>
                                <hr class="invoice-above-table">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover table-md">
                                        <tr>
                                            <th>SL</th>
                                            <th>Room Name</th>
                                            <th class="text-center">Checkin Date</th>
                                            <th class="text-center">Checkout Date</th>
                                            <th class="text-center">Number of Adult</th>
                                            <th class="text-center">Number of Children</th>
                                            <th class="text-right">Subtotal</th>
                                        </tr>
                                        @php $total = 0; @endphp
                                        @foreach($order_detail as $item)
                                        @php
                                        $room_data = \App\Models\Room::where('id',$item->room_id)->first();
                                        @endphp
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $room_data->name }}</td>
                                            <td class="text-center">{{ $item->checkin_date }}</td>
                                            <td class="text-center">{{ $item->checkout_date }}</td>
                                            <td class="text-center">{{ $item->adult }}</td>
                                            <td class="text-center">{{ $item->children }}</td>
                                            <td class="text-right">
                                                @php
                                                $d1 = explode('/',$item->checkin_date);
                                                $d2 = explode('/',$item->checkout_date);
                                                $d1_new = $d1[2].'-'.$d1[1].'-'.$d1[0];
                                                $d2_new = $d2[2].'-'.$d2[1].'-'.$d2[0];
                                                $t1 = strtotime($d1_new);
                                                $t2 = strtotime($d2_new);
                                                $diff = ($t2-$t1)/60/60/24;
                                                $sub = $room_data->price*$diff;
                                                @endphp
                                                Rp. {{ $sub }}
                                            </td>
                                        </tr>
                                        @php
                                        $total += $sub;
                                        @endphp
                                        @endforeach
                                    </table>
                                </div>
                                <div class="row mt-4">
                                    <div class="col-lg-12 text-right">
                                        <div class="invoice-detail-item">
                                            <div class="invoice-detail-name">Total</div>
                                            <div class="invoice-detail-value invoice-detail-value-lg">Rp. {{ $total }}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="about-print-button">
                    <div class="text-md-right">
                        {{-- <h4>Metode Pembayaran Midtrans</h4> --}}
                        <span class="badge badge-info">Metode Pembayaran Midtrans. Konfirmasi otomatis setelah pembayaran sukses. Harap muat ulang halaman ini</span>
                        <div id="midtrans-button"></div>
                        @php
                        use Midtrans\Snap;
                        use Midtrans\Config;
                        use Midtrans\Notification;
                        use App\Models\Order;
                        // Konfigurasi midtrans
                        Config::$serverKey = config('services.midtrans.serverKey');
                        Config::$isProduction = config('services.midtrans.isProduction');
                        Config::$isSanitized = config('services.midtrans.isSanitized');
                        Config::$is3ds = config('services.midtrans.is3ds');
                        $cents = $order->paid_amount;
                        $customer_email = Auth::guard('customer')->user()->email;
                        $midtrans_client_key = config('services.midtrans.clientKey');

                        @endphp
                        <button id="midtrans-btn" class="btn btn-group-sm btn-success midtrans-btn">Bayar</button>
                        {{-- <pre><div id="result-json">JSON result will appear here after payment:<br></div></pre> --}}
                        <script src="https://app.sandbox.midtrans.com/snap/snap.js" data-client-key="{{ $midtrans_client_key }}"></script>
                            <script type="text/javascript">
                                document.getElementById('midtrans-btn').onclick = function(){
                                    // SnapToken acquired from previous step
                                    snap.pay('{{$order->snap_token}}', {
                                        // Optional
                                        onSuccess: function(result){
                                            // document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
                                            // document.getElementById('midtrans-btn').style.display = 'none';
                                            // $(".midtrans-btn").hide();
                                        },
                                        // Optional
                                        onPending: function(result){
                                            // document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
                                        },
                                        // Optional
                                        onError: function(result){
                                        // document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
                                        }
                                    });
                                };
                        </script>
                        {{-- <a href="javascript:window.print();" class="btn btn-warning btn-icon icon-left text-white print-invoice-button"><i class="fa fa-print"></i> Print</a> --}}
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
@endsection
